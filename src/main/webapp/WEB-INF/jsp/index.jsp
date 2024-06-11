<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        background: url('https://images.alphacoders.com/113/113793.jpg') no-repeat center center fixed; 
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        text-align: center;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        color: #333;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the home page</h2>
        <h3><a href="/logout">Logout</a>&nbsp;&nbsp;</h3>
    </div>
</body>
</html>
