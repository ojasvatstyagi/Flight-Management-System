<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
		background-color: rgba(255, 255, 255, 0.8);
        text-align: center;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: red;
    }
    p {
        font-size: 18px;
    }
    a {
        color: #007bff;
        text-decoration: none;
        font-size: 18px;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Error!</h2>
        <p>${message}</p>
        <a href="/searchFlight">Back</a>
    </div>
</body>
</html>
