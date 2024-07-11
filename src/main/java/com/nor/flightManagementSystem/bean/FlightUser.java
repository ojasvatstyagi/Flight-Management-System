package com.nor.flightManagementSystem.bean;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import javax.persistence.Entity;
import javax.persistence.Id;

@SuppressWarnings("serial")
@Entity
public class FlightUser extends User {

	@Id
	private String username;
	private String password;
	private String email;
	private String type;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public FlightUser(String username, String password, String type, String email, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		this.username = username;
		this.password = password;
		this.email = email;
		this.type = type;
	}

	@Override
	public String toString() {
		return "FlightUser [username=" + username + ", password=" + password + ", email=" + email + ", type=" + type + "]";
	}

	public FlightUser() {
		super("abc", "pqr", new ArrayList<>());
	}
}
