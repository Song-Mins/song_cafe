package com.songmin.song.domain;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class UserDto {
	private String id;
	private String pwd;
	private String name;
	private Date birth;
	private String email;
	private String phone;
	private Date reg_date;
	private List<String> join_cafe;

	public UserDto() {}
	public UserDto(String id, String pwd, String name, Date birth, String email, String phone) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
	}
	public UserDto(String id, String pwd, String name, Date birth, String email, String phone, Date reg_date) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public List<String> getJoin_cafe() {
		return join_cafe;
	}

	public void setJoin_cafe(List<String> join_cafe) {
		this.join_cafe = join_cafe;
	}

	@Override
	public String toString() {
		return "UserDto{" +
				"id='" + id + '\'' +
				", pwd='" + pwd + '\'' +
				", name='" + name + '\'' +
				", birth=" + birth +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", reg_date=" + reg_date +
				'}';
	}
}











