package com.nor.flightManagementSystem.exception;

@SuppressWarnings("serial")
public class RecordAlreadyPresentException extends RuntimeException {
	public RecordAlreadyPresentException(String s) {
		super(s);
	}
}