package transactionServlets;

import DBconnect.DBM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Created by franklin on 9/19/14.
 */
@WebServlet(description = "transfer Money", urlPatterns = { "/transfer" })
public class transferMoney extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBM.getConn();
        Statement st = DBM.getState(con);
        int userID = 1;
        try{


        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
