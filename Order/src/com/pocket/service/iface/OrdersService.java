package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Orders;

public interface OrdersService {
	public List show(Integer id);
	public boolean addOrders(Orders orders);
	public void myDel(Integer id);
	public List ordersShow();
	public List processShow();
	public void ship(Integer id);
	public List today();
}
