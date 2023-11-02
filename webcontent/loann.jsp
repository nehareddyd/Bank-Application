<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
    <!-- Your styles -->
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
    <h3>LOAN DETAILS</h3>
    <br><br>
    
    <%  
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;

    try {
    	 Class.forName("com.mysql.jdbc.Driver");
         String dbURL = "jdbc:mysql://localhost:3306/bank"; 
         String dbUser = "root"; 
         String dbPassword = "honey"; 
         Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "SELECT * FROM loan ";
        statement = conn.prepareStatement(sql);
        rs = statement.executeQuery();

        %>
        <table>
            <thead>
                <tr>
                    <th>Loan id</th>
                    <th>Account Number</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Time</th>             
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("loan_id") %></td>
                        <td><%= rs.getString("acc") %></td>
                        <td><%= rs.getString("loan_type") %></td>
                         <td><%= rs.getString("loan_amount") %></td>
                        <td><%= rs.getString("loan_timestamp") %></td>
                      
                    </tr>
                <% } %>
            </tbody>
        </table>
        <%  
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of opening
        if (rs != null) rs.close();
        if (statement != null) statement.close();
        if (con != null) con.close();
    }
    %>
    <br><br>
    <a href="mhome.jsp">Home</a>
</body>
</html>