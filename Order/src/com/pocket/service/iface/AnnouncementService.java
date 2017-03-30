package com.pocket.service.iface;

import java.util.List;

import com.pocket.sql.bean.Announcement;



public interface AnnouncementService {
	public List myshow();

	public void myDel(Integer id);

	public void mySave(Announcement announcement);

	public void init();
}
