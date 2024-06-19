<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Airport</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .container h2 {
            margin-top: 0;
        }
        .container select, .container button {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
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
            text-decoration: none;
            color: #000;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        .airport-details {
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Select Airport</h2>
        <form action="/details" method="post">
            <label for="airportCode">Select Airport Code:</label>
            <select id="airportCode" name="airportCode" required>
                <c:forEach var="code" items="${codeList}">
                    <option value="${code}" <c:if test="${not empty airport and airport.airportCode == code}">selected</c:if>>${code}</option>
                </c:forEach>
            </select>
            <button type="submit">Submit</button>
        </form>
        <a href="/index">Back to home</a>
        <c:if test="${not empty airport}">
            <div class="airport-details">
                <h3>Airport Details:</h3>
                <p><strong>Airport Code:</strong> ${airport.airportCode}</p>
                <p><strong>Name:</strong> ${airport.airportLocation}</p>
            </div>
        </c:if>
    </div>
</body>
</html>
