package com.pocket.sql.bean;

/**
 * Review entity. @author MyEclipse Persistence Tools
 */

public class Review implements java.io.Serializable {

	// Fields

	private Integer id;
	private Client client;
	private Menu menu;
	private String content;
	private String time;

	// Constructors

	/** default constructor */
	public Review() {
	}

	/** full constructor */
	public Review(Client client, Menu menu, String content, String time) {
		this.client = client;
		this.menu = menu;
		this.content = content;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}