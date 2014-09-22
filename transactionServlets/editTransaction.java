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
 * Created by franklin on 9/18/14.
 */
@WebServlet(description = "edit transaction ", urlPatterns = { "/edit_transaction" })
public class editTransaction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);
        String transID = request.getParameter("getTransactionID");
        try{

            String sqlAddMoney = "update transactions set date=?,amount=?,sender=?,receiver=?,description=?,type=?,status=? where transactionsid=?";
            PreparedStatement ps =DBM.getPreState(con,sqlAddMoney);
            ps.setString(1,request.getParameter("dateTransfer"));
            ps.setDouble(2,Double.parseDouble(request.getParameter("amount")));
            ps.setString(3,request.getParameter("from"));
            ps.setString(4,request.getParameter("to"));
            ps.setString(5,request.getParameter("description"));
            ps.setString(6,request.getParameter("pickType"));
            ps.setString(7,"P");
            ps.setInt(8,Integer.parseInt(transID));
            ps.executeUpdate();
            response.sendRedirect("transaction.jsp");

        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(null,"failed!");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
