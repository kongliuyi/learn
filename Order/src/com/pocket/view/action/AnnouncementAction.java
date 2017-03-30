package com.pocket.view.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.AnnouncementService;
import com.pocket.sql.bean.Announcement;

public class AnnouncementAction extends ActionSupport {
	AnnouncementService announcementService;
	Integer id;
	Announcement announcement;
	
	public Announcement getAnnouncement() {
		return announcement;
	}

	public void setAnnouncement(Announcement announcement) {
		this.announcement = announcement;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public AnnouncementService getAnnouncementService() {
		return announcementService;
	}

	public void setAnnouncementService(AnnouncementService announcementService) {
		this.announcementService = announcementService;
	}

	public String myShow(){
		ActionContext.getContext().getSession().put("announcementList",announcementService.myshow());
		return "show";
	}
	public String myDel(){
		announcementService.myDel(id);
		return "yubei";
	}
	public String myAdd(){
	    HttpServletRequest request = ServletActionContext.getRequest();
		/*System.out.println("得到"+request.getParameter("content1"));
		announcement.setContent(request.getParameter("content1"));*/
		announcement.setUsername(ActionContext.getContext().getSession().get("adminuser").toString());
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		announcement.setTime(dateFormat.format(now));
		announcementService.mySave(announcement);
		return "yubei";
	}
	public String init(){
		announcementService.init();
		return "init";
	}
}
