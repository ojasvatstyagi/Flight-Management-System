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
            background: url('https://cdn.pixabay.com/photo/2017/06/05/11/01/airport-2373727_1280.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.6);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            text-align: center;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            color: rgb(17 23 43);
        }
        .header .logout {
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
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            font-size: 20px;
            display: block;
            margin-bottom: 5px;
            color: rgb(17 23 43);
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid rgb(17 23 43);
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        .form-control {
		    width: 100%;
		    padding: 8px;
		    box-sizing: border-box;
		    border: 1px solid #ced4da;
		    border-radius: 4px;
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
            font-size: 16px;
        }
        a {
            color: rgb(17 23 43);
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>New Flight Registry</h1>
            <a href="/index" class="logout">HOME</a>
        </div>
        <form action="/addFlight" method="post">
	    <div class="form-group">
	        <label for="flightNo">Flight Id:</label>
	        <input type="text" id="flightNo" name="flightNo" placeholder="xxxx" required>
	    </div>
	    <div class="form-group">
	        <label for="carrierName">Carrier Name:</label>
	        <input type="text" id="carrierName" name="carrierName" placeholder="xxxx" required>
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
	                <option value="${route.routeId}">${route.routeId}</option>
	            </c:forEach>
	        </select>
	    </div>
	    <div class="form-group">
	        <label for="arrival">Enter Arrival Time:</label>
	        <input type="time" id="arrival" name="arrival" placeholder="xxxx" required>
	    </div>
	    <div class="form-group">
	        <label for="departure">Enter Departure Time:</label>
	        <input type="time" id="departure" name="departure" placeholder="xxxx" required>
	    </div>
	    <div class="form-group">
	        <button type="submit">ADD</button>
	    </div>
	</form>
        <footer>
            Flight Reservation System 2024 | <a href="/aboutUs">About Us</a>
        </footer>
    </div>
</body>
</html>
