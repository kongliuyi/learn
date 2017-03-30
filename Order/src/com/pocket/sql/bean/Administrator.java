package com.pocket.sql.bean;

/**
 * Administrator entity. @author MyEclipse Persistence Tools
 */

public class Administrator implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer level;
	private String username;
	private String password;
	private String realname;
	private Long telephone;
	private String lasttime;

	// Constructors

	/** default constructor */
	public Administrator() {
	}

	public Administrator(Integer level, String username, String password, String realname, Long telephone,
			String lasttime) {
		super();
		this.level = level;
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.telephone = telephone;
		this.lasttime = lasttime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
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

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Long getTelephone() {
		return telephone;
	}

	public void setTelephone(Long telephone) {
		this.telephone = telephone;
	}

	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	@Override
	public String toString() {
		return "Administrator [id=" + id + ", level=" + level + ", username=" + username + ", password=" + password
				+ ", realname=" + realname + ", telephone=" + telephone + ", lasttime=" + lasttime + "]";
	}

	

}