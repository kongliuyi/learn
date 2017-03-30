package com.pocket.view.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.AdministratorService;
import com.pocket.sql.bean.Administrator;

public class AdministratorAction extends ActionSupport {
	AdministratorService administratorService;
	Integer id;
	Administrator administrator;





	public Administrator getAdministrator() {
		return administrator;
	}


	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public AdministratorService getAdministratorService() {
		return administratorService;
	}


	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
	}


	public String myShow(){

		ActionContext.getContext().getSession().put("adminList", administratorService.myShow());
		return "ok";
	}
	public String myDel(){
		administratorService.myDel(id);
		return "show";
	}
	public String myAdd(){
		administratorService.myAdd(administrator);
		return "show";
	}
	public String myLogin(){

		if( administratorService.myLogin(administrator)!=null){


			String str=	administratorService.myLogin(administrator).getUsername();


			ActionContext.getContext().getSession().put("adminuser",str);
			ActionContext.getContext().getSession().put("adminid", administratorService.myLogin(administrator).getId());
			ActionContext.getContext().getSession().put("adminlevel", administratorService.myLogin(administrator).getLevel());
			return "index";
		}else{
			return "fail";
		}

	}
	public String myEdit(){
		ActionContext.getContext().getSession().put("adminMer", administratorService.myMer(id));

		return "mer";
	}
	public String mySave(){
		

		System.out.println(administrator.getRealname());
		administratorService.mySave(administrator);
		return "show";
	}
}
