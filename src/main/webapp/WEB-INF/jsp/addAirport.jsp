<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Airport</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            background: url('/images/addAirport.jpg') no-repeat center center fixed;
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
            width: 320px; /* Increased width slightly for better spacing */
            max-width: 100%;
            text-align: center;
        }
        .container h2 {
            margin-top: 0;
            text-align: center; /* Centering the heading */
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container label {
            margin-bottom: 8px;
        }
        .container input, .container select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensure padding and border do not increase the width */
            width: calc(100% - 22px); /* Adjusting for padding and border */
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
        <h2>Add Airport</h2>
        <form action="/addAirport" method="post">
            <label for="airportCode">Airport Code:</label>
            <input type="text" id="airportCode" name="airportCode" required>

            <label for="airportLocation">Airport Location:</label>
            <input type="text" id="airportLocation" name="airportLocation" required>
            
            <label for="details">About Airport:</label>
            <textarea id="details" name="details" rows="5" required></textarea>

            <button type="submit">Submit</button>
        </form>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
