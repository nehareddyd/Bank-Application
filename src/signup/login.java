package signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType");
        if (loginType != null && loginType.equals("employee")) {
        	if( email.equals("manager@gmail.com") && password.equals("manager123")) {
            response.sendRedirect("mhome.jsp");
            return;
        	}
        	else {
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        	
        }
        if (loginType != null && loginType.equals("customer")) {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true", "root", "honey");

            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String aadhaar = rs.getString("aadhaar");
                String address = rs.getString("address");
                String acc = rs.getString("acc");
                String gender = rs.getString("gender");
                User user = new User(name, email, phone, aadhaar, address, password, acc, gender);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
}