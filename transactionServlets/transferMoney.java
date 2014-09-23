package transactionServlets;

import com.bank.DBM;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;


public class transferMoney extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);
        double currentBalance;
        int userID = 1;
        String type = request.getParameter("from");
        int toAccount = Integer.parseInt(request.getParameter("to"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String description = request.getParameter("description");
        try{
            String currentBalanceSql = "select balance from account where userid ="+userID+" and type = 'checking' ";
            ResultSet rs = DBM.executeQuery(st,currentBalanceSql);
            currentBalance= rs.getDouble(1);
            if(currentBalance<=0){
                response.setContentType("text/javascript");
                response.getWriter().println("<script>alert('not enough balance, please make sure it's more than 0!')</script>");
            }
            else{
                String sqlSenderUpdate="update account set balance-="+amount+" where accountnumber =(select accountNumber from account where userid ="+userID+"and type ='checking' )";
                String sqlReceiverUpdate="update account set balance+="+amount+"where accountnumber = "+toAccount;
                String sqlTransactionUpdate = "insert into transactions values("+new Date()+

            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
