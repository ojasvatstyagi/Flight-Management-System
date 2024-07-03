package com.nor.flightManagementSystem.dao;

import com.nor.flightManagementSystem.bean.Ticket;

public interface TicketDao {
	public void save(Ticket ticket);
	public Long findLastTicketNumber();
}
