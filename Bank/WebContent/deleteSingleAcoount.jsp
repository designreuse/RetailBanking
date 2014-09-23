<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>
    
<%
	String strSid = request.getParameter("sid");
	int sid = Integer.parseInt(strSid);
	Connection con = DBM.getConn();
	Statement state1 = DBM.getState(con);
	String delAccountSql = "delete from account where userid = " + sid;
	DBM.executeUpdate(state1,delAccountSql);
	DBM.close(state1);
	DBM.close(con);
	response.sendRedirect("AdminUser.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Congratulation!
</body>
</html>