<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>
<%
Connection conn = DBM.getConn();
String user=request.getParameter("username");
String pass=request.getParameter("password");
String sql = "select userid from user where username=? And password=?";
System.out.println(pass+" "+user);
PreparedStatement ps = DBM.getPreState(conn,sql);
ps.setString(1,user);
ps.setString(2,pass);
ResultSet rs=ps.executeQuery();
while (rs.next()) {
	System.out.print("userid:"+ rs.getString(1));
}
if(user!=""&&pass!=""){
	
    if(user.equalsIgnoreCase("admin") && pass.equals("admin") )
		{
		out.print("admin");
		}
	else if(rs.next()){
			int userid=rs.getInt(1);
			out.print(userid);
		}
	else
		{
		out.print("error");
		}
}
else out.print("error");
DBM.close(conn);
DBM.close(ps);
DBM.close(rs);
%>