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
          
        }
        .wrapper {
            display: flex;
            justify-content: space-between;
            max-width: 800px;
            margin: 0 auto;
        }
        .container {
            width: 70%;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .user-image {
            width: 350px;
            height: 350px;
            padding-top:100px;
            margin-left: 20px;
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
    <br><br><br><br>
    <div class="wrapper">
        <div class="container">
            <h2>Profile</h2>

            <%
                User user = (User) session.getAttribute("user");
                double balance = 0.0;
                int numCredits = 0;
                int numDebits = 0;
                double totalDebitAmount = 0.0;
                double totalCreditAmount = 0.0;

                if (user != null) {
                    try {
                        String accountNumber = user.getAccountNumber();
                        Class.forName("com.mysql.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true";
                        String username = "root";
                        String password = "honey";

                        Connection conn = DriverManager.getConnection(url, username, password);
                        String sql = "SELECT type, amount FROM transaction WHERE acc = ?";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1, accountNumber);
                        ResultSet rs = statement.executeQuery();

                        while (rs.next()) {
                            String accountType = rs.getString("type");
                            double amount = rs.getDouble("amount");

                            if (accountType.equals("credit")) {
                                numCredits++;
                                totalCreditAmount += amount;
                            } else if (accountType.equals("debit")) {
                                numDebits++;
                                totalDebitAmount += amount;
                            }
                        }

                        sql = "SELECT balance FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC LIMIT 1";;
                        statement = conn.prepareStatement(sql);
                        statement.setString(1, accountNumber);
                        rs = statement.executeQuery();

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
                    <p>Balance: <%= balance %></p>
                    <p>Number of Credits: <%= numCredits %></p>
                    <p>Number of Debits: <%= numDebits %></p>
                    <p>Total Debit Amount: <%= totalDebitAmount %></p>
                    <p>Total Credit Amount: <%= totalCreditAmount %></p><br><br>
                <%
                } else {
            %>
            <p>Error: User not logged in.</p>
            <%
                }
            %> 
            <a href="home.jsp">Home</a>
        </div>
        <img class="user-image" src="user.png" alt="User Image">
    </div>
   
</body>
</html>
