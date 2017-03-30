package com.pocket.view.action;

import java.text.SimpleDateFormat;
import java.util.Date;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pocket.service.iface.ReviewService;
import com.pocket.sql.bean.Client;
import com.pocket.sql.bean.Menu;
import com.pocket.sql.bean.Review;

import com.pocket.util.Pagination;

public class ReviewAction extends ActionSupport {
	Integer id;
	ReviewService reviewService;
	Review review;
	Client client;
	Menu menu;
	Integer currentIndex;
	
	public Integer getCurrentIndex() {
		return currentIndex;
	}

	public void setCurrentIndex(Integer currentIndex) {
		this.currentIndex = currentIndex;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public ReviewService getReviewService() {
		return reviewService;
	}

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	public Integer getId() {
		
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String myAdd(){
		System.out.println("!!!");
		System.out.println(review.getContent());
		review.setMenu(menu);
		review.setClient(client);
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		review.setTime(dateFormat.format(now));
		reviewService.myAdd(review);
		System.out.println("!!!!!!!!!!");
		return "ok";
	}
	public String a(){
		return "ok";
	}
	public String listUserinfoByPage(){
		if(currentIndex==null)
			currentIndex=0;
		Pagination pg=reviewService.findUserinfoByPage(3, currentIndex);
		ActionContext.getContext().put("pg",pg);
		
		ActionContext.getContext().put("userlist",pg.getItems());
		return "listuserinfo";
	}
	public String init(){
		if(currentIndex==null)
			currentIndex=0;
		Pagination pg=reviewService.findUserinfoByPage(3, currentIndex);
		ActionContext.getContext().put("pg",pg);
		return "init";
	}
}
