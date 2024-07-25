package com.nor.flightManagementSystem.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nor.flightManagementSystem.bean.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
	
	@Query("SELECT MAX(ticketNumber) FROM Ticket")
	public Long findLastTicketNumber();

	public List<Ticket> findByUsername(String username);
		
}
