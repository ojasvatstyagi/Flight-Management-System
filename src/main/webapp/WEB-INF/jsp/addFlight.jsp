<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background: url('/images/addFlight.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden; /* Prevents the body from scrolling */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            max-height: 90vh; /* Limits the height of the container */
            overflow-y: auto; /* Adds a scrollbar if content overflows */
            text-align: center;
        }
        .header {
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            color: rgb(17 23 43);
        }
        .back {
            display: flex;
            justify-content: space-between;
        }
        .back .logout {
            font-size: 16px;
            color: #fff;
            background-color: rgb(224 25 51);
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            font-size: 16px;
            display: block;
            margin-bottom: 5px;
            color: rgb(17 23 43);
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid rgb(17 23 43);
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
        }
        footer {
            margin-top: 20px;
            font-size: 14px;
        }
        a {
            color: rgb(17 23 43);
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>New Flight Registry</h1>
        </div>
        <form action="/addFlight" method="post">
            <div class="form-group">
                <label for="flightNumber">Flight Id:</label>
                <input type="text" id="flightNumber" name="flightNumber" placeholder="xxxx" required>
            </div>
            <div class="form-group">
                <label for="flightName">Flight Name:</label>
                <input type="text" id="flightName" name="flightName" placeholder="xxxx" required>
            </div>
            <div class="form-group">
                <label for="seatCapacity">Seat Capacity:</label>
                <input type="text" id="seatCapacity" name="seatCapacity" placeholder="xxxx" required>
            </div>
            <div class="form-group">
                <label for="routeId">Select Route ID:</label>
                <select id="routeId" name="routeId" class="form-control" required>
                    <option value="" disabled selected>Select Route Code</option>
                    <c:forEach var="route" items="${codeList}">
                        <option value="${route.routeId}">${route.routeId}  ${route.sourceAirportCode} to ${route.destinationAirportCode}</option>
                    </c:forEach>
                </select>
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
                <label for="returnArrival">Enter Return Arrival Time:</label>
                <input type="time" id="returnArrival" name="returnArrival" required>
            </div>
            <div class="form-group">
                <label for="returnDeparture">Enter Return Departure Time:</label>
                <input type="time" id="returnDeparture" name="returnDeparture" required>
            </div>
            <div class="form-group">
                <div class="back">
                    <button type="submit">ADD</button>
                    <a href="/index" class="logout">HOME</a>
                </div>
                <input type="hidden" name="seatBooked" value="0" />
            </div>
        </form>
        <footer>
            Flight Reservation System 2024 | <a href="/aboutUs">About Us</a>
        </footer>
    </div>
</body>
</html>
