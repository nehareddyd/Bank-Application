<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
       
body{
  background-repeat: no-repeat;
  background-attachment: fixed; 
  background-size: 100% 100%;
}
        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .radio-group {
            margin-bottom: 20px;
        }

        .radio-group label {
            margin-right: 10px;
        }

        .button-container {
            text-align: center;
        }

        .button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

        

        a {
            color: #5f9ea0;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 10px;
            margin-top: 20px;
            border-radius: 4px;
        }
    </style>
</head>
<body background='bg.jpg'>
    <br><br><br><br><br><br><br><br>
    <div class="container">
        <h2>Bank Login</h2>
        <form method="post" action="login">
            <div class="radio-group">
                <label>
                    <input type="radio" name="loginType" value="customer" checked> Customer Login
                </label>
                <label>
                    <input type="radio" name="loginType" value="employee"> Bank Employee Login
                </label>
            </div>
            <label>
                Username:
                <input type="text" name="username" required>
            </label>
            <label>
                Password:
                <input type="password" name="password" required>
            </label>
            <div class="button-container">
                <input type="submit" value="Login" class="button">
                <p align="center">Don't have an Account? <a href="signup.jsp">Create an Account</a></p>
            </div>

            <% 
                String status = (String) request.getAttribute("status");
                if (status != null && status.equals("failed")) {
                    out.println("<div class='message'>Invalid Username or Password. Please try again.</div>");
                }
            %>
        </form>
    </div>
</body>
</html>
