<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bank Website</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .navbar {
      background-color:white;
      color:black;
      display: flex;
    }

    .navbar ul {
      list-style-type: none;
      margin: 0;
      padding:0;
      display: flex;
    }

    .navbar li {
      padding: 20px;
      position: relative;
    }

    .navbar li a {
      color: black;
      text-decoration: none;
    }

    .navbar li:hover {
      background-color:lightgrey ;
    }

    .subnav {
      display: none;
      position: absolute;
      background-color: #f0f0f5;
      width: 100%;
      top: 100%;
      left: 0;
      z-index: 1;
    }

    .navbar li:hover .subnav {
      display: block;
    }

    .subnav a {
      color:  #c6d9ec;
      padding: 10px;
      display: block;
    }

    .subnav a:hover {
      background-color: grey;
    }
	body
	{
	  background-color:#ddebed; 
	}
	p{
	color:grey;font-size:17px;
	padding-left:5 px;
	text-align:center;
	}
	img{
height:200px;
display:block;
margin-left:auto;
margin-right:auto;
padding-top:100px;
}
p{
padding-left:300px;
padding-right:300px;
}
 </style>
</head>
<body>
  <div class="navbar">
    <ul>
      <li><a>Home</a></li>
      <li class="dropdown">
        <a>Accounts</a>
        <div class="subnav">
          <a href="display.jsp">Display</a>
          <a href="signup.jsp">Creation</a>
           <a href="close.jsp">Closure</a>
        </div>
      </li>
      <li class="dropdown">
        <a>History</a>
        <div class="subnav">
    
          <a href="mhistory.jsp">Transaction</a>
          <a href="loanhistory.jsp">Loan</a>
        </div>
      </li>
	   </li> 
      <li><a href="mquery.html">Queries</a></li>
	  <li><a href="mfaq.html">FAQ</a></li>
      <li><a href="login.jsp">Logout</a></li>
    </ul>
  </div>
  <br><br><br><br><br><br>
 <div class="p">
<p style=><i>Our Bank is a pioneer in the banking sector in India by being the first bank to digitalize all its branches in the country.</i> </p><br>
<p style=><i> With our Bank digital personal loans, you can get the funds you need anywhere and anytime with no manual documentation.
Our bank offers different type of accounts to meet your financial goals and secure your future. Choose from our wide range of deposit products that are specifically designed to keep your unique requirements in mind.</i></p>
</div>
  <img src="m.jpeg">
 
</body>
</html>