<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            background: url('/images/checkAirport.jpg') no-repeat center center fixed;
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
            width: 80%;
        }
        .container h2 {
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
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
        <h2>Tickets Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Ticket Number</th>
                    <th>Flight Name</th>
                    <th>Flight Number</th>
                    <th>Route Id</th>
                    <th>Total Booking Amount</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${tickets}">
                    <tr>
                        <td>${ticket.ticketNumber}</td>
                        <td>${ticket.flightName}</td>
                        <td>${ticket.flightNumber}</td>
                        <td>${ticket.routeId}</td>
                        <td>${ticket.totalAmount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>
