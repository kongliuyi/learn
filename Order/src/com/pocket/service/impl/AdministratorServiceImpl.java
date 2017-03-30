package com.pocket.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.pocket.service.iface.AdministratorService;

import com.pocket.sql.bean.Administrator;
import com.pocket.sql.dao.AdministratorDAO;



public class AdministratorServiceImpl implements AdministratorService {
	AdministratorDAO administratorDAO;
	Administrator administrator;
	

	public Administrator getAdministrator() {
		return administrator;
	}



	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}



	public AdministratorDAO getAdministratorDAO() {
		return administratorDAO;
	}



	public void setAdministratorDAO(AdministratorDAO administratorDAO) {
		this.administratorDAO = administratorDAO;
	}



	public List myShow() {
		
		return administratorDAO.findAll();
	}



	public void myDel(Integer id) {
		
		administratorDAO.delete(administratorDAO.findById(id));
		
	}



	public Administrator myAdd(Administrator administrator) {
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		administrator.setLasttime(dateFormat.format(now));
		administrator.setLevel(1);
		administratorDAO.save(administrator );
		return null;
	}



	public Administrator myLogin(Administrator administrator) {
		List list = administratorDAO.findByUsername(administrator.getUsername());
		if(list.isEmpty()){
			return null;
		}else{
			Administrator Administratorsql = (Administrator)list.get(0);
			if(Administratorsql.getPassword().equals(administrator.getPassword())){
				
				return Administratorsql;
			}else{
				return null;
		}
		}
	}



	public Administrator myMer(Integer id) {
	
		return 	administratorDAO.findById(id);
	}



	public Administrator mySave(Administrator administrator) {
		
		administrator.setLasttime(administrator.getLasttime());
		
		return administratorDAO.merge(administrator);
	}

}
