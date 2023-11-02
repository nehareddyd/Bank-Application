<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Request</title>
    <style>
        body {
             background-color: #ddebed;
            
        }

        h2 {
            margin-top: 20px;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .transaction-message {
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            font-weight: bold;
            display: none;
        }

        a {
            display: block;
            color: grey;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .conditions{
        align:center;
        padding-left:550px;}
        h2{
        text-align:center;}
    </style>
  
</head>
<body>
<h2>Loan Request</h2>
   <br><br>
   <div class=conditions>
   <p>For the loan to be approved,these following conditions must be checked</p>
    <p>For educational loan,Total credit amount >= 25,000</p>
   <p>For personal loan,Total credit amount >= 50,000</p>
   <p>For two-wheeler loan,Total credit amount >= 75,000</p>
   <p>For four-wheeler loan,Total credit amount >= 1,00,000</p>
   <p>For house loan,Total credit amount >= 2,00,000</p>
   </div><br><br><br>
    <div class="container">
        <form id="loan-form" method="post" action="loan">
            <div class="form-group">
                <select id="loan-type" name="loan-type">
                    <option value="personal-loan">Personal Loan</option>
                    <option value="educational-loan">Educational Loan</option>
                    <option value="two-wheeler-loan">2-Wheeler Loan</option>
                    <option value="four-wheeler-loan">4-Wheeler Loan</option>
                    <option value="house-loan">House Loan</option>
                </select>
            </div><br><br>
            <div class="form-group">
                <label for="loan-amount">Loan Amount:</label>
                <input type="number" id="loan-amount" name="loan-amount" required>
            </div>
            <button type="submit">Request Loan</button>
        </form>
 <% String rejectionReason = (String) request.getAttribute("rejectionReason");
            if (rejectionReason != null) { %>
                <p style="color: red;"><%= rejectionReason %></p>
            <% } %>
     
    </div><br>
    <a href="home.jsp">Home</a>
</body>
</html>
