<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Beta Airline</title>
<style>
    body {
        font-family: 'Helvetica Neue', Arial, sans-serif;
        background: url('/images/mainPage.png') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #container {
        text-align: center;
    }
    #container img {
        width: 150px; /* Adjust as needed */
        cursor: pointer;
        margin-top: 500px;
        transition: transform 0.3s ease;
    }
    #container img:hover {
        transform: scale(1.1);
    }
    @media (max-width: 768px) {
        body {
            background-size: auto 100vh;
        }
    }
</style>
</head>
<body>
    <div id="container">
        <a href="/loginpage">
            <img src="/images/loginL.png" alt="Login to Beta Airline">
        </a>
    </div>
</body>
</html>
    