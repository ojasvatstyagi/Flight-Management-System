<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Flight Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('/images/search.jpg') no-repeat center center fixed;
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
        text-align: left;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: rgb(25, 40, 89);
        font-size: 20px;
    }
    .form-control {
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
        margin-top: 10px;
    }
    .container a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Check Flight Details</h1>
    <form action="/searchFlight" method="post">
        <div class="form-group">
            <label for="sourceAirport">Enter Source Airport:</label>
            <select id="sourceAirport" name="sourceAirport" class="form-control" required>
                <option value="" disabled selected>Select Airport</option>
                <c:forEach var="airport" items="${airports}">
                    <option value="${airport.airportLocation}">${airport.airportLocation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="destinationAirport">Enter Destination Airport:</label>
            <select id="destinationAirport" name="destinationAirport" class="form-control" required>
                <option value="" disabled selected>Select Airport</option>
                <c:forEach var="airport" items="${airports}">
                    <option value="${airport.airportLocation}">${airport.airportLocation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <button type="submit">Search Flights</button>
        </div>
    </form>
    <a href="/index">Back to home</a>
</div>
</body>
</html>