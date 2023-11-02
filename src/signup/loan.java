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

@WebServlet("/loan")
public class loan extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bank?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "honey";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loanType = request.getParameter("loan-type");
        double loanAmount = Double.parseDouble(request.getParameter("loan-amount"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String accountNumber = user.getAccountNumber();

        
        int numCredits = 0;
        double totalCreditAmount = 0.0;

        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT type, amount FROM transaction WHERE acc = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, accountNumber);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String accountType = rs.getString("type");
                double amount = rs.getDouble("amount");

                if (accountType.equals("credit")) {
                    numCredits++;
                    totalCreditAmount += amount;
                }
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Approve loans based on totalCreditAmount
        boolean isLoanApproved = false;
        String rejectionReason = "";

        if (totalCreditAmount >= 50000 && loanType.equals("personal-loan")) {
            isLoanApproved = true;
        } else if (totalCreditAmount >= 75000 && loanType.equals("two-wheeler-loan")) {
            isLoanApproved = true;
        } else if (totalCreditAmount >= 100000 && loanType.equals("four-wheeler-loan")) {
            isLoanApproved = true;
        } else if (totalCreditAmount >= 25000 && loanType.equals("educational-loan")) {
            isLoanApproved = true;
        } else if (totalCreditAmount >= 200000 && loanType.equals("house-loan")) {
            isLoanApproved = true;
        } else {
            // Loan request is rejected, set the rejection reason
            rejectionReason = "Loan request is rejected. Insufficient credit amount for the selected loan type.";
        }

        if (isLoanApproved) {
            
            double balance = getBalanceFromTransactionTable(accountNumber);
            balance += loanAmount;
            updateBalanceInDatabase(accountNumber, balance);

            long loanId = generateLoanId();
            storeLoanInDatabase(loanId, accountNumber, loanType, loanAmount);

            response.sendRedirect("approved.jsp");
        } else {
            
            request.setAttribute("rejectionReason", rejectionReason);
            request.getRequestDispatcher("/loan.jsp").forward(request, response);
        }
    }

    private double getBalanceFromTransactionTable(String accountNumber) {
        double balance = 0.0;
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT balance FROM transaction WHERE acc = ? ORDER BY transaction_timestamp DESC LIMIT 1";
            PreparedStatement statement = conn.prepareStatement(sql);
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

    private void updateBalanceInDatabase(String accountNumber, double balance) {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "UPDATE transaction SET balance = ? WHERE acc = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setDouble(1, balance);
            statement.setString(2, accountNumber);
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void storeLoanInDatabase(long loanId, String accountNumber, String loanType, double loanAmount) {
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO loan (loan_id, acc, loan_type, loan_amount, loan_timestamp) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, loanId);
            statement.setString(2, accountNumber);
            statement.setString(3, loanType);
            statement.setDouble(4, loanAmount);
            statement.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private long generateLoanId() {
        Random random = new Random();
        return 100000000000L + random.nextInt(90000000);
    }
}
