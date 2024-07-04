<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        background: url('/images/login.jpg') no-repeat center center fixed;
        background-size: cover; 
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        text-align: center;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    header {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    label {
        font-size: 18px;
        margin-bottom: 5px;
        display: block;
    }
    input[type="text"], input[type="password"] {
        width: 80%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    button {
        padding: 10px 20px;
        font-size: 18px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
    footer {
        margin-top: 20px;
        font-size: 14px;
    }
    .error-message {
        color: red;
        font-size: 16px;
        margin-bottom: 10px;
    }
    a {
        color: #007bff;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="container">
    <header>Flight Reservation System SignIn</header>
    
    <div class="error-message">${error}</div> <!-- Placeholder for error message -->

    <form:form action="/login" method="post">
        <label for="username">UserName:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
        <br/>
    </form:form>
    <a href="/register">Create New Account</a>

    <footer>Flight Reservation System 2024 | <a href="aboutUs.jsp">About Us</a></footer>
</div>
</body>
</html>
