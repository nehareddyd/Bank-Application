package signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class signupservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String aadhaar = request.getParameter("aadhaar");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String acc = accnum.generateAccountNumber();
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true", "root", "honey");
            PreparedStatement pst = con.prepareStatement("INSERT INTO users (name, email, phone, aadhaar, address, password, acc,gender) VALUES (?, ?, ?, ?, ?, ?, ?,?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, aadhaar);
            pst.setString(5, address);
            pst.setString(6, password);
            pst.setString(7, acc);
            pst.setString(8, gender);
            int c = pst.executeUpdate();
            if (c > 0) {
               
                User user = new User(name, email, phone, aadhaar, address, password, acc, gender);

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                 request.setAttribute("status","success");
                response.sendRedirect("signup.jsp");
            } else {
                request.setAttribute("status", "failed");
                response.sendRedirect("signup.jsp");
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
