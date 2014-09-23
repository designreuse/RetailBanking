<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*,java.text.SimpleDateFormat"%>
<%
Connection conn = DBM.getConn();
String name=request.getParameter("name");
String pw=request.getParameter("pw");
String dob=request.getParameter("dob");
String add=request.getParameter("add");
String city=request.getParameter("city");
String zip=request.getParameter("zip");
int ssn =Integer.parseInt(request.getParameter("ssn"));
String country=request.getParameter("country");
String address = add+city+zip+country;


String email=request.getParameter("email");
if(name!=""&&pw!=""){
	java.sql.Date date=null;
	if(dob!=""){	
	SimpleDateFormat format= new SimpleDateFormat("MM/dd/yyyy");
	java.util.Date date1= format.parse(dob);
	date = new java.sql.Date(date1.getTime());
	}
	int phone=0;	
	if(request.getParameter("phone")!="")
	phone=Integer.parseInt(request.getParameter("phone"));
	System.out.println(name+" "+pw+" "+dob+" "+address+" "+email+" "+phone);
	String sql = "INSERT INTO user ( username, email,phone,address,ssn,birthday,password)"
					+"VALUES( ?, ?,?,?,?,?,?)";
	PreparedStatement ps = DBM.getPreState(conn,sql,Statement.RETURN_GENERATED_KEYS);
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setInt(3,phone);
	ps.setString(4,address);
	ps.setInt(5,ssn);
	ps.setDate(6,date);
	ps.setString(7,pw);
	int i =ps.executeUpdate();
	System.out.println(i);
	String sql2 = "select userid from User where username=name AND password";
	Statement state = DBM.getState(conn);
	ResultSet rs =  ps.getGeneratedKeys();
	int userid = -1;

		if(rs.next()){
		    userid = rs.getInt(1);
		    int checknum =(int)Math.floor(Math.random()*100000000);
		    int savenum =(int)Math.floor(Math.random()*100000000);
		    String checking = "Checking";
			String saving= "Saving";
			String checkingSql = " insert into account(accountnumber,accounttype,balance,userid) values(?,?,0,?)";
			String savingSql = " insert into account(accountnumber,accounttype,balance,userid) values(?,?,0,?)";
			PreparedStatement ps2 = DBM.getPreState(conn,checkingSql,Statement.RETURN_GENERATED_KEYS);
			ps2.setInt(1,checknum);
			ps2.setString(2,checking);
			ps2.setInt(3,userid);
			ps2.executeUpdate();
			PreparedStatement ps3 = DBM.getPreState(conn,savingSql,Statement.RETURN_GENERATED_KEYS);
			ps3.setInt(1,savenum);
			ps3.setString(2,saving);
			ps3.setInt(3,userid);
			ps3.executeUpdate();
		    System.out.println(checknum+" "+savenum);
		    //session.setAttribute("userid",userid);
		    response.sendRedirect("index.jsp?user="+userid);
		    //response.sendRedirect("UserProfile.jsp?");
			DBM.close(ps2);
			DBM.close(ps3);
		}else {
		   userid = -1;
		   response.sendRedirect("signup.jsp");
		}
	System.out.println(userid);
	
	DBM.close(ps);
	DBM.close(rs);
}
else{
	response.sendRedirect("signup.jsp");	
}
DBM.close(conn);
%>