package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Client;


public interface ClientService {
	public Client login(Client client);
	public Client register(Client client);
	public Client merge(Integer id);
	public Client mySave(Client clinet);
//用户列表
	public List clientShow();
	public void myDel(Integer id);
	public void myEdit(Integer id);
	
	
}
