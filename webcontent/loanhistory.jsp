<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loan History</title>
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
    <h3>Loan History</h3><br><br>

    <form method="post">
        Enter Account Number: <input type="text" name="accNumber">
        <input type="submit" value="loan History">
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
            String sql = "SELECT * FROM loan WHERE acc = ? ORDER BY loan_timestamp DESC";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();

            %>
            <table >
                <thead>
                    <tr>
                        <th>Loan ID</th>
                        <th>Account Number</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Loan Time</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getLong("loan_id") %></td>
                        <td><%= rs.getString("acc") %></td>
                        <td><%= rs.getString("loan_type") %></td>
                        <td><%= rs.getDouble("loan_amount") %></td>
                        <td><%= rs.getTimestamp("loan_timestamp") %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <%  
            rs.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 
    %>
    <a href='loann.jsp'>Display all</a>
     <a href="mhome.jsp">Home</a>
</body>
</html>
