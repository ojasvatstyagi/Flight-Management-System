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
        display: block;
        margin: 10px 0 5px;
        font-size: 16px;
    }
    input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
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
    img {
      width: 30px;
      height: 30px; 
      position: absolute; 
      right: 10px; top: 40%; 
      transform: translateY(-50%); 
      cursor: pointer;
    }
</style>
<script>
	function togglePasswordVisibility(id, img) {
	    var passwordInput = document.getElementById(id);
	    if (passwordInput.type === "password") {
	        passwordInput.type = "text";
	        img.src = "/images/eyes2.png"; // Change to the hide image
	    } else {
	        passwordInput.type = "password";
	        img.src = "/images/eyes.png"; // Change to the show image
	    }
	}
</script>
</head>
<body>
<div class="container">
    <header>Flight Reservation System SignIn</header>
    
    <div class="error-message">${error}</div> <!-- Placeholder for error message -->

    <form:form action="/login" method="post">
        <label for="username">UserName:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <div style="position: relative;">
        <input type="password" id="password" name="password" style="padding-right: 40px;">
        <img src="/images/eyes.png" alt="Show Password" onclick="togglePasswordVisibility('password', this)">
        </div>
        <button type="submit">Login</button>
        <br/>
    </form:form>
    <a href="/register">Create New Account</a>

    <footer>Flight Reservation System 2024 | <a href="/about">About Us</a></footer>
</div>
</body>
</html>
