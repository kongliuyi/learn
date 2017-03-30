package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Menu;

public interface  MenuService {
	public List myLoad();
	public Menu myShow(Integer id);
	public List myRanking();
	public List menuShow();
	public void myAdd(Menu menu);
	public void myDel(Integer id);
	public Menu myMer(Integer id);
	public void mySave(Menu menu);
	public List mysearch(Object dishes);
}
