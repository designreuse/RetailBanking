<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>
    
<%
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);
	Connection con = DBM.getConn();
	Statement state = DBM.getState(con);
	//String sql = "select * from user where userid = " + id;
	//ResultSet rs = state.executeQuery(sql);
	System.out.println(strId);
	String delSql = "delete from user where userid = " + id;
	DBM.executeUpdate(state,delSql);
	DBM.close(state);
	response.sendRedirect("Users.jsp");
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