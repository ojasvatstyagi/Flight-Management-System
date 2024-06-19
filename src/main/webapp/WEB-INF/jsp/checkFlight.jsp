<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Flight Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('https://cdn.pixabay.com/photo/2017/06/05/11/01/airport-2373727_1280.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        color: rgb(25, 40, 89);;
    }
    .container {
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
        background-color: rgba(255, 255, 255, 0.6);
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: rgb(25, 40, 89);
    }
    h2 {
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
    }
    .form-group input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-group .input-group {
        display: flex;
    }
    .form-group .input-group input[type="date"] {
        flex: 1;
    }
    .form-group .input-group button {
        padding: 10px;
        background-color: rgb(224 25 51);
        color: white;
        border: none;
        cursor: pointer;
        margin-left: 5px;
        border-radius: 5px;
    }
    .form-group .input-group button:hover {
        background-color: #c9302c;
    }
    .available-flights {
        margin-top: 30px;
    }
    .flight {
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 10px;
        background-color: #f9f9f9;
    }
    .flight button {
        padding: 10px;
        background-color: rgb(224 25 51);
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .flight button:hover {
        background-color: #c9302c;
    }
    h3 {
        text-align: center;
        padding: 20px;
        color: #999;
    }
    a {
            text-decoration: none;
            color: #000;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
</style>
</head>
<body>

<div class="container">
    <h1>Check Flight Details</h1>
    <div class="form-group">
        <label for="startPlace">Start Place:</label>
        <input type="text" id="startPlace" name="startPlace">
    </div>
    <div class="form-group">
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination">
    </div>
    <div class="form-group">
        <label for="dateOfFlight">Date of Flight:</label>
        <div class="input-group">
            <input type="date" id="dateOfFlight" name="dateOfFlight">
            <button type="button">Search Flights</button>
        </div>
    </div>
    <div class="available-flights">
        <h2>Available Flights</h2>
        <div class="flight">
            <p><strong>Flight ID:</strong> ${flight.flightNo}</p>
            <p><strong>Flight Name:</strong> ${flight.carrierName}</p>
        <!--<p><strong>Travel Duration:</strong> ${flight.duration}</p>
            <p><strong>Price:</strong> ${flight.price}</p>-->  
            <p><strong>Capacity:</strong> ${flight.seatCapacity}</p>
            <button type="button">Book</button>
        </div>
        <h3>No flights available</h3>
        <a href="/index">Back to home</a>
    </div>
</div>

</body>
</html>
