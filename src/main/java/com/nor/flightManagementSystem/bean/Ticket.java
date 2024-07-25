package com.nor.flightManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ticket {
	@Id
	private Long ticketNumber;
	private Long routeId;
	private Long flightNumber;
	private String flightName;
	private Double totalAmount;
	private String username; // Foreign key to User
	
	public Ticket() {
		super();
	}
	
	public Ticket(Long ticketNumber, Long routeId, Long flightNumber, String flightName, Double totalAmount, String username) {
		super();
		this.ticketNumber = ticketNumber;
		this.routeId = routeId;
		this.flightNumber = flightNumber;
		this.flightName = flightName;
		this.totalAmount = totalAmount;
		this.username = username;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Long getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(Long ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public Long getRouteId() {
		return routeId;
	}
	public void setRouteId(Long routeId) {
		this.routeId = routeId;
	}
	public Long getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(Long flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

}
