package com.nor.flightManagementSystem.service;

import java.time.LocalDate;
import java.time.Period;

import org.springframework.stereotype.Service;

@Service
public class TicketService {
	public double calculatePassengerPrice(double basePrice, String dob) {
        int age = calculateAge(dob);
        if (age > 60) {
            return basePrice * 0.7;
        } else if (age < 14) {
            return basePrice * 0.5;
        }
        return basePrice;
    }
	
	private int calculateAge(String dob) {
        LocalDate birthDate = LocalDate.parse(dob);
        return Period.between(birthDate, LocalDate.now()).getYears();
    }
}
