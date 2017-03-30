package com.pocket.sql.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Client entity. @author MyEclipse Persistence Tools
 */

public class Client implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private Long telephone;
	private String address;
	private String email;
	private Double money;
	private Integer level;
	private Set reviews = new HashSet(0);

	// Constructors

	/** default constructor */
	public Client() {
	}

	/** minimal constructor */
	public Client(String username) {
		this.username = username;
	}

	public Client(String username, String password, Long telephone, String address, String email, Double money,
			Integer level, Set reviews) {
		super();
		this.username = username;
		this.password = password;
		this.telephone = telephone;
		this.address = address;
		this.email = email;
		this.money = money;
		this.level = level;
		this.reviews = reviews;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getTelephone() {
		return telephone;
	}

	public void setTelephone(Long telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(double i) {
		this.money = i;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Set getReviews() {
		return reviews;
	}

	public void setReviews(Set reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", username=" + username + ", password=" + password + ", telephone=" + telephone
				+ ", address=" + address + ", email=" + email + ", money=" + money + ", level=" + level + ", reviews="
				+ reviews + "]";
	}

	


}