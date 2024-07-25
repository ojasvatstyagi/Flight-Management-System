<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('/images/modifyFlight.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: rgb(25, 40, 89);
        }
        .container {
            width: 50%;
            margin: 100px auto;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: rgb(25, 40, 89);
        }
        h2 {
            text-align: center;
            color: rgb(25, 40, 89);
            margin-top: 40px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: rgb(25, 40, 89);
            font-size: 20px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-actions {
            text-align: center;
        }
        .form-actions button {
            padding: 10px 20px;
            background-color: rgb(224, 25, 51);
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-actions button:hover {
            background-color: #c9302c;
        }
        a {
            color: #007bff;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h2>Update Flight Details</h2>
        <form action="/updateFlight" method="post">
            <div class="form-group">
                <label for="flightNumber">Enter Flight Number:</label>
                <select id="flightNumber" name="flightNumber" required>
	                <option value="" disabled selected>Select Flight</option>
	                <c:forEach var="flight" items="${flights}">
	                    <option value="${flight.flightNumber}">${flight.flightNumber} -> ${flight.flightName}</option>
	                </c:forEach>
	            </select>
            </div>
            <div class="form-group">
                <label for="flightName">Enter Flight Name:</label>
                <input type="text" id="flightName" name="flightName" required>
            </div>
            <div class="form-group">
                <label for="arrival">Enter Arrival Time:</label>
                <input type="time" id="arrival" name="arrival" required>
            </div>
            <div class="form-group">
                <label for="departure">Enter Departure Time:</label>
                <input type="time" id="departure" name="departure" required>
            </div>
            <div class="form-group">
                <label for="routeId">Enter Route ID:</label>
                <input type="text" id="routeId" name="routeId" required>
            </div>
            <div class="form-group">
                <label for="seatCapacity">Enter Seat Capacity:</label>
                <input type="text" id="seatCapacity" name="seatCapacity" required>
            </div>
            <div class="form-actions">
                <button type="submit">Update Flight</button>
            </div>
        </form>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
