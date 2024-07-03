package com.nor.flightManagementSystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Passenger;

@Service
@Repository
public class PassengerDaoImpl implements PassengerDao{

	@Autowired
	private PassengerRepository repo;

	@Override
	public void save(Passenger passenger) {
		repo.save(passenger);
	}
}
