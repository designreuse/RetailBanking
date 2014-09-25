<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>
    
<%
	String strId = request.getParameter("AccountID");
	int id = Integer.parseInt(strId);
	Connection con = DBM.getConn();
	Statement state1 = DBM.getState(con);
	//String sql = "select * from user where userid = " + id;
	//ResultSet rs = state.executeQuery(sql);
	System.out.println(strId);
	String delAccountSql = "delete from account where accountnumber = " + id;
	DBM.executeUpdate(state1,delAccountSql);
	DBM.close(state1);
	DBM.close(con);
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