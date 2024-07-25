<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Route</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('/images/modifyAirport.jpg') no-repeat center center fixed;
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: rgb(25, 40, 89);
            font-size: 20px;
        }
        .form-group input, select {
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
        <h2>Update Route Details</h2>
        <form action="/updateRoute" method="post">
            <div class="form-group">
                <label for="routeId">Enter Route Code:</label>
                <select id="routeId" name="routeId"  required>
                    <option value="" disabled selected>Select Route Code</option>
                    <c:forEach var="route" items="${routes}">
                        <option value="${route.routeId}">${route.routeId}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
            	<label for="sourceAirportCode">Select Source Airport Code:</label>
                <select id="sourceAirportCode" name="sourceAirportCode"  required>
                    <option value="" disabled selected>Select Airport Code</option>
                    <c:forEach var="airport" items="${airports}">
                        <option value="${airport.airportCode}">${airport.airportCode}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="destinationAirportCode">Select Destination Airport Code:</label>
                <select id="destinationAirportCode" name="destinationAirportCode" required>
                    <option value="" disabled selected>Select Airport Code</option>
                    <c:forEach var="airport" items="${airports}">
                        <option value="${airport.airportCode}">${airport.airportCode}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="price">Enter Route Price:</label>
                <input type="text" id="price" name="price" placeholder="xxxx" required>
            </div>
            <div class="form-actions">
                <button type="submit">Update Route</button>
            </div>
        </form>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
