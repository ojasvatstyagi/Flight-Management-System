<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book a Flight</title>
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
    .form-group {
        margin-bottom: 15px;
        text-align: left;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: rgb(25, 40, 89);
        font-size: 20px;
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
</style>
</head>
<body>

<div class="container">
    <h1>Book a Flight</h1>
    <form action="/bookFlight" method="post">
        <div class="form-group">
            <label for="passengerName">Passenger Name:</label>
            <input type="text" id="passengerName" name="passengerName" required>
        </div>
        <div class="form-group">
            <label for="passengerDOB">Passenger Date of Birth:</label>
            <input type="date" id="passengerDOB" name="passengerDOB" required>
        </div>
        <div class="form-group">
            <label for="routeId">Route ID:</label>
            <input type="text" id="routeId" name="routeId" required>
        </div>
        <div class="form-group">
            <label for="flightNumber">Flight Number:</label>
            <input type="text" id="flightNumber" name="flightNumber" required>
        </div>
        <div class="form-group">
            <label for="carrierName">Carrier Name:</label>
            <input type="text" id="carrierName" name="carrierName" required>
        </div>
        <div class="form-group">
            <label for="fare">Fare:</label>
            <input type="text" id="fare" name="fare" required>
        </div>
        <button type="submit">Book Flight</button>
    </form>
</div>

</body>
</html>
