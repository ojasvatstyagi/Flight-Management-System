package com.nor.flightManagementSystem.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity
public class Passenger {

	@EmbeddedId
	private TicketPassengerEmbed embeddedId;
	private String passengerName;
	private String passengerDob;
	private Double price;
	
	
	public Passenger(TicketPassengerEmbed embeddedId, String passengerName, String passengerDob, Double price) {
		super();
		this.embeddedId = embeddedId;
		this.passengerName = passengerName;
		this.passengerDob = passengerDob;
		this.price = price;
	}
	public TicketPassengerEmbed getEmbeddedId() {
		return embeddedId;
	}
	public void setEmbeddedId(TicketPassengerEmbed embeddedId) {
		this.embeddedId = embeddedId;
	}
	
	public Passenger() {
		super();
	}
	public String getPassengerName() {
		return passengerName;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public String getPassengerDob() {
		return passengerDob;
	}
	public void setPassengerDob(String passengerDob) {
		this.passengerDob = passengerDob;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
}
