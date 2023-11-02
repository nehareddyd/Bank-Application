<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <script>
        function getProfile() {
            var accNumber = document.getElementById("accNumber").value;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var userDetails = JSON.parse(xhr.responseText);
                    document.getElementById("name").innerText = userDetails.name;
                    document.getElementById("email").innerText = userDetails.email;
                    document.getElementById("phone").innerText = userDetails.phone;
                    document.getElementById("gender").innerText = userDetails.gender;
                    document.getElementById("address").innerText = userDetails.address;
                    document.getElementById("aadhaar").innerText = userDetails.aadhaar;
                }
            };
            xhr.open("POST", "getProfile", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("accNumber=" + accNumber);
        }
    </script>
    <style>
    	a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
   body
        {
            background-color:#ddebed;
            padding:50px;
        }
  h2{
  text-align:center;}
  
  </style>
</head>
<body>
    <h2>User Profile</h2><br><br>
    <form>
        Enter Account Number: <input type="text" id="accNumber">
        <input type="button" value="Get Profile" onclick="getProfile()">
    </form>
    <hr>
    <h3>User Details:</h3>
    <p>
        Name: <span id="name"></span><br>
        Email: <span id="email"></span><br>
        Phone: <span id="phone"></span><br>
        Gender: <span id="gender"></span><br>
        Address: <span id="address"></span><br>
        Aadhaar: <span id="aadhaar"></span><br>
    </p><br><br>
    <a href='displayall.jsp'>Display all</a>
    <a href="mhome.jsp">Home</a>
</body>
</html>
