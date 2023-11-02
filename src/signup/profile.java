package signup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getProfile")
public class profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accNumber = request.getParameter("accNumber");
        String name = "";
        String email = "";
        String phone = "";
        String gender = "";
        String address = "";
        String aadhaar = "";

        try {
            // Replace "jdbc:mysql://localhost:3306/db_name" with your database URL
            String dbURL = "jdbc:mysql://localhost:3306/bank";
            String dbUser = "root";
            String dbPassword = "honey";
            Class.forName("com.mysql.jdbc.Driver");

            // Create a connection to the database
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT name, email, phone, gender, address, aadhaar FROM users WHERE acc = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, accNumber);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                name = resultSet.getString("name");
                email = resultSet.getString("email");
                phone = resultSet.getString("phone");
                gender = resultSet.getString("gender");
                address = resultSet.getString("address");
                aadhaar = resultSet.getString("aadhaar");
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String userDetailsJSON = "{\"name\":\"" + name + "\", \"email\":\"" + email + "\", \"phone\":\"" + phone
                + "\", \"gender\":\"" + gender + "\", \"address\":\"" + address + "\", \"aadhaar\":\"" + aadhaar + "\"}";

        PrintWriter out = response.getWriter();
        out.print(userDetailsJSON);
        out.flush();
    }
}


