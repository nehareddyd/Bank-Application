<%@ page import="signup.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Balance</title>
    <style>
        .container {
            text-align: center;
            padding: 20px;
        }

        .balance {
            font-size: 18px;
          
        }
        body {
            background-color: #ddebed;
            text-align:center;
           
        }.container {
            text-align: center;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        } a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }img{
height:200px;
display:block;
margin-left:auto;
margin-right:auto;
padding-top:100px;
}
    </style>
</head>
<body>
    <div class="container">
        <h3>Current Balance</h3>

        <div class="balance">
            <%  
            try {
            	 User user = (User) session.getAttribute("user");
            	 String accountNumber =user.getAccountNumber();
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
                    double balance = rs.getDouble("balance");
                     out.println(balance);
                  
                }

                rs.close();
                statement.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </div>
    </div>
     <a href="home.jsp">Home</a>
     <img src="balance.png">
</body>
</html>
