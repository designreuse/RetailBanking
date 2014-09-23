<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException,com.bank.*,java.sql.*" %>
<%@ page import="javax.xml.transform.Result" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

				Connection con = DBM.getConn();
				String sql = "SELECT * FROM transactions where receiverAccount in (select accountnumber from account where userid= ?)or senderAccount in (select accountnumber from account where userid= ?)";
				PreparedStatement ps = DBM.getPreState(con,sql);
				//String strId = session.getAttribute("userid").toString();
				//int id = Integer.parseInt(strId);
				String strSessionId = session.getAttribute("userid").toString();
				int id = Integer.parseInt(strSessionId);
				ps.setInt(1,id);
				ps.setInt(2,id);
				ResultSet rs = ps.executeQuery();
				String exportToExcel = request.getParameter("exportToExcel");
				if (exportToExcel != null
						&& exportToExcel.toString().equalsIgnoreCase("YES")) {
					response.setContentType("application/vnd.ms-excel");
					response.setHeader("Content-Disposition", "attachment; filename="
							+ "excel.xls");
		
				}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table >
        <thead>
        <tr>
            <th >
                Date
            </th>
            <th >
                From
            </th>
            <th >
                to
            </th>
            <th >
                <span ></span>Type
            </th>
            <th >
                <span ></span>Amount
            </th>
            <th >
                <span ></span>status
            </th>
            <th >
                <span ></span>Description
            </th>
        </tr>
        </thead>
        <tbody>
        <!-- row -->


        <% 
            while (rs.next()){

        %>
        <tr  id="row<%=rs.getInt(1)%>">
            <td>
                <%=rs.getString(2)%>
            </td>
            <td>
                <%=rs.getInt(4)%>
            </td>
            <td>
                <%=rs.getInt(5)%>
            </td>
            <td>
                <%=rs.getString(7)%>
            </td>
            <td >
               <span>$ </span><%=rs.getDouble(3)%>
            </td>
            <td >
                <%=rs.getString(8)%>
            </td>
            <td class="hidden" id="transactionID">
                <%=rs.getInt(1)%>
            </td>
            <%--<% transactionID=rs.getInt(1);%>--%>
            <td>
                <%=rs.getString(6)%>
            </td>
        </tr>

        <%
         }
        %>



        </tbody>
    </table>

</body>
</html>