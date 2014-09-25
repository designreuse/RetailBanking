    
<%
String adminLogIn = (String)session.getAttribute("adminLogined");
 if(adminLogIn != null && adminLogIn.trim().equals("true")){
	 System.out.print("login success!");
	 }
 else{
	 response.sendRedirect("signin.jsp");
 }
 
%>