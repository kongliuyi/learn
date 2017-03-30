package com.pocket.view.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.BasketService;
import com.pocket.service.iface.MenuService;
import com.pocket.sql.bean.Basket;
import com.pocket.sql.bean.Menu;
import com.pocket.sql.dao.MenuDAO;

public class BasketAction extends ActionSupport {
	Basket basket;
	BasketService basketService;
	Integer id;

	MenuDAO menuDAO ;

	public MenuDAO getMenuDAO() {
		return menuDAO;
	}
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Basket getBasket() {
		return basket;
	}
	public void setBasket(Basket basket) {
		this.basket = basket;
	}
	public BasketService getBasketService() {
		return basketService;
	}
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	
	
	public String myAdd(){

	
		Menu menu =menuDAO.findById(id);
		System.out.println(menu.getId());
		Basket basket = new Basket();

		basket.setCId(Integer.parseInt(ActionContext.getContext().getSession().get("loginid").toString()));

		basket.setMenu(menu);
		basketService.myAdd(basket);
		return "ok";
	}
	
	public String myShow(){
		ActionContext.getContext().put("basketshow", basketService.myshow());
		return "show";
	}
}
