package com.pocket.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pocket.service.iface.MenuService;
import com.pocket.sql.bean.Menu;
import com.pocket.sql.dao.MenuDAO;


public class MenuServiceImpl implements MenuService{
	MenuDAO menuDAO;

	public MenuDAO getMenuDAO() {
		return menuDAO;
	}

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public List myLoad() {
		
		return menuDAO.findAll();
	}

	public Menu myShow(Integer id) {
		ActionContext.getContext().getSession().put("menuPrice",menuDAO.findById(id).getPrice() );
		return menuDAO.findById(id);
	}

	public List myRanking() {
		List list =new ArrayList();
		for(int i=0;i<=2;i++){
			list.add(menuDAO.ranking().get(i));
		}
		return  list;
	}

	public List menuShow() {
	
		return 	menuDAO.findAll();
	}

	public void myAdd(Menu menu) {
		System.out.println(menu.getPath());
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		menu.setLaunchtime(dateFormat.format(now));
		menu.setStatus("0");
		menu.setSum("0");
	
		menuDAO.save(menu);
		
	}

	public void myDel(Integer id) {
		menuDAO.delete(menuDAO.findById(id));
		
	}

	public Menu myMer(Integer id) {
		
		return menuDAO.findById(id);
	}

	public void mySave(Menu menu) {
		menuDAO.merge(menu);
	}

	public List mysearch(Object dishes) {

		System.out.println(menuDAO.mysearch(dishes).size());
		return menuDAO.mysearch(dishes);
	}
	
}
