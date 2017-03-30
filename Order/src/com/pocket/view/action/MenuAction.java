package com.pocket.view.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.MenuService;
import com.pocket.service.iface.ReviewService;
import com.pocket.sql.bean.Menu;
import com.pocket.util.Pagination;

public class MenuAction extends ActionSupport {
	Menu menu;
	MenuService menuService;
	Integer id;
	ReviewService reviewService;
	Integer currentIndex;
	
	public Integer getCurrentIndex() {
		return currentIndex;
	}

	public void setCurrentIndex(Integer currentIndex) {
		this.currentIndex = currentIndex;
	}

	public ReviewService getReviewService() {
		return reviewService;
	}

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	

	public String myIndex(){
		ActionContext.getContext().getSession().put("menuload", menuService.myLoad());
		return "ok";
	}
	public String myDetail(){
		ActionContext.getContext().getSession().put("rankingList", menuService.myRanking());
		ActionContext.getContext().getSession().put("detailList", menuService.myShow(id));
		ActionContext.getContext().getSession().put("detailId", id);
		ActionContext.getContext().getSession().put("reviewList", reviewService.myShow(id));
		if(currentIndex==null)
			currentIndex=0;
		Pagination pg=reviewService.findUserinfoByPage(3, currentIndex);
		ActionContext.getContext().put("pg",pg);
		ActionContext.getContext().put("reviewPagination",pg.getItems());
		
		return "detail";
	}
	//后台
	public String menuShow(){
		ActionContext.getContext().getSession().put("menuShow", menuService.menuShow());
		return "show";
	}
	
	
	
	
	    private List<File> file;
	    private List<String> fileFileName;
	    private List<String> fileContentType;
	    
	    public List<File> getFile() {
			return file;
		}

		public void setFile(List<File> file) {
			this.file = file;
		}

		public List<String> getFileFileName() {
			return fileFileName;
		}

		public void setFileFileName(List<String> fileFileName) {
			this.fileFileName = fileFileName;
		}

		public List<String> getFileContentType() {
			return fileContentType;
		}

		public void setFileContentType(List<String> fileContentType) {
			this.fileContentType = fileContentType;
		}

	public String myAdd() throws IOException{
		
		//得到工程保存图片的路径
		System.out.println(file+menu.getSynopsis()+menu.getPrice()+menu.getDishes());
        String root = ServletActionContext.getRequest().getRealPath("/upload");
        System.out.println(root);
        //循环上传的文件
        for(int i = 0 ; i < file.size() ; i ++){
            InputStream is = new FileInputStream(file.get(i));
            menu.setPath("upload/"+this.getFileFileName().get(i));
            //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
            File destFile = new File(root,this.getFileFileName().get(i));
            
            //把图片写入到上面设置的路径里
            OutputStream os = new FileOutputStream(destFile);
            byte[] buffer = new byte[400];
            int length  = 0 ;
            while((length = is.read(buffer))>0){
                os.write(buffer, 0, length);
            }
            is.close();
            os.close();
        }
		
        System.out.println(menu.getPath());
		menuService.myAdd(menu);
		return "showmenu";
	}
	public String myDel(){

		menuService.myDel(id);
		return "showmenu";
	}
	public String myEdit(){
		ActionContext.getContext().getSession().put("menuMer", menuService.myMer(id));
		return "mer";
	}
	
	public String mySave() throws IOException{
		
	
		
		//得到工程保存图片的路径
        String root = ServletActionContext.getRequest().getRealPath("/upload");

        System.out.println(file.size());
        //循环上传的文件
        for(int i = 0 ; i < file.size() ; i ++){
            InputStream is = new FileInputStream(file.get(i));
            menu.setPath("upload/"+this.getFileFileName().get(i));
            //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
            File destFile = new File(root,this.getFileFileName().get(i));
            
            //把图片写入到上面设置的路径里
            OutputStream os = new FileOutputStream(destFile);
            byte[] buffer = new byte[400];
            int length  = 0 ;
            while((length = is.read(buffer))>0){
                os.write(buffer, 0, length);
            }
            is.close();
            os.close();
        }
		
		menuService.mySave(menu);

		return "showmenu";
	}
	public String search(){
		ActionContext.getContext().getSession().put("searchList", menuService.mysearch(menu.getDishes()));
		return "search";
	}
}
