<%@ page import="signup.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            background-color: #ddebed;
        }
        a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        div {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <br><br><br><br><br><br><br><br>
    <div>
        <h2>Profile</h2>

        <%
            User user = (User) session.getAttribute("user");
            double balance = 0.0;

            if (user != null) {
                try {
                    String accountNumber = user.getAccountNumber();
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/bank";
                    String username = "root";
                    String password = "honey";

                    Connection conn = DriverManager.getConnection(url, username, password);
                    String sql = "SELECT balance FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC LIMIT 1";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, accountNumber);
                    ResultSet rs = statement.executeQuery();

                    if (rs.next()) {
                        balance = rs.getDouble("balance");
                    }

                    rs.close();
                    statement.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                %>
                <p>Name: <%= user.getName() %></p>
                <p>Email: <%= user.getEmail() %></p>
                <p>Phone: <%= user.getPhone() %></p>
                <p>Gender: <%= user.getGender() %></p>
                <p>Aadhaar Number: <%= user.getAadhaar() %></p>
                <p>Address: <%= user.getAddress() %></p>
                <p>Account Number: <%= user.getAccountNumber() %></p>
                <p>Balance: <%= balance %></p><br><br>
            <%
            } else {
        %>
            <p>Error: User not logged in.</p>
        <%
            }
        %>
        <a href="home.jsp">Home</a>
    </div>
</body>
</html>
