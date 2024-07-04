<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: url('/images/search.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        color: rgb(25, 40, 89);
    }
    .container {
		background-color: rgba(255, 255, 255, 0.8);
        width: 70%;
        margin: 50px auto;
        border-radius: 10px;
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
        justify-content: center;
    }
    .form-group .input-group button {
        padding: 10px;
        background-color: rgb(224 25 51);
        color: white;
        border: none;
        cursor: pointer;
        margin: 10px;
        border-radius: 5px;
    }
    .form-group .input-group button:hover {
        background-color: #c9302c;
    }
    .available-flights {
        margin-top: 30px;
    }
    .flight {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border: 1px solid #ddd;
        padding: 15px;
        margin-bottom: 10px;
        background-color: #f9f9f9;
    }
    .flight-details {
        flex: 1;
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
    a {
        color: #007bff;
    	text-decoration: none;
        display: block;
        text-align: center;
        margin-top: 10px;
     }
	 a:hover {
        text-decoration: underline;
	 }
</style>

</head>
<body>
<div class="container">
    <div class="available-flights">
        <h2>Available Flights</h2>
        <c:forEach var="flight" items="${flights}">
            <div class="flight">
                <div class="flight-details">
                    <p><strong>Flight ID:</strong> ${flight.flightNumber}</p>
                    <p><strong>Flight Name:</strong> ${flight.flightName}</p>
                    <p><strong>Arrival Time:</strong> ${flight.arrival}</p>
                    <p><strong>Departure Time:</strong> ${flight.departure}</p>
                    <p><strong>Route ID:</strong> ${flight.routeId}</p>
                    <p><strong>Available Seats:</strong> ${flight.seatCapacity - flight.seatsBooked}</p>
                    <p><strong>Price:</strong> ${price}</p>
                </div>
                <form action="/bookFlight" method="get">
                    <input type="hidden" name="flightNumber" value="${flight.flightNumber}">
                    <input type="hidden" name="flightName" value="${flight.flightName}">
                    <input type="hidden" name="routeId" value="${flight.routeId}">
                    <input type="hidden" name="price" value="${price}">
                    <button type="submit">Book</button>
                </form>
            </div>
        </c:forEach>
        <a href="/searchFlight">Back to search</a>
    </div>
</div>
</body>
</html>