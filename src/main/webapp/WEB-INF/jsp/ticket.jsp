<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Invoice</title>
<style>
    /* Your existing CSS */
</style>
</head>
<body>
<div class="container">
    <h1>Ticket Invoice</h1>
    <div class="ticket-details">
        <label>Ticket Number: ${ticket.ticketNumber}</label>
        <label>Route ID: ${ticket.routeId}</label>
        <label>Flight Number: ${ticket.flightNumber}</label>
        <label>Carrier Name: ${ticket.carrierName}</label>
        <label>Total Amount: ${ticket.totalAmount}</label>
        <h2>Passengers</h2>
        <c:forEach var="passenger" items="${passengers}">
            <div class="passenger-details">
                <label>Passenger Name: ${passenger.passengerName}</label>
                <label>Passenger Date of Birth: ${passenger.passengerDOB}</label>
                <label>Fare: ${passenger.fare}</label>
            </div>
        </c:forEach>
    </div>
    <a href="/index">Back to home</a>
</div>
</body>
</html>
