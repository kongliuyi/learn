package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Administrator;

public interface AdministratorService {
	public List myShow();
	public void myDel(Integer id);
	public Administrator myAdd(Administrator administrator);
	public Administrator myLogin(Administrator administrator);
	public Administrator myMer(Integer id);
	public Administrator mySave(Administrator administrator);
}
