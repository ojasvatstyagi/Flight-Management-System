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
    .ticket-details, .passenger-details {
        font-size: 20px;
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
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
        width: fit-content;
		margin: 10px auto; 
    }
    .container a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>My Bookings</h1>
        <c:if test="${not empty tickets}">
            <c:forEach var="ticket" items="${tickets}">
                <div class="ticket-details">
                    <h2>Ticket Details</h2>
                    <label>Ticket Number: ${ticket.ticketNumber}</label><br>
                    <label>Route ID: ${ticket.routeId}</label><br>
                    <label>Flight Number: ${ticket.flightNumber}</label><br>
                    <label>Flight Name: ${ticket.flightName}</label><br>
                    <label>Total Amount: ${ticket.totalAmount}</label>
                    <h2>Passengers</h2>
                    <c:forEach var="passenger" items="${passengerDetails[ticket.ticketNumber]}">
                        <div class="passenger-details">
                            <label>Passenger Name: ${passenger.passengerName}</label><br>
                            <label>Passenger Date of Birth: ${passenger.passengerDob}</label><br>
                            <label>Individual Price: ${passenger.price}</label><br>
                        </div>
                    </c:forEach>
                    <form action="/cancelBooking" method="post">
                        <input type="hidden" name="ticketNumber" value="${ticket.ticketNumber}">
                        <button type="submit">Cancel Booking</button>
                        <p style="color: gray"><strong>*</strong> 10% will be deducted as cancellation fee</p>
                    </form>
                </div>
            </c:forEach>
        </c:if>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
