<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*, java.text.DateFormat,java.text.SimpleDateFormat"%>

<%
	Connection conn = DBM.getConn();
	String showSql = "select * from User";
	Statement state = DBM.getState(conn);
	ResultSet rs = DBM.executeQuery(state,showSql);
	PreparedStatement PreState = null;
	PreparedStatement PreState2 = null;
	
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("post")){
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String strPhone = request.getParameter("phone");
		int phone = Integer.parseInt(strPhone);
		String address = request.getParameter("address");
		String strSsn = request.getParameter("ssn");
		int ssn = Integer.parseInt(strSsn);
		
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String strBirthday = request.getParameter("birthday");
		java.util.Date utilBirthday = fmt.parse(strBirthday);
		java.sql.Date birthday = new java.sql.Date(utilBirthday.getTime());
		
		String strCheckingNum = request.getParameter("checkingNum");
		int checkingNum = Integer.parseInt(strCheckingNum);
		String strSavingNum = request.getParameter("savingNum");
		int savingNum = Integer.parseInt(strSavingNum);
		
		
		boolean autoCommit = conn.getAutoCommit();
		conn.setAutoCommit(false);
		//insert user information into user table
		String password = "123456";
		int userid = -1;
		String sql = " insert into user values(null,?,?,?,?,?,?,?)";
		PreState = DBM.getPreState(conn,sql,Statement.RETURN_GENERATED_KEYS);
		PreState.setString(1,username);
		PreState.setString(2,email);
		PreState.setInt(3,phone);
		PreState.setString(4,address);
		PreState.setInt(5,ssn);
		PreState.setDate(6,birthday);
		PreState.setString(7,password);
		PreState.executeUpdate();
		//insert userid and accountNum  into account table
		ResultSet rsKey = PreState.getGeneratedKeys();
		rsKey.next();
		userid = rsKey.getInt(1);
		String checking = "Checking";
		String saving= "Saving";
		String checkingSql = " insert into account values(?,?,null,?)";
		String savingSql = " insert into account values(?,?,null,?)";
		PreState2 = DBM.getPreState(conn,checkingSql,Statement.RETURN_GENERATED_KEYS);
		PreState2.setInt(1,checkingNum);
		PreState2.setString(2,checking);
		PreState2.setInt(3,userid);
		PreState2.executeUpdate();
		PreparedStatement PreState3 = DBM.getPreState(conn,savingSql,Statement.RETURN_GENERATED_KEYS);
		PreState3.setInt(1,savingNum);
		PreState3.setString(2,saving);
		PreState3.setInt(3,userid);
		PreState3.executeUpdate();
		
		conn.commit();
		conn.setAutoCommit(true);
		
		
		//DBM.close(PreState);
		//DBM.close(PreState2);
		//DBM.close(conn);
		response.sendRedirect("AdminUser.jsp");
}
		
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

<script language="javascript">
        function sendTransactionID(id){
        	document.getElementById("setTransactionID").setAttribute("value",id);
        }
                        
</script>
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
                    <h3>Users</h3>
                    <div class="span10 pull-right">
                        <input type="text" class="span5 search" placeholder="Type a user's name..." />
                        
                        <!-- custom popup filter -->
                        <!-- styles are located in css/elements.css -->
                        <!-- script that enables this dropdown is located in js/theme.js -->
                        <div class="ui-dropdown">
                            <div class="head" data-toggle="tooltip" title="Click me!">
                                Advanced Search
                                <i class="arrow-down"></i>
                            </div>  
                            <div class="dialog">
                                <div class="pointer">
                                    <div class="arrow"></div>
                                    <div class="arrow_border"></div>
                                </div>
                                <div class="body">
                                    <p class="title">
                                        Show users where:
                                    </p>
                                    <div class="form">
                                        <input type="text" placeholder=" phone number..."/>
                                        <input type="text" placeholder=" email..."/>
                                        <input type="text" placeholder=" name..."/>
                                        <a class="btn-flat small">Search</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a data-toggle="modal"href="#addUser"role="button"class="btn-flat success pull-right">
                            <span>&#43;</span>
                            NEW USER
                        </a>
                        <div id="addUser" class="modal hide fade" role="dialog">
                        <div class="modal-dialog">
                        <div class="modal-content">
                        <form action = "AdminUser.jsp" method = "post">
						<input type = "hidden" name = "action" value = "post" />
                        <div class="modal-header" style="padding:20px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Add User</h4>
                        </div>
                        <div class="modal-body">
                        
                        <div class=" field-box">
                        <label>User Name:</label>
                        <input class="span9" type="text" name = "username"/>
                        </div>
                        <div class=" field-box">
                        <label>Email:</label>
                        <input class="span9" type="text" name = "email"/>
                        </div>
                        <div class=" field-box">
                        <label>Phone:</label>
                        <input class="span9" type="text" name = "phone"/>
                        </div>
                        <div class=" field-box">
                        <label>Address:</label>
                        <input class="span9" type="text" name = "address"/>
                        </div>
                        <div class=" field-box">
                        <label>SSN:</label>
                        <input class="span9" type="text" name = "ssn"/>
                        </div>
                        <div class=" field-box">
                        <label>Birthday:</label>
                        <div class="address-fields">
                        <input class="span9" type="text" placeholder="birthday" name = "birthday" />
						<div class=" field-box">
                        <label>Saving Account Number:</label>
                        <input class="span9" type="text" name = "savingNum" id = "show1"/>
                        </div>
						<div class=" field-box">
                        <label>Checking Account Number:</label>
                        <input class="span9" type="text" name = "checkingNum" id = "show2"/>
                        </div>
                        
                        </div>
                        </div>
                        </div>
                        <div class="modal-footer">
                        <input type="submit" value = "submit"class="btn btn-primary add-record-submit"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button>
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
                                <th class="span3 sortable">
                                   Name
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Phone
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Email
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
                                <a href="AdminSingleAccount.jsp?id=<%=rs.getInt(1)%>" class="name"><%=rs.getString(2)%></a>
                            </td>
                            <td>
                                <%=rs.getInt(4) %>
                            </td>
                            <td>
								<%=rs.getString(3) %>
                            </td>
                            <td class="align-right">
                                <ul class="actions">
                                    <li onclick = "sendTransactionID(this.id);"id="<%=rs.getInt(1) %>"><a  data-toggle="modal"href="#editUser"role="button"><i class="table-edit"></i></a></li>
                                    <li class="last"><a  href="deleteUser.jsp?id=<%=rs.getInt(1)%>"role="button"><i class="table-delete"></i></a></li>
                                </ul>
                            </td>
							</tr>
							<%
   								}
							%>
							
                            <div id="editUser" class="modal hide fade" role="dialog">
                            <div class="modal-dialog">
                            <div class="modal-content">
                            <form action = "updateUser.jsp" method = "post">
                            <input type = "text" id = "setTransactionID" name = "getTransactionID">
                            <input type = "hidden" name = "actionEdit" value = "post2" />
                            <div class="modal-header" style="padding:20px;">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Update User</h4>
                            </div>
                            <div class="modal-body">
                            <div class=" field-box">
                            <label>User Name:</label>
                            <input class="span9" type="text" name = "editusername"/>
                            </div>
                            <div class=" field-box">
                            <label>Email:</label>
                            <input class="span9" type="text" name = "editemail"/>
                            </div>
                            <div class=" field-box">
                            <label>Phone:</label>
                            <input class="span9" type="text" name = "editphone"/>
                            </div>
                            <div class=" field-box">
                            <label>Address:</label>
                            <input class="span9" type="text" name = "editaddress" />
                            </div>
                            <div class=" field-box">
                            <label>SSN:</label>
                            <input class="span9" type="text" name = "editssn" />
                            </div>
                            <div class=" field-box">
                            <label>Birthday:</label>
                            <div class="address-fields">
                            <input class="span9" type="text" placeholder="xxxx-xx-xx" name = "editbirthday" />
                            
                            </div>
                            </div>
                            </div>
                            <div class="modal-footer">
                           	<input type="submit" value = "submit"class="btn btn-primary add-record-submit"/>
                       		<button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button>
                            </div>
                            </form>
                            
                            </div>
                            </div>
                            </div>
                

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
<script language="javascript"> 
init(); 
</script>
<%
DBM.close(conn);
DBM.close(state);
DBM.close(rs);
%>
</html>