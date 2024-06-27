package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class RecordNotFoundException extends RuntimeException {
	public RecordNotFoundException(String s) {
		super(s);
	}

}