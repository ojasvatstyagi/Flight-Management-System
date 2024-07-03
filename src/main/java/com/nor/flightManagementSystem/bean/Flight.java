package com.nor.flightManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Flight {

    @Id
    private Long flightNo;
    private String carrierName;
    private Long routeId;
    private Integer seatCapacity;
    private String departure;
    private String arrival;
    private Integer seatBooked;

    public Flight() {
    	super();
    }


    public Flight(Long flightNo, String carrierName, Long routeId, Integer seatCapacity, String departure,
			String arrival) {
		super();
		this.flightNo = flightNo;
		this.carrierName = carrierName;
		this.routeId = routeId;
		this.seatCapacity = seatCapacity;
		this.departure = departure;
		this.arrival = arrival;
		this.seatBooked = 0;
	}

    
    public Long getFlightNo() {
    	return flightNo;
    }

	public Long getRouteId() {
		return routeId;
	}


	public void setRouteId(Long routeId) {
		this.routeId = routeId;
	}


	public String getDeparture() {
		return departure;
	}


	public void setDeparture(String departure) {
		this.departure = departure;
	}


	public String getArrival() {
		return arrival;
	}


	public void setArrival(String arrival) {
		this.arrival = arrival;
	}


	public void setFlightNo(Long flightNo) {
        this.flightNo = flightNo;
    }

    public String getCarrierName() {
        return carrierName;
    }

    public void setCarrierName(String carrierName) {
        this.carrierName = carrierName;
    }

    public Integer getSeatCapacity() {
        return seatCapacity;
    }

    public void setSeatCapacity(Integer seatCapacity) {
        this.seatCapacity = seatCapacity;
    }

    @Override
    public String toString() {
        return "Flight [flightNo=" + flightNo + ", carrierName=" + carrierName + ", seatCapacity=" + seatCapacity + "]";
    }


	public Integer getSeatBooked() {
		return seatBooked;
	}


	public void setSeatBooked(Integer seatBooked) {
		this.seatBooked = seatBooked;
	}
}
