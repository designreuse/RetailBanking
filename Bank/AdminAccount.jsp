<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*"%>

<%
Connection conn = DBM.getConn();
String sql = "select * from account order by userid";
Statement state = DBM.getState(conn);
ResultSet rs = DBM.executeQuery(state,sql);


%>

<!DOCTYPE html>
<html>
<head>
	<title>Detail Admin - User list</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
           <img src="img/logo.png" />

            <ul class="nav pull-right">                
               
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                        Your account
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="personal-info.html">Personal info</a></li>
                        <li><a href="#">Account settings</a></li>
                        <li><a href="#">Billing</a></li>
                        <li><a href="#">Export your data</a></li>
                        <li><a href="#">Send feedback</a></li>
                    </ul>
                </li>
                <li class="settings hidden-phone">
                    <a href="personal-info.html" role="button">
                        <i class="icon-cog"></i>
                    </a>
                </li>
                <li class="settings hidden-phone">
                    <a href="signin.html" role="button">
                        <i class="icon-share-alt"></i>
                    </a>
                </li>
            </ul>            
        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
    <div id="sidebar-nav">
        <ul id="dashboard-menu">
            <li  class="active">                
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="AdminUser.jsp">
                    <i class="icon-home"></i>
                    <span>Users</span>
                </a>
            </li>            
            <li>
                <a href="personal-info.html">
                    <i class="icon-cog"></i>
                    <span>My Info</span>
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-share-alt"></i>
                    <span>Extras</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="code-editor.html">Code editor</a></li>
                    <li><a href="grids.html">Grids</a></li>
                    <li><a href="signin.html">Sign in</a></li>
                    <li><a href="signup.html">Sign up</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->
    

	<!-- main container -->
    <div class="content">
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>Account</h3>
                    <div class="span10 pull-right">

                        <a href="#" class="btn-flat success pull-right">
                            <span>&#43;</span>
                            NEW Account
                        </a>
                    </div>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                           		<th class="span3 sortable">
                                  User ID
                                </th>
                                <th class="span3 sortable">
                                   Account Number
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Account Type
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Account Balance
                                </th>
                                <th class="span3 sortable align-right">
                                    <span class="line">Manage</span>

                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <%
                        	while(rs.next()){
                        %>
                        <tr class="first">
                        	 <td>
                                <%=rs.getInt(4)%>
                            </td>
                            <td>
                                <a href="AdminUser.jsp" class="name"><%=rs.getInt(1) %></a>
                            </td>
                            <td>
                                <%=rs.getString(2) %>
                            </td>
                            <td>
                               <%=rs.getInt(3)%>
                            </td>
                            <td class="align-right">
                                <ul class="actions">
                                    <li><i class="table-edit"></i></li>
                                    <li class="last"><a  href="deleteAccount.jsp?id=<%=rs.getInt(4)%>"role="button"><i class="table-delete"></i></a></li>
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
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
<%
DBM.close(conn);
DBM.close(state);
DBM.close(rs);
%>
</html>