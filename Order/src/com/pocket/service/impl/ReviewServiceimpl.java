package com.pocket.service.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pocket.service.iface.ReviewService;
import com.pocket.sql.bean.Client;
import com.pocket.sql.bean.Menu;
import com.pocket.sql.bean.Review;
import com.pocket.sql.dao.ReviewDAO;
import com.pocket.util.Pagination;

public class ReviewServiceimpl implements ReviewService{

	ReviewDAO reviewDAO;
	Review review;
	
	


	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public ReviewDAO getReviewDAO() {
		return reviewDAO;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public List myShow(Integer id) {
		
		return reviewDAO.findMenu(id);
	}

	public void myAdd(Review review) {
		// TODO Auto-generated method stub
		reviewDAO.save(review);
	}

	public Pagination findUserinfoByPage(int pageSize, Integer startIndex) {
		String hsql="from Review where menu.id = "+ActionContext.getContext().getSession().get("detailId")+"";
		return reviewDAO.findPageByQuery(hsql, pageSize, startIndex);
		
	}

}
