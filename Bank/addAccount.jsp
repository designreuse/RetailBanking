<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>
<%
	
	Connection conn = DBM.getConn();
	String action = request.getParameter("action");
	PreparedStatement PreState = null;
	PreparedStatement PreState2 = null;
	
	if(action != null && action.trim().equals("post")){
		String strCheckingNum = request.getParameter("checkingNum");
		int checkingNum = Integer.parseInt(strCheckingNum);
		String strSavingNum = request.getParameter("savingNum");
		int savingNum = Integer.parseInt(strSavingNum);
		String strId = request.getParameter("userid");
		int id = Integer.parseInt(strId);
		boolean autoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		int userid = id;
		String checking = "Checking";
		String saving= "Saving";
		String checkingSql = " insert into account values(?,?,null,?)";
		String savingSql = " insert into account values(?,?,null,?)";
		PreState = DBM.getPreState(conn,checkingSql,Statement.RETURN_GENERATED_KEYS);
		PreState.setInt(1,checkingNum);
		PreState.setString(2,checking);
		PreState.setInt(3,userid);
		PreState.executeUpdate();
		PreState2 = DBM.getPreState(conn,savingSql,Statement.RETURN_GENERATED_KEYS);
		PreState2.setInt(1,savingNum);
		PreState2.setString(2,saving);
		PreState2.setInt(3,userid);
		PreState2.executeUpdate();
	
		
		conn.commit();
		conn.setAutoCommit(true);
		
		
		//DBM.close(PreState);
		//DBM.close(PreState2);
		//DBM.close(conn);
		response.sendRedirect("AdminUser.jsp");
	}
	
		DBM.close(conn);
		DBM.close(PreState);
		DBM.close(PreState2);
		
	
%>
