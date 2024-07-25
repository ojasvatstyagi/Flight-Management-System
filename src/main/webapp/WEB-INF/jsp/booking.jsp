<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book a Flight</title>
<style>
        body {
        font-family: Arial, sans-serif;
        background: url('/images/ticket.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        color: rgb(25, 40, 89);
    }
    .container {
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h1 {
        color: rgb(25, 40, 89);
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: rgb(25, 40, 89);
        font-size: 20px;
        text-align: left;
    }
    .form-group input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        font-size: 16px;
    }
    .form-group button {
        padding: 10px 20px;
        background-color: rgb(224, 25, 51);
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        margin-top: 20px;
        font-size: 16px;
    }
    .form-group button:hover {
        background-color: #c9302c;
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
<script>
    let passengerCount = 1;

    function addPassenger() {
        passengerCount++;
        const container = document.getElementById('passenger-container');
        const passengerDiv = document.createElement('div');
        passengerDiv.className = 'passenger-group';
        passengerDiv.id = 'passenger' + passengerCount;

        passengerDiv.innerHTML = `
            <h2>Passenger ${passengerCount}</h2>
            <div class="form-group">
                <label for="passengerName${passengerCount}">Passenger Name:</label>
                <input type="text" id="passengerName${passengerCount}" name="passengerName" required>
            </div>
            <div class="form-group">
                <label for="passengerDob${passengerCount}">Passenger Date of Birth:</label>
                <input type="date" id="passengerDob${passengerCount}" name="passengerDob" required>
            </div>
        `;

        container.appendChild(passengerDiv);
    }

    function removePassenger() {
        if (passengerCount > 1) {
            const container = document.getElementById('passenger-container');
            const lastPassenger = document.getElementById('passenger' + passengerCount);
            container.removeChild(lastPassenger);
            passengerCount--;
        }
    }
</script>
</head>
<body>
<div class="container">
    <h1>Confirm Flight</h1>
        <div class="form-group">
            <label for="flightNumber">Flight Number:</label>
            <input type="text" id="flightNumber" name="flightNumber" value="${flightNumber}" readonly>
        </div>
        <div class="form-group">
            <label for="flightName">Flight Name:</label>
            <input type="text" id="flightName" name="flightName" value="${flightName}" readonly>
        </div>
        <div class="form-group">
            <label for="routeId">Route ID:</label>
            <input type="text" id="routeId" name="routeId" value="${routeId}" readonly>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value="${price}" readonly>
        </div>
    <form action="/bookFlight" method="post">
        <div id="passenger-container">
            <div class="passenger-group" id="passenger1">
                <h2>Passenger</h2>
                <div class="form-group">
                    <label for="passengerName1">Passenger Name:</label>
                    <input type="text" id="passengerName1" name="passengerName" required>
                </div>
                <div class="form-group">
                    <label for="passengerDob1">Passenger Date of Birth:</label>
                    <input type="date" id="passengerDob1" name="passengerDob" required>
                </div>
            </div>
        </div>
        <div class="form-group">
            <button type="button" onclick="addPassenger()">Add Passenger</button>
            <button type="button" onclick="removePassenger()">Remove Passenger</button>
        </div>
        <input type="hidden" name="routeId" value="${routeId}">
        <input type="hidden" name="flightNumber" value="${flightNumber}">
        <input type="hidden" name="flightName" value="${flightName}">
        <input type="hidden" name="price" value="${price}">
        <div class="form-group">
        <button type="submit">Book Flight</button>
        </div>
        <a href="/index">Back to home</a>
    </form>
</div>
</body>
</html>