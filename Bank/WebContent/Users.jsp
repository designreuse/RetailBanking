<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>

<%
Connection conn = DBM.getConn();
String sql = "select * from User";
Statement state = DBM.getState(conn);
ResultSet rs = DBM.executeQuery(state,sql);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserList</title>
</head>

<body>
<a href="addUser.jsp">Add new user</a>
<table border = "1">
<tr>
	<td>ID</td>
	<td>NAME</td>
	<td>EMAIL</td>
	<td>PHONE</td>
	<td>ADDRESS</td>
	<td>SSN</td>
	<td>BIRSTHDAY</td>
</tr>
<% while(rs.next()){
%>
<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getInt(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getInt(6) %></td>
	<td><%=rs.getDate(7) %></td>
	<td><a href="deleteUser.jsp?id=<%=rs.getInt(1)%>">DEL</a></td>
	<td><a href="updateUser.jsp?id=<%=rs.getInt(1)%>">EDIT</a></td>
</tr>
<%
   }
%>
<%
DBM.close(rs);
DBM.close(state);
DBM.close(conn);
%>
</table>
</body>
</html>
