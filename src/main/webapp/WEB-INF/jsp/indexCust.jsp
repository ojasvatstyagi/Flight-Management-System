<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dash board</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .header {
        background-color: rgb(17 23 43);
        color: white;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        border: 4px solid rgb(25, 40, 89);
    }
    .header img {
        height: 65px;
        width: 200px;
    }
    .header div {
        display: flex;
        align-items: center;
    }
    .header h1 {
        margin: 0;
        flex-grow: 1;
        text-align: center;
        color: rgb(224 25 51);
        font-size: 3em;
    }
    .header .user {
        margin-right: 30px;
        font-size: 30px;
    }
    .nav {
        background-color: rgb(17 23 43);
        color: white;
        width: 200px;
        height: 100vh;
        position: fixed;
        padding-top: 60px;
        border: 4px solid rgb(25, 40, 89);
    }
    .nav h2 {
        text-align: center;
        font-size: 1.5em;
        margin: 5px 10px;
    }
    .nav a {
        display: block;
        color: white;
        text-decoration: none;
        padding: 15px 15px;
        font-size: 18px;
    }
    .nav a:hover {
        background-color: #003366;
    }
    .content {
        margin-left: 200px;
        padding: 120px 20px 20px 20px; /* Padding adjusted for fixed header */
        height: 81vh;
        background-image: url('/images/index.jpg');
        background-size: cover;
    }
</style>
</head>
<body>

<div class="header"> 
    <div class="user">
        Welcome, ${username}
    </div>
    <h1>Flight Management System</h1>
</div>

<div class="nav">
    <h2>DashBoard</h2>
    <a href="/viewAirports">View All Airports</a>
    <a href="/viewFlights">View Flight Details</a>
    <a href="/viewRoutes">View Routes</a>
    <a href="/searchFlight">Book Flight</a>
    <a href="/viewBooking">View Bookings</a>
    <a href="/about">About Us</a>
    <a href="/fms">Logout</a>
</div>

<div class="content">
    <!-- Content goes here -->
</div>

</body>
</html>
