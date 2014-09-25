<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.bank.*,java.util.*"%>

<%
	Connection conn = DBM.getConn();
	String strId = request.getParameter("id");
	int id = Integer.parseInt(strId);
	session.setAttribute("id", id);
	String sql = "select * from account where userid = " + id;
	Statement state = DBM.getState(conn);
	ResultSet rs = DBM.executeQuery(state, sql);
	int checkingNumfirst = (int) Math.floor(Math.random() * 100000000);
	int savingNumfirst = (int) Math.floor(Math.random() * 100000000);
%>

<!DOCTYPE html>
<html>
<head>
<title>Detail Admin - User list</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/layout.css" />
<link rel="stylesheet" type="text/css" href="css/elements.css" />
<link rel="stylesheet" type="text/css" href="css/icons.css" />

<!-- libraries -->
<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- this page specific styles -->
<link rel="stylesheet" href="css/compiled/user-list.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>



<!-- navbar -->
<div class="navbar navbar-inverse">
<div class="navbar-inner">
<button type="button" class="btn btn-navbar visible-phone"
	id="menu-toggler"><span class="icon-bar"></span> <span
	class="icon-bar"></span> <span class="icon-bar"></span></button>
<img src="img/logo.png" />

<ul class="nav pull-right">

	<li class="dropdown"><a href="#"
		class="dropdown-toggle hidden-phone" data-toggle="dropdown"> Your
	account <b class="caret"></b> </a>
	<ul class="dropdown-menu">
		<li><a href="#">Personal info</a></li>
		<li><a href="#">Account settings</a></li>
		<li><a href="#">Billing</a></li>
		<li><a href="#">Export your data</a></li>

	</ul>
	</li>
	<li class="settings hidden-phone"><a href="signin.jsp"
		role="button"> <i class="icon-share-alt"></i> </a></li>
</ul>
</div>
</div>
<!-- end navbar -->

<!-- sidebar -->
<div id="sidebar-nav">
<ul id="dashboard-menu">
	<li class="active">
	<div class="pointer">
	<div class="arrow"></div>
	<div class="arrow_border"></div>
	</div>
	<a href="AdminUser.jsp"> <i class="icon-home"></i> <span>Users</span>
	</a></li>
 	<li>
      <a href="AdminAccount.jsp">
      <i class="icon-cog"></i>
      <span>Account</span>
      </a>
     </li>        
       <li>
        <a  href="transaction.jsp">
        <i class="icon-edit"></i>
        <span>Transaction</span>
                    
       </a>
        </li>
	<li><a href="signin.jsp"> <i class="icon-share-alt"></i> <span>Log out</span>
	<i class="icon-chevron-down"></i> </a></li>
</ul>
</div>
<!-- end sidebar -->


<!-- main container -->
<div class="content">

<div class="container-fluid">
<div id="pad-wrapper" class="users-list">
<div class="row-fluid header">
<h3>Account</h3>
<div class="span10 pull-right"><a data-toggle="modal"
	href="#addAccount" role="button" class="btn-flat success pull-right">
<span>&#43;</span> NEW Account </a>
<div id="addAccount" class="modal hide fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<form action="addAccount.jsp" method="post"><input type="hidden"
	name="action" value="post" /> <input type="hidden" name="userid"
	value="<%=id%>" />
<div class="modal-header" style="padding: 20px;">
<button type="button" class="close" data-dismiss="modal"
	aria-hidden="true"> </button>
<h4 class="modal-title">Add Account</h4>
</div>
<div class="modal-body">
<div class=" field-box"><label>Saving Account Number:</label> <input
	name="savingNum" value="<%=savingNumfirst%>" readonly /></div>
<div class=" field-box"><label>Checking Account Number:</label> <input
	name="checkingNum" value="<%=checkingNumfirst %>" readonly /></div>



</div>
<div class="modal-footer"><input type="submit" value="submit"
	class="btn btn-primary add-record-submit" />
<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
</div>
</form>
</div>
</div>
</div>
</div>
</div>

<!-- Users table -->
<div class="row-fluid table">
<table class="table table-hover">
	<thead>
		<tr>
			<th class="span3 sortable">Account Number</th>
			<th class="span3 sortable"><span class="line"></span>Account
			Type</th>
			<th class="span3 sortable"><span class="line"></span>Account
			Balance</th>
			<th class="span3 sortable align-right"><span class="line">Manage</span>

			</th>
		</tr>
	</thead>
	<tbody>
		<!-- row -->
		<%
			while (rs.next()) {
		%>
		<tr class="first" id="row<%=rs.getInt(1)%>">
			<td><a
				href="singleUserTransaction.jsp?accountNum=<%=rs.getInt(1)%>"
				class="name"><%=rs.getInt(1)%></a></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>
			<td class="align-right">
			<ul class="actions">
				<li><i class="table-edit"></i></li>
				<li class="last deleteAccount" id="<%=rs.getInt(1)%>"><i
					class="table-delete"></i></li>
			</ul>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</div>
<div class="pagination pull-right">
<ul>
	<li><a href="#">&#8249;</a></li>
	<li><a class="active" href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">&#8250;</a></li>
</ul>
</div>
<!-- end users table --></div>
</div>
</div>
<!-- end main container -->


<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>
<script language="javascript">

 $(document).ready(function(){
        $(".deleteAccount").click(function(){
            var accountID = this.id;
            $.get("deleteAccount.jsp?AccountID="+accountID,function(data,status){
                $("#row"+accountID).remove();
            });
        });

    });
    
       
                        
</script>

</body>
<%
	DBM.close(conn);
	DBM.close(state);
	DBM.close(rs);
%>
</html>