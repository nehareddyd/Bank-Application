<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page import="signup.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction and Loan History</title>
   <style>
    body {
        background-color: #ddebed;
        padding: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        max-width: 800px; /* Optionally limit the table's maximum width */
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }

    a {
        display: block;
        color: grey;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    h2 {
        text-align: center;
    }
</style>
   
      
</head>
<body>
    <h3>Transaction History</h3>

    <table class="transaction">
        <!-- Transaction history table header -->
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Account Number</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance</th>
                <th>Transaction Time</th>
            </tr>
        </thead>
        <tbody>
            <%  
            try {
                User user = (User) session.getAttribute("user");
                String accountNumber = user.getAccountNumber();
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bank";
                String username = "root";
                String password = "honey";

                Connection conn = DriverManager.getConnection(url, username, password);
                String sql = "SELECT * FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, accountNumber);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    String transactionId = rs.getString("transaction_id");
                    String acc = rs.getString("acc");
                    String type = rs.getString("type");
                    double amount = rs.getDouble("amount");
                    double balance = rs.getDouble("balance");
                    String transactionTimestamp = rs.getTimestamp("transaction_timestamp").toString();

                    %>
                    <!-- Transaction history table rows -->
                    <tr>
                        <td><%= transactionId %></td>
                        <td><%= acc %></td>
                        <td><%= type %></td>
                        <td><%= amount %></td>
                        <td><%= balance %></td>
                        <td><%= transactionTimestamp %></td>
                    </tr>
                    <% 
                }
                rs.close();
                statement.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table><br><br>
    
    <h3>Loan History</h3>

    <table class="loan">
        <thead>
            <tr>
                <th>Loan ID</th>
                <th>Account Number</th>
                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>Loan Time</th>
            </tr>
        </thead>
        <tbody>
            <%  
            try {
                User user = (User) session.getAttribute("user");
                String accountNumber = user.getAccountNumber();
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bank";
                String username = "root";
                String password = "honey";

                Connection conn = DriverManager.getConnection(url, username, password);
                String sql = "SELECT * FROM loan WHERE acc = ? ORDER BY loan_timestamp DESC";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, accountNumber);
                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    String loanId = rs.getString("loan_id");
                    String acc = rs.getString("acc");
                    String loanType = rs.getString("loan_type");
                    double loanAmount = rs.getDouble("loan_amount");
                    String loanTime = rs.getTimestamp("loan_timestamp").toString();

                    %>
                    <tr>
                        <td><%= loanId %></td>
                        <td><%= acc %></td>
                        <td><%= loanType %></td>
                        <td><%= loanAmount %></td>
                        <td><%= loanTime %></td>
                    </tr>
                    <% 
                }
                rs.close();
                statement.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
    
    <a href="home.jsp">Home</a>
</body>
</html>
