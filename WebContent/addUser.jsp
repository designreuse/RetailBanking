<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, com.bank.*" %>
<%
String action = request.getParameter("action");
if(action != null && action.trim().equals("post")){
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String ssn = request.getParameter("ssn");
	String birthday = request.getParameter("birthday");
	String checkingNum = request.getParameter("checkingNum");
	String savingNum = request.getParameter("savingNum");

	
	Connection con = DBM.getConn();
	
	boolean autoCommit = con.getAutoCommit();
	con.setAutoCommit(false);
	//insert user information into user table
	int userid = -1;
	String sql = " insert into user values(null,?,?,?,?,?,?)";
	PreparedStatement PreState = DBM.getPreState(con,sql,Statement.RETURN_GENERATED_KEYS);
	PreState.setString(1,username);
	PreState.setString(2,email);
	PreState.setString(3,phone);
	PreState.setString(4,address);
	PreState.setString(5,ssn);
	PreState.setString(6,birthday);
	PreState.executeUpdate();
	//insert userid and accountNum  into account table
	ResultSet rsKey = PreState.getGeneratedKeys();
	rsKey.next();
	userid = rsKey.getInt(1);
	String checking = "Checking";
	String saving= "Saving";
	String checkingSql = " insert into account values(?,?,null,?)";
	String savingSql = " insert into account values(?,?,null,?)";
	PreparedStatement PreState2 = DBM.getPreState(con,checkingSql,Statement.RETURN_GENERATED_KEYS);
	PreState2.setString(1,checkingNum);
	PreState2.setString(2,checking);
	PreState2.setInt(3,userid);
	PreState2.executeUpdate();
	PreparedStatement PreState3 = DBM.getPreState(con,savingSql,Statement.RETURN_GENERATED_KEYS);
	PreState3.setString(1,savingNum);
	PreState3.setString(2,saving);
	PreState3.setInt(3,userid);
	PreState3.executeUpdate();
	
	con.commit();
	con.setAutoCommit(true);
	
	DBM.close(PreState);
	DBM.close(con);
	
	response.sendRedirect("Users.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script language="javascript"> 
var i=0; 
var timer1; 

function doPrint() { 
//bdhtml=window.document.body.innerHTML; 
//sprnstr="<!--startprint-->"; 
//eprnstr="<!--endprint-->"; 
//prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
//prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
//window.document.body.innerHTML=prnhtml; 
window.print(); 
// window.document.body.innerHTML=bdhtml; 


} 

function init(){ 

	x=Math.random(); 
	x=Math.floor(x*100000000); 
	y=Math.random();
	y=Math.ceil(y*100000000)
	if(x<9999999){ 
	init(); 
	}
	else{ 
	i++; 
	document.all.show1.innerText=x; 
	document.all.show2.innerText=y; 
	
	if(i<20){ 
	timer1=setTimeout("init()",50); 
		} 

	} 

} 

</script> 
<form action="addUser.jsp" method="post">
<input type = "hidden" name = "action" value = "post" />
	<table>
		<tr>
			<td><label>User Name: </label></td>
			<td><input type = "text" name = "username"></td>
		</tr>
		<tr>
			<td><label>Email: </label></td>
			<td><input type = "text" name = "email"></td>
		</tr>
		<tr>
			<td><label>Phone: </label></td>
			<td><input type = "text" name = "phone"></td>
		</tr>
		<tr>
			<td><label>Address: </label></td>
			<td><input type = "text" name = "address"></td>
		</tr>
		<tr>
			<td><label>SSN: </label></td>
			<td><input type = "text" name = "ssn"></td>
		</tr>
		<tr>
			<td><label>Birthday: </label></td>
			<td><input type = "text" name = "birthday"></td>
		</tr>
		<tr> 
			<td><label >Saving Account Number: </label></td>
			<td><input type = "text" name = "savingNum" id = "show1"></td>
		</tr>
		<tr> 
			<td><label >Checking Account Number: </label></td>
			<td><input type = "text" name = "checkingNum" id = "show2"></td>
		</tr>
		
	</table>
		<input type = "submit" value = "submit"/>
 </form>
	
</body>
<script language="javascript"> 
init(); 
</script> 
</html>