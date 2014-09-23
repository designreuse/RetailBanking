<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, com.bank.*,java.text.DateFormat,java.text.SimpleDateFormat"%>

<%
Connection con;
String action = request.getParameter("actionEdit");
if(action != null && action.trim().equals("post2")){
	String username = request.getParameter("editusername");
	String email = request.getParameter("editemail");
	String strPhone = request.getParameter("editphone");
	int phone = Integer.parseInt(strPhone);
	String address = request.getParameter("editaddress");
	String strSsn = request.getParameter("editssn");
	int ssn = Integer.parseInt(strSsn);
	
	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	String strBirthday = request.getParameter("editbirthday");
	java.util.Date utilBirthday = fmt.parse(strBirthday);
	java.sql.Date birthday = new java.sql.Date(utilBirthday.getTime());
	
	String strId = request.getParameter("getTransactionID");
	int id = Integer.parseInt(strId);
	out.println(id);
	
	con = DBM.getConn();
	
	boolean autoCommit = con.getAutoCommit();
	con.setAutoCommit(false);
	
	String updateSql = "update user set username = ? , email = ?, phone = ?, address = ?, ssn = ?, birthday = ? where userid = " + id;
	PreparedStatement PreState = DBM.getPreState(con,updateSql,Statement.RETURN_GENERATED_KEYS);
	PreState.setString(1,username);
	PreState.setString(2,email);
	PreState.setInt(3,phone);
	PreState.setString(4,address);
	PreState.setInt(5,ssn);
	PreState.setDate(6,birthday);
	PreState.executeUpdate();

	con.commit();
	con.setAutoCommit(true);
	
	DBM.close(PreState);
	DBM.close(con);
	
	response.sendRedirect("AdminUser.jsp");
}
%>
