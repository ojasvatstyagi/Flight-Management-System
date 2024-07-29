<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Invoice</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('/images/ticket2.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        
    }
    h1,h2 {
        color: rgb(25, 40, 89);
        text-align: center;
    }
    .ticket-details {
        margin-top: 20px;
        text-align: left;
    }
    .ticket-details label {
        font-size: 20px;
        margin-bottom: 5px;
        display: block;
        text-align: center;
    }
    .passenger-details {
        margin: 20px 140px;
        text-align: left;
        width: 50vw;
        border-radius: 10px;
        padding:10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    a {
        color: #007bff;
    	text-decoration: none;
        display: block;
        text-align: center;
        width: fit-content;
		margin: 10px auto; 
     }
	 a:hover {
        text-decoration: underline;
	 }
</style>
</head>
<body>
<div class="container">
    <h1>Ticket Invoice</h1>
    <div class="ticket-details">
        <label>Ticket Number: ${ticket.ticketNumber}</label>
        <label>Route ID: ${ticket.routeId}</label>
        <label>Flight Number: ${ticket.flightNumber}</label>
        <label>Carrier Name: ${ticket.flightName}</label>
        <label>Total Amount: ${ticket.totalAmount}</label>
        <h2>Passengers</h2>
        <c:forEach var="passenger" items="${passengers}">
            <div class="passenger-details">
                <label>Passenger Name: ${passenger.passengerName}</label>
                <label>Passenger Date of Birth: ${passenger.passengerDob}</label>
                <label>Fare: ${passenger.price}</label>
            </div>
        </c:forEach>
    </div>
    <a href="/index">Back to home</a>
</div>
</body>
</html>
