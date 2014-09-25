package transactionServlets;


import com.bank.DBM;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.http.*;

/**
 * Created by franklin on 9/19/14.
 */
public class transfer_Money extends HttpServlet {
    private double currentBalance;
    private int senderAccount;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);

       
        HttpSession session = request.getSession();
        String strUserId = session.getAttribute("userid").toString();
        int userID = Integer.parseInt(strUserId);
        //data get from the form submitted
       
        String type = request.getParameter("from");

        int toAccount = Integer.parseInt(request.getParameter("to"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String description = request.getParameter("description");


        try{
            //current user account number(checking is used to transfer)

            String sqlSenderAccount="select accountnumber from account where userid = ? and accounttype = ?";
            PreparedStatement senderAccountDB = DBM.getPreState(con,sqlSenderAccount);
            senderAccountDB.setInt(1,userID);
            senderAccountDB.setString(2,type);
            ResultSet strAccountNumber = senderAccountDB.executeQuery();
            if(strAccountNumber.next()) {
                senderAccount = strAccountNumber.getInt(1);
            }
            //validate current balance
            String currentBalanceSql = "select balance from account where userid = ? and accounttype = ? ";

            PreparedStatement currentBalanceDB = DBM.getPreState(con,currentBalanceSql);
            currentBalanceDB.setInt(1,userID);
            currentBalanceDB.setString(2,type);
            ResultSet rs = currentBalanceDB.executeQuery();
            if(rs.next()) {
                currentBalance = rs.getDouble(1);
            }
            //if current balance<=0, return error
            if(currentBalance<=amount){
                response.setContentType("text/html");
                response.getWriter().println("<script type='application/javascript'>alert(\"not enough balance, please make sure it's more than 0!\");location.href='transfer.jsp';</script>");
                }

            else{
                //update sender amount
                String sqlSenderUpdate="update account set balance= balance-? where accountnumber in (select * from(select accountnumber from account where userid = ? and accounttype ='checking')as X)";
                //update receiver amount
                String sqlReceiverUpdate="update account set balance= balance+? where accountnumber = ?";
                //insert new transaction
                String sqlTransactionUpdate = "insert into transactions values(null,?,?,?,?,?,?,?)";

                //sender subtract amount
                PreparedStatement updateAmountSender = DBM.getPreState(con,sqlSenderUpdate);
                updateAmountSender.setDouble(1,amount);
                updateAmountSender.setInt(2,userID);
                updateAmountSender.executeUpdate();
                //receiver add amount
                PreparedStatement updateAmountReceiver =DBM.getPreState(con,sqlReceiverUpdate);
                updateAmountReceiver.setDouble(1,amount);
                updateAmountReceiver.setInt(2,toAccount);
                updateAmountReceiver.executeUpdate();
                //add a new transaction based on sender and receiver
                PreparedStatement addNewtransaction = DBM.getPreState(con,sqlTransactionUpdate);
                addNewtransaction.setDate(1,new java.sql.Date(new Date().getTime()));
                addNewtransaction.setDouble(2,amount);
                addNewtransaction.setInt(3,senderAccount);
                addNewtransaction.setInt(4,toAccount);
                addNewtransaction.setString(5,description);
                addNewtransaction.setString(6,"transfer");
                addNewtransaction.setString(7,"processing");
                addNewtransaction.executeUpdate();
                response.sendRedirect("userAccountFromSignIn.jsp");

            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
