<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
   body {
            background-color: #ddebed;
            text-align:center;
           
        }
         a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
  .container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 20vh;
  font-size: clamp(2rem, 2.8vw, 5rem);
  font-family: Raleway;
  font-weight: bold;
}

.typewriter {
  width: 25.5ch;
  white-space: nowrap;
  overflow: hidden;
  border-right: 4px solid #212121;
  animation: cursor 1s step-start infinite, 
    text 5s steps(18) alternate infinite;
}

@keyframes cursor {
  0%, 100% { 
    border-color: #212121; 
  }
}

@keyframes text {
  0% { 
    width: 0; 
  }
  100% { 
    width: 25.5ch; 
  }
}
      
</style>
<body><br><br><br><br><br><br><br><br><br><br><br><br>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,400i,700">

<div class="container">
  <div class="typewriter">Thank you for banking with us!</div>
</div>
<h3>Loan requested and approved</h3><br><br>
<a href="home.jsp">Home</a>
</body>
</html>
 