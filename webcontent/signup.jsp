 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Account Creation</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color:#ddebed;
    margin: 0;
}

.container {
    max-width: 500px;
    margin: 50px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-size: 14px;
    font-weight: bold;
    color: #555;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
select:focus {
    border-color: #5f9ea0;
}

.btn-submit {
    background-color: #5f9ea0;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    transition: background-color 0.3s ease;
}

.btn-submit:hover {
    background-color: #4a8789;
}

.form-footer {
    margin-top: 30px;
}

.form-footer p {
    font-size: 14px;
    color: #555;
    text-align: center;
}

.form-footer a {
    color: #5f9ea0;
    text-decoration: none;
}

.form-footer a:hover {
    text-decoration: underline;
}
.success-message {
      background-color: #dff0d8;
      color: #3c763d;
      padding: 10px;
      margin-top: 20px;
      border-radius: 4px;
    } 
     .message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 10px;
            margin-top: 20px;
            border-radius: 4px;
        }
</style>
<body>
    <div class="container">
        <h1>Account Creation</h1>
        <form  id="form" method="post" action="register">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="aadhaar">Aadhaar Number</label>
                <input type="text" id="aadhaar" name="aadhaar" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-footer">
                <input type="submit" value="Create Account" class="btn-submit">
                <p>By clicking the "Create Account" button, you agree to our <a href="#">Terms and Conditions</a>.</p>
                <p>Have an Account?<a href="login.jsp">Login</a></p></div>
        </form>
         <% 
                String status = (String) request.getAttribute("status");
                if (status != null && status.equals("success")) {
                    out.println("<div class='message'>Account created successfully.</div>");
                }
            %>  
    
  </div>
</body>
</html>