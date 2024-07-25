<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        background: url('/images/error.jpg') no-repeat center center fixed;
        background-size: cover;
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
    .error-message {
        color: red;
        font-size: 16px;
    }
    a {
        color: #007bff;
        text-decoration: none;
        width: fit-content;
		margin: 10px auto; 
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Error</h2>
    <div class="error-message">${error}</div>
    <br>
    <a href="/index">Go to Home</a>
</div>
</body>
</html>
        