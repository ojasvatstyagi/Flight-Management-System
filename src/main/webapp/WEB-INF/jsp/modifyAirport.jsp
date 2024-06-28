<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Airport and Update Airport</title>
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
        .form-group input {
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
        <h1>Delete Airport</h1>
        <form action="/deleteAirport" method="post">
            <div class="form-group">
                <label for="airportCode">Enter Airport Code:</label>
                <input type="text" id="airportCode" name="airportCode" required>
            </div>
            <div class="form-actions">
                <button type="submit">Delete Airport</button>
            </div>
        </form>
    </div>
    
    <div class="container">
        <h2>Update Airport Details</h2>
        <form action="/updateAirport" method="post">
            <div class="form-group">
                <label for="airportCode">Enter Airport Code:</label>
                <input type="text" id="airportCode" name="airportCode" required>
            </div>
            <div class="form-group">
                <label for="airportLocation">Enter Airport Location:</label>
                <input type="text" id="airportLocation" name="airportLocation" required>
            </div>
            <div class="form-actions">
                <button type="submit">Update Airport</button>
            </div>
        </form>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
