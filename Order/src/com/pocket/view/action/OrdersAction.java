package com.pocket.view.action;


import java.io.IOException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.OrdersService;
import com.pocket.sql.bean.Orders;
import com.pocket.util.Struts2Utils;




@Namespace("/")
@ParentPackage("struts-default")
public class OrdersAction extends ActionSupport {
	private	OrdersService ordersService;
	private	Integer id;
	private	Orders orders;
	private String  str;
	private String price;


	public String getStr() {
		return str;
	}



	public void setStr(String str) {
		this.str = str;
	}



	public Orders getOrders() {
		return orders;
	}



	public void setOrders(Orders orders) {
		this.orders = orders;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public OrdersService getOrdersService() {
		return ordersService;
	}



	public void setOrdersService(OrdersService ordersService) {
		this.ordersService = ordersService;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}

	@Action(value="/myOrders", results={@Result(name="input", location="/page/order.jsp")})
	public String myOrders(){

		ActionContext.getContext().getSession().put("ordersList",ordersService.show(id) );
		return "input";
	}

	@Action(value="/myAdd", results={@Result(name="jump", location="/jump/jumpOrder.jsp")})
	public String myAdd() throws IOException{
		System.out.println(orders);
		boolean  boo=	ordersService.addOrders(orders);
		if(boo){
			return "jump";

		}else{
			System.out.println("...........");
			Struts2Utils.renderText("true", "encoding:UTF-8");
			return null;
		}

	}

	@Action(
			value="/myDel",
			results={	
					@Result(name="jump2",type="redirect",location="/admin/OrdersAction!ordersDate"),
					@Result(name="jump3",type="redirect",location="/admin/OrdersAction!processShow"),
					@Result(name="jump4",type="redirect",location="/admin/OrdersAction!processShow")
			}
			)
	public String myDel(){
		System.out.println("........"+str);
		String[] astr = null;
		if(str!=null){
			astr=str.split("s");


			System.out.println(astr[0]+"..."+astr[1]);
			ordersService.myDel(Integer.valueOf(astr[0]));
			if(astr[1].equals("a")){
				System.out.println("走了a");
				return "jump2";	
			}
			else if(astr[1].equals("b")){
				System.out.println("走了b");
				return "jump3";	
			}
			else{
				System.out.println("走了c");
				return "jump4";	
			}
		}
		return null;
	}
	@Action(value="/ordersShow", results={@Result(name="show", location="/ordersList.jsp")})
	public String ordersShow(){
		ActionContext.getContext().getSession().put("showOrders", ordersService.ordersShow());
		return "show";
	}
	@Action(value="/processShow", results={@Result(name="process", location="/ordersProcess.jsp")})
	public String processShow(){
		ActionContext.getContext().getSession().put("processOrders", ordersService.processShow());
		return "process";
	}
	@Action(value="/Ship", results={@Result(name="jump2",type="redirect",location="/admin/OrdersAction!ordersDate")})
	public String Ship(){
		ordersService.ship(id);
		return "jump2";
	}
	@Action(value="/ordersDate", results={@Result(name="date", location="/ordersDate.jsp")})
	public String ordersDate(){

		ActionContext.getContext().put("today", ordersService.today());

		return "date";
	}

}
