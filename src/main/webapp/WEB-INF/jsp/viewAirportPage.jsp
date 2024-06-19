<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Airport Report</title>
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
            text-decoration: none;
            color: #000;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Airport Report</h2>
        <table>
            <thead>
                <tr>
                    <th>Airport Code</th>
                    <th>Airport Location</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="airport" items="${airportList}">
                    <tr>
                        <td>${airport.airportCode}</td>
                        <td>${airport.airportLocation}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/index">Back to home</a>
    </div>
</body>
</html>