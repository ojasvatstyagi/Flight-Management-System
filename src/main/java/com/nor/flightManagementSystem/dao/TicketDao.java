package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Ticket;

public interface TicketDao {
	public void save(Ticket ticket);
	public Long findLastTicketNumber();
	public Ticket findTicketByTicketNumber(Long ticketNumber);
	public void deleteByTicketNumber(Long ticketNumber);
	public List<Ticket> findAllTickets();
	public List<Ticket> findTicketsByUsername(String username);
}
