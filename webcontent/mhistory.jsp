<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>
     	a{
display: block;
  color:purple;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
   body
        {
            background-color:#ddebed;
            padding:50px;
        }
  h3{
  text-align:center;}
    }

        th, td {
            
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
       table{
             border-collapse: collapse;
            width: 100%;
            height : 100%;
            margin:0-auto;
        }  a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
      
    </style>
</head>
<body>
    <h3>Transaction History</h3><br><br>

    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="Get Transaction History">
    </form><br><br><br>

    <%  
    String accountNumber = request.getParameter("accNumber");
    if (accountNumber != null && !accountNumber.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true"; 
            String dbUser = "root"; 
            String dbPassword = "honey"; 

            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String sql = "SELECT * FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();
            int c = 0;
            int d = 0;
            %>
            <table >
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
                 <% while (rs.next()) {
                        String type = rs.getString("type");
                        if (type.equalsIgnoreCase("credit")) {
                            c++;
                        } else if (type.equalsIgnoreCase("debit")) {
                            d++;
                        }
                    %>
                  
                    <tr>
                        <td><%= rs.getLong("transaction_id") %></td>
                        <td><%= rs.getString("acc") %></td>
                        <td><%= rs.getString("type") %></td>
                        <td><%= rs.getDouble("amount") %></td>
                        <td><%= rs.getDouble("balance") %></td>
                        <td><%= rs.getTimestamp("transaction_timestamp") %></td>
                    </tr>
                    <% } %>
                    
                </tbody>
            </table><br><br><br>
            <!-- Display the number of credits and debits -->
            <p>Number of Credits: <%= c %></p>
            <p>Number of Debits: <%= d %></p>
            <%  
            rs.close();
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
