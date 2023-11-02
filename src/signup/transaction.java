package signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/transaction")
public class transaction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "honey";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        double amount = Double.parseDouble(request.getParameter("amount"));
        long transactionId = generateTransactionId();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String accountNumber = user.getAccountNumber();
        double balance = getBalanceFromTransactionTable(accountNumber);
        if (type.equals("debit")) {
            if (balance < amount) {
                request.setAttribute("errorMessage", "Insufficient balance!");
                request.getRequestDispatcher("transaction.jsp").forward(request, response);
                return;
            }
            balance -= amount;
        } else if (type.equals("credit")) {
            balance += amount;
        }

        storeTransactionInDatabase(transactionId, accountNumber, type, amount, balance);

        if (type.equals("debit")) {
            response.sendRedirect("debit.jsp?amount=" + amount);
        } else if (type.equals("credit")) {
            response.sendRedirect("credit.jsp?amount=" + amount);
        }
    }

    private long generateTransactionId() {
        Random random = new Random();
        return 1000000000000000L + random.nextInt(900000000);
    }

    private double getBalanceFromTransactionTable(String accountNumber) {
        double balance = 0.0;

        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement("SELECT balance FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC LIMIT 1");
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                balance = rs.getDouble("balance");
            }
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return balance;
    }

    private void storeTransactionInDatabase(long transactionId, String accountNumber, String type, double amount, double balance) {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement("INSERT INTO transaction (transaction_id, acc, type, amount, balance, transaction_timestamp) VALUES (?, ?, ?, ?, ?, ?)");
            statement.setLong(1, transactionId);
            statement.setString(2, accountNumber);
            statement.setString(3, type);
            statement.setDouble(4, amount);
            statement.setDouble(5, balance);
            statement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
