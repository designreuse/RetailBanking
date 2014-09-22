package transactionServlets;

import DBconnect.DBM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 * Created by franklin on 9/19/14.
 */
@WebServlet(description = "add transaction to history", urlPatterns = { "/delete_transaction" })
public class deleteTransaction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);
        String transID = request.getParameter("transactionID");

        try{

            String sqlDelete= "delete from transactions where transactionsid=?";
            PreparedStatement ps =DBM.getPreState(con,sqlDelete);
            ps.setInt(1,Integer.parseInt(transID));
            ps.executeUpdate();
            response.sendRedirect("transaction.jsp");

        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "failed!");
        }
    }
}
