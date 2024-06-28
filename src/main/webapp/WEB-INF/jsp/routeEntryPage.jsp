<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <title>Add Route</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            background: url('/images/route.jpg') no-repeat center center fixed;
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
            width: 320px;
            max-width: 100%;
            text-align: center;
        }
        .container h2 {
            margin-top: 0;
            text-align: center;
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container label {
            margin-bottom: 8px;
        }
        .container select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: calc(100% - 22px);
        }
        .container input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: calc(100% - 22px);
        }
        .container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 150px;
            margin: 0 auto;
        }
        .container button:hover {
            background-color: #45a049;
        }
        .container a {
        color: #007bff;
        text-decoration: none;
	    }
	     .container a:hover {
	        text-decoration: underline;
	    }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Route</h2>
        <form action="${pageContext.request.contextPath}/route" method="post">
            <input type="hidden" name="routeId" value="${routeRecord.routeId}" />
            <div class="form-group">
                <label for="sourceAirportCode">Select Source Airport Code:</label>
                <select id="sourceAirportCode" name="sourceAirportCode" class="form-control" required>
                    <option value="" disabled selected>Select Airport Code</option>
                    <c:forEach var="airport" items="${codeList}">
                        <option value="${airport.airportCode}">${airport.airportCode}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="destinationAirportCode">Select Destination Airport Code:</label>
                <select id="destinationAirportCode" name="destinationAirportCode" class="form-control" required>
                    <option value="" disabled selected>Select Airport Code</option>
                    <c:forEach var="airport" items="${codeList}">
                        <option value="${airport.airportCode}">${airport.airportCode}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="sourceAirportCode">Enter Route Fair:</label>
                <input type="text" id="routeFair" name="fair" placeholder="xxxx" required>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </form>
        <a href="/index" class="btn btn-link">Back to home</a>
    </div>
</body>
</html>
