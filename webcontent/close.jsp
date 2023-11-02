<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>close</title>
    <style>
     	a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        body {
            background-color: #ddebed;
            padding: 50px;
        }
        h3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h3>Account Closure</h3><br><br>
    <p>Once the Account is closed, the action cannot be undone.</p>
    <p>Make sure to transfer all the funds in the account before closing it</p>
    <P>Enter the account number you want to close and click on close to close the account permanently.</p><br><br>

    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="close">
    </form><br><br><br>

    <%
    String accountNumber = request.getParameter("accNumber");
    if (accountNumber != null && !accountNumber.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/bank";
            String dbUser = "root";
            String dbPassword = "honey";

            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String sql = "DELETE FROM users WHERE acc=?";
            
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, accountNumber);
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Account with Account Number " + accountNumber + " has been closed successfully.");
            } else {
                out.println("Account with Account Number " + accountNumber + " not found or couldn't be closed.");
            }

            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
    <a href="mhome.jsp">Home</a>
</body>
</html>
