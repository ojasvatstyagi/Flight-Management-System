<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Ticket</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('/images/ticket2.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        color: rgb(25, 40, 89);
    }
    .container {
    	background-color: rgba(255, 255, 255, 0.8);
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        font-size: 20px;
        display: block;
        margin-bottom: 5px;
        color: #000;
    }
    .form-group input {
        width: 50%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid rgb(17 23 43);
        border-radius: 5px;
        box-sizing: border-box;
    }
    .container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 150px;
            margin: 0 auto;
        }
    .container button:hover {
            background-color: #45a049;
        }
    .container a {
            color: #007bff;
        	text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
	    .container a:hover {
	        text-decoration: underline;
	    }
</style>
</head>
<body>
    <div class="container">
        <h1>Ticket Invoice</h1>
        <form action="/viewBooking" method="post">
            <div class="form-group">
                <label for="ticketNumber">Ticket Number:</label>
                <input type="text" id="ticketNumber" name="ticketNumber" required>
            </div>
            <button type="submit">Submit</button>
        </form>
    <form action="/cancelBooking" method="post">
        <c:if test="${not empty ticket}">
            <div class="container">
            <div class="form-group">
                <h2>Ticket Details</h2>
                <label>Ticket Number: ${ticket.ticketNumber}</label><br>
                <label>Route ID: ${ticket.routeId}</label><br>
                <label>Flight Number: ${ticket.flightNumber}</label><br>
                <label>Flight Name: ${ticket.flightName}</label><br>
                <label>Total Amount: ${ticket.totalAmount}</label>
                <h2>Passengers</h2>
                <c:forEach var="passenger" items="${passengers}">
                    <div class="passenger-details">
                        <label>Passenger Name: ${passenger.passengerName}</label><br>
                        <label>Passenger Date of Birth: ${passenger.passengerDob}</label><br>
                        <label>Individual Price: ${passenger.price}</label><br>
                    </div>
                </c:forEach>
                	<div>
                        <button type="submit">Cancel Booking</button>
                        <p style="color: gray"><strong>*</strong> 10% will be deducted as cancellation fee</p>
            		</div>
            </div>
            </div>
        </c:if>
    </form>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>