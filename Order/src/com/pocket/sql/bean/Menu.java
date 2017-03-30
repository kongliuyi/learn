package com.pocket.sql.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */

public class Menu implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String dishes;
	private String price;
	private String synopsis;
	private String launchtime;
	private String path;
	private String status;
	private String sum;
	private Set orderses = new HashSet(0);
	private Set reviews = new HashSet(0);

	// Constructors

	/** default constructor */
	public Menu() {
	}

	/** minimal constructor */
	public Menu(String dishes, String price, String synopsis,
			String launchtime, String path, String status, String sum) {
		this.dishes = dishes;
		this.price = price;
		this.synopsis = synopsis;
		this.launchtime = launchtime;
		this.path = path;
		this.status = status;
		this.sum = sum;
	}

	/** full constructor */
	public Menu(String dishes, String price, String synopsis,
			String launchtime, String path, String status, String sum,
			Set orderses, Set reviews) {
		this.dishes = dishes;
		this.price = price;
		this.synopsis = synopsis;
		this.launchtime = launchtime;
		this.path = path;
		this.status = status;
		this.sum = sum;
		this.orderses = orderses;
		this.reviews = reviews;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDishes() {
		return this.dishes;
	}

	public void setDishes(String dishes) {
		this.dishes = dishes;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSynopsis() {
		return this.synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public String getLaunchtime() {
		return this.launchtime;
	}

	public void setLaunchtime(String launchtime) {
		this.launchtime = launchtime;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSum() {
		return this.sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public Set getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set orderses) {
		this.orderses = orderses;
	}

	public Set getReviews() {
		return this.reviews;
	}

	public void setReviews(Set reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", dishes=" + dishes + ", price=" + price + ", synopsis=" + synopsis + ", launchtime="
				+ launchtime + ", path=" + path + ", status=" + status + ", sum=" + sum + ", orderses=" + orderses
				+ ", reviews=" + reviews + "]";
	}

}