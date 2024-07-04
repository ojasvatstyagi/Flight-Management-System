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
        background: url('/images/flights.png') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        color: rgb(25, 40, 89);
    }
    .container {
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h1 {
        color: rgb(25, 40, 89);
    }
    .ticket-details {
        margin-top: 20px;
        text-align: left;
    }
    .ticket-details label {
        font-size: 18px;
        margin-bottom: 5px;
        display: block;
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
        <label>Flight Name: ${ticket.flightName}</label>
        <label>Total Amount: ${ticket.totalAmount}</label>
        <h2>Passengers</h2>
        <c:forEach var="passenger" items="${passengers}">
            <div class="passenger-details">
                <label>Passenger Name: ${passenger.passengerName}</label>
                <label>Passenger Date of Birth: ${passenger.passengerDob}</label>
                <label>Price: ${passenger.price}</label>
            </div>
        </c:forEach>
    </div>
    <a href="/index">Back to home</a>
</div>
</body>
</html>
