<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Debit Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
            background-color: #ddebed;
        }

        .container {
            text-align: center;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 10px;
        }

        p {
            margin-top: 20px;
            font-weight: bold;
        }

        a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <p>Debited amount: <%= request.getParameter("amount") %></p>
        <a href="home.jsp">Home</a>
    </div>
</body>
</html>
