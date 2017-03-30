package com.pocket.sql.bean;

/**
 * Basket entity. @author MyEclipse Persistence Tools
 */

public class Basket implements java.io.Serializable {

	// Fields

	private Integer id;
	private Menu menu;
	private Integer CId;

	// Constructors

	/** default constructor */
	public Basket() {
	}

	/** full constructor */
	public Basket(Menu menu, Integer CId) {
		this.menu = menu;
		this.CId = CId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Integer getCId() {
		return this.CId;
	}

	public void setCId(Integer CId) {
		this.CId = CId;
	}

}