package transactionServlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import com.bank.*;
import java.sql.*;


public class addTransaction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);

        try{
            String sqlAddMoney = "insert into transactions values(null,?,?,?,?,?,?,?)";
            PreparedStatement ps =DBM.getPreState(con,sqlAddMoney);
            ps.setString(1,request.getParameter("dateTransfer"));
            ps.setDouble(2,Double.parseDouble(request.getParameter("amount")));
            ps.setInt(3,Integer.parseInt(request.getParameter("from")));
            ps.setInt(4,Integer.parseInt(request.getParameter("to")));
            ps.setString(5,request.getParameter("description"));
            ps.setString(6,request.getParameter("pickType"));
            ps.setString(7,"P");
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
