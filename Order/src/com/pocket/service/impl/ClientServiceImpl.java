package com.pocket.service.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pocket.service.iface.ClientService;
import com.pocket.sql.bean.Client;
import com.pocket.sql.dao.ClientDAO;
//实现了ClientService接口

public class ClientServiceImpl implements ClientService{
	
	Client client;
	ClientDAO clientDAO;
	
	public ClientDAO getClientDAO() {
		return clientDAO;
	}

	public void setClientDAO(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	public Client login(Client client){
		List list = clientDAO.findByUsername(client.getUsername());
		if(list.isEmpty()){
			return null;
		}else{
			Client clientsql = (Client)list.get(0);
			if(clientsql.getPassword().equals(client.getPassword())){
				ActionContext.getContext().getSession().put("loginid", clientsql.getId());
				return clientsql;
			}else{
				return null;
			}
		}
	}

	public Client register(Client client) {
		client.setMoney(0);
		client.setLevel(0);
		clientDAO.save(client);
		return null;
	}

	public Client merge(Integer id) {
	
		return clientDAO.findById(id);
	}

	public Client mySave(Client client) {
		
		return clientDAO.merge(client);
	}
//显示用户列表
	public List clientShow() {
//调用用户的DAO  findAll获得全部用户信息
//return 返回  ClientAction
		return clientDAO.findAll();
	}

	public void myDel(Integer id) {
		clientDAO.delete(clientDAO.findById(id));
		
	}

	public void myEdit(Integer id) {
		Client client=clientDAO.findById(id);
		if(client.getLevel()==1){
			client.setLevel(0);
		}else{
			client.setLevel(1);
		}
		
		clientDAO.merge(client);
		
	}

}
