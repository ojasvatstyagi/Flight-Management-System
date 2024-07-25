<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Airport</title>
	<style>
		body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            background: url('/images/checkSAirport.jpg') no-repeat center center fixed;
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
            width: 50%;
    		text-align: center;
        }
		.container h2 {
            margin-top: 0;
        }
		.container p {
		    color: #666;
		    margin-bottom: 10px;
		}
		.container a {
            color: #007bff;
        	text-decoration: none;
            display: block;
            text-align: center;
            width: fit-content;
			margin: 10px auto; 
        }
	    .container a:hover {
	        text-decoration: underline;
	    }
	</style>
</head>
<body>
	<div class="container">
    <h2>Airport Details</h2>
    <p>Airport Code: ${airport.airportCode}</p>
    <p>Airport Location: ${airport.airportLocation}</p>
    <p>About Airport: ${airport.details}</p>
    <a href="/viewAirports">Back</a>
	</div>
</body>
</html>

