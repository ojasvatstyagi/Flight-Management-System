<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            background: url('/images/checkAirport.jpg') no-repeat center center fixed;
       		background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        .container h2 {
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
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
        <h2>Flight Report</h2>
        <table>
            <thead>
                <tr>
                    <th>Flight Name</th>
                    <th>Flight Number</th>
                    <th>Route ID</th>
                    <th>Flight Seat Capacity</th>
                    <th>Flight Arrival Time</th>
                    <th>Route Departure Time</th>
                    <th>Available Seats</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${flights}">
                    <tr>
                        <td>${flight.flightName}</td>
                        <td>${flight.flightNumber}</td>
                        <td>${flight.routeId}</td>
                        <td>${flight.seatCapacity}</td>
                        <td>${flight.arrival}</td>
                        <td>${flight.departure}</td>
                        <td>${flight.seatCapacity - flight.seatsBooked} </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
