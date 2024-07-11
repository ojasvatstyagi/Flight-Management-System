<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('/images/newUser.jpg') no-repeat center center fixed;
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
    h3 {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin: 10px 0 5px;
        font-size: 16px;
    }
    input, select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    button {
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button[type="submit"] {
        background-color: #28a745;
    }
    button[type="reset"] {
        background-color: #dc3545;
    }
    button:hover {
        opacity: 0.9;
    }
    .error {
        color: red;
        font-size: 14px;
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
<script type="text/javascript">
    function validatePassword() {
        var pass1 = document.getElementById("pass1").value;
        var pass2 = document.getElementById("pass2").value;
        var error = document.getElementById("error");

        var regex = /^(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{6,10}$/;

        if (pass1 !== pass2) {
            error.textContent = "Passwords do not match";
            return false;
        } else if (!regex.test(pass1)) {
            error.textContent = "Password must be 6-10 characters long and include at least one special character";
            return false;
        }

        error.textContent = "";
        document.getElementById("registrationForm").submit();
        return true;
    }
</script>
</head>
<body>
    <div class="container">
        <h3>Flight Reservation System - Sign Up</h3>
        <div id="error" class="error">${error}</div> <!-- Display error message -->
        <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord" onsubmit="return validatePassword()">
            <form:label path="username">Enter New User Id:</form:label>
            <form:input path="username" />
            <br/>
            <form:label path="email">Enter Email:</form:label>
            <form:input type="email" path="email" />
            <br/>
            <form:label for ="type" path="type">Select User's Type:</form:label>
            <select id = "type" name="type" required>
                <option value="Customer">Customer</option>
                <option value="Admin">Admin</option>
            </select>
            <br/>
            <form:label path="password">Enter New Password:</form:label>
            <form:input type="password" id="pass1" path="password" />
            <br/>
            <label for="pass2">Re-type New Password:</label>
            <input type="password" id="pass2" />
            <br/>
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
            <br/>
        </form:form>
        <a href="/loginpage">Already have an account?</a>
    </div>
</body>
</html>