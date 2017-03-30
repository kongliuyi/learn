package com.pocket.sql.bean;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

	private Integer id;
	private Client client;
	private Menu menu;
	private String name;
	private String sum;
	private String downtime;
	private String telephone;
	private String address;
	private String price;
	private Integer ischeckout;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getDowntime() {
		return downtime;
	}
	public void setDowntime(String downtime) {
		this.downtime = downtime;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Integer getIscheckout() {
		return ischeckout;
	}
	public void setIscheckout(Integer ischeckout) {
		this.ischeckout = ischeckout;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", client=" + client + ", menu=" + menu + ", name=" + name + ", sum=" + sum
				+ ", downtime=" + downtime + ", telephone=" + telephone + ", address=" + address + ", price=" + price
				+ ", ischeckout=" + ischeckout + "]";
	}

	

}