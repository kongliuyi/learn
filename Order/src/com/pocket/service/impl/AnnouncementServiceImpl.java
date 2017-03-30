package com.pocket.service.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pocket.service.iface.AnnouncementService;
import com.pocket.sql.bean.Announcement;
import com.pocket.sql.dao.AnnouncementDAO;

public class AnnouncementServiceImpl implements AnnouncementService {
	AnnouncementDAO announcementDAO;
	
	public AnnouncementDAO getAnnouncementDAO() {
		return announcementDAO;
	}

	public void setAnnouncementDAO(AnnouncementDAO announcementDAO) {
		this.announcementDAO = announcementDAO;
	}

	public List myshow() {
		// TODO Auto-generated method stub
		List<Announcement> list=announcementDAO.findAll();

		for(int i=0;i<list.size();i++){
			// <p>段落替换为换行 
			list.get(i).setContent(list.get(i).getContent().replaceAll("<p .*?>", "\r\n"));
			list.get(i).setContent(list.get(i).getContent().replaceAll("<br\\s*/?>", "\r\n"));
			list.get(i).setContent(list.get(i).getContent().replaceAll("\\<.*?>", ""));
			if(list.get(i).getContent().length()>80){
				list.get(i).setContent(list.get(i).getContent().substring(0,80));
			}
			
		}
		return list;
	}

	public void myDel(Integer id) {
		announcementDAO.delete(announcementDAO.findById(id));
		
	}

	public void mySave(Announcement announcement) {
	
		announcementDAO.save(announcement);
	}

	public void init() {
		ActionContext.getContext().getSession().put("newList", announcementDAO.findShow());
		
	}

}
