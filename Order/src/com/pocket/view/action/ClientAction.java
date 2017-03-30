package com.pocket.view.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.ClientService;
import com.pocket.sql.bean.Client;

public class ClientAction extends ActionSupport {
	Client client;
	ClientService clientService;
	Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ClientService getClientService() {
		return clientService;
	}

	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	
	
	
	public String myLogin(){
		ActionContext.getContext().getSession().put("loginuser", clientService.login(client));
		if(clientService.login(client)==null){		
			return "fail";
		}else{
			//Date now = new Date(); 
			//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			//System.out.println(dateFormat.format(now));
			ActionContext.getContext().getSession().put("loginname", client.getUsername());
			//ActionContext.getContext().getSession().put("loginid",client.getId());
			ActionContext.getContext().getSession().put("loginClient", clientService.merge(Integer.parseInt(ActionContext.getContext().getSession().get("loginid").toString())));
			return "ok";
		}
	
	}
	public String myRegister(){
		clientService.register(client);
		return "ok";
	}
	public String myData(){
	
		ActionContext.getContext().getSession().put("clientList", clientService.merge(id));
		return "merge";
	}
	public String myMerge(){
		clientService.mySave(client);
		return "input";
	}
	
	//显示userlist
	public String clientShow(){
		//添加clientShow  
		ActionContext.getContext().getSession().put("clientShow", clientService.clientShow());
	//strtus.xml
		return "show";
	}
	public String myDel(){
		clientService.myDel(id);
		return "clientShow";
	}
	public String myEdit(){
		clientService.myEdit(id);
		return "clientShow";
	}
}
