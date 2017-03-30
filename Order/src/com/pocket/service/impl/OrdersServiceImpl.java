package com.pocket.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pocket.service.iface.OrdersService;
import com.pocket.sql.bean.Client;
import com.pocket.sql.bean.Orders;
import com.pocket.sql.dao.ClientDAO;
import com.pocket.sql.dao.MenuDAO;
import com.pocket.sql.dao.OrdersDAO;

public class OrdersServiceImpl implements OrdersService{
	OrdersDAO ordersDAO;
	ClientDAO clientDAO;
	Client client;
	MenuDAO menuDAO;
	
	public MenuDAO getMenuDAO() {
		return menuDAO;
	}

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public ClientDAO getClientDAO() {
		return clientDAO;
	}

	public void setClientDAO(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}

	public void setOrdersDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}

	public List<Orders> show(Integer id) {
		return ordersDAO.findByClient(id);
	}

	public boolean addOrders(Orders orders) {
		
//		Integer id =Integer.parseInt(ActionContext.getContext().getSession().get("loginid").toString());
			Integer id=orders.getClient().getId();
			Client client=clientDAO.findById(id);
			Double clientMoney=client.getMoney();
			
			//int menuPrice=Integer.parseInt(menuDAO.findById(Integer.parseInt(ActionContext.getContext().getSession().get("detailId").toString())).getPrice());
			double menuPrice=Double.valueOf(orders.getPrice())*Double.valueOf(orders.getSum());
			System.out.println("menuPrice="+menuPrice);
			double  price=clientMoney-menuPrice;
		if(price<0){
				
				System.out.println("meiqian"+price);
				return false;
			}else{
				System.out.println(price);
				
				client.setMoney(price);
				clientDAO.merge(client);
				
				Date now = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				orders.setDowntime(dateFormat.format(now));
				orders.setPrice(menuPrice+"");
				orders.setIscheckout(1);
				ordersDAO.save(orders);
				return true;
				
			}

	}

	public void myDel(Integer id) {
		System.out.println("id="+id+"'.......'"+ordersDAO.findById(id));
		ordersDAO.delete(ordersDAO.findById(id));
		
	}

	public List ordersShow() {
		return ordersDAO.findAll();
	}

	public List processShow() {
		// TODO Auto-generated method stub
		return ordersDAO.findByIscheckout(1);
	}

	public void ship(Integer id) {
		Orders orders=ordersDAO.findById(id);
		if(orders.getIscheckout()==1){
			orders.setIscheckout(0);
		}
		
		ordersDAO.merge(orders);
		
		
	}

	public List today() {
		Date dt=new Date();
		SimpleDateFormat matter1=new SimpleDateFormat("yyyy/MM/dd");
	   
		return  ordersDAO.findByMyDate(matter1.format(dt));
	}
	
}
