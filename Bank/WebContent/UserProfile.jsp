<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.bank.*, java.util.*, java.text.DateFormat,java.text.SimpleDateFormat"%>
<%
Connection con = DBM.getConn();
Statement state = DBM.getState(con);
//String strId = request.getParameter("userid");
//int id = Integer.parseInt(strId);
String strSessionId = session.getAttribute("userid").toString();
int sessionId = Integer.parseInt(strSessionId);
//String strSignInId = request.getParameter("user");
//int signInId = Integer.parseInt(strSignInId);
String sql = "select * from user where userid = " + sessionId;
//String signInSql = "select * from user where userid = " + signInId;
ResultSet rs = DBM.executeQuery(state,sql);

String action = request.getParameter("action");

if(action != null && action.trim().equals("post") ){
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String strPhone = request.getParameter("phone");
	int phone = Integer.parseInt(strPhone);
	String address = request.getParameter("address");
	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	String strBirthday = request.getParameter("birthday");
	java.util.Date utilBirthday = fmt.parse(strBirthday);
	java.sql.Date birthday = new java.sql.Date(utilBirthday.getTime());
	String againPassword = request.getParameter("againpassword");
	String password = request.getParameter("newpassword");
	boolean autoCommit = con.getAutoCommit();
	con.setAutoCommit(false);
	String updateSql = "update user set username = ? , email = ?, phone = ?, address = ?, birthday = ?, password = ? where userid = " + sessionId;
	PreparedStatement PreState = DBM.getPreState(con,updateSql,Statement.RETURN_GENERATED_KEYS);
	PreState.setString(1,username);
	PreState.setString(2,email);
	PreState.setInt(3,phone);
	PreState.setString(4,address);
	PreState.setDate(5,birthday);
	PreState.setString(6,password);
	PreState.executeUpdate();

	con.commit();
	con.setAutoCommit(true);
	

}
	
%>

<!DOCTYPE html>
<html>
<head>
	<title>Detail User - Home</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- libraries -->
    <link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/personal-info.css" type="text/css" media="screen" />   
     <link href="css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet" />
    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!-- lato font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
	
	
	<script type = "text/javascript">
	function judgepassword(){
	var d=document.getElementsByName("password").value;
	var c=document.getElementsByName("againpassword").value;
	if(d != c){
		alert("password doesn't match! try again!");
		document.getElementsByName("againpassword").value="";
		return false;
	}
		return true;
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
            
            <a class="brand" href="index.html"><img src="img/logo.png" /></a>

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
            <li>
                
                <a href="index.html">
                    <i class="icon-home"></i>
                    <span>Home</span>
                </a>
            </li>            
            <li>
                <!-- transfer page -->
                <a href="transfer.jsp">
                    <i class="icon-signal"></i>
                    <span>Transfer</span>
                </a>
            </li>
             <li>
                <!-- transaction page -->
                <a href="userAccountFromSignIn.jsp">
                    <i class="icon-signal"></i>
                    <span>Transaction</span>
                </a>
            </li>
            <li class="active">
                <!-- person info -->
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="#">
                    <i class="icon-cog"></i>
                    <span>My Info</span>
                </a>
            </li>
             <li>
                <!-- logout page -->
                <a href="signin.jsp">
                    <i class="icon-signal"></i>
                    <span>Log out</span>
                </a>
            </li>
            
           
        </ul>
    </div>
    <!-- end sidebar -->


	<!-- main container -->
    <div class="content">
    
    <div class="container-fluid">
    <!-- end upper main stats -->
    
    <div id="pad-wrapper">
    <div class="settings-wrapper" id="pad-wrapper">

    
    <!-- edit form column -->
    <div class="span9 personal-info">
    <div class="span9 alert alert-info">
    <i class="icon-lightbulb"></i>
    Change yout Information
    </div>
    <h5 class="personal-title">Personal info</h5>
    
    <form name = "users" action = "UserProfile.jsp" method = "post" >
    <input type = "hidden" name = "action" value = "post" />
    <%
    while(rs.next()){
    %>
    <div class="field-box">
    <label>User name:</label>
    <input class="span5 inline-input" type="text" value="<%=rs.getString(2) %>" name = "username"/>
    </div>
    <div class="field-box">
    <label>Birthday:</label>
     <input type="text" value="<%=rs.getDate(7)%>" class="input-large datepicker" name = "birthday"/>
    </div>
    <div class="field-box">
    <label>Email:</label>
    <input class="span5 inline-input" type="text" value="<%=rs.getString(3) %>" name = "email"/>
    </div>
    <div class="field-box">
    <label>Phone/mobile numbers :</label>
    <input class="span5 inline-input" type="text" value="<%=rs.getString(4) %>" name = "phone"/>
    </div>
    <div class="field-box">
    <label>Address :</label>
    <input class="span5 inline-input" type="text" value="<%=rs.getString(5) %>" name = "address"/>
    </div>
    <div class="field-box">
    <label>Old Password:</label>
    <input class="span5 inline-input" type="password" value="<%=rs.getString(8) %>"/>
    </div>
    <div class="field-box">
    <label>New Password:</label>
    <input class="span5 inline-input" type="password"  name = "newpassword"/>
    </div>
    <div class="field-box">
    <label>Confirm New password:</label>
    <input class="span5 inline-input" type="password" name = "againpassword"/>
    </div>
    <div class="span6 field-box actions">
     <input type="submit" class="btn-glow primary" value="Save Changes" />
    <span>OR</span>
    <input type="reset" value="Cancel" class="reset" />
    </div>
    <%
    }
    %>
   </form>

    </div>
    </div>
    
    </div>
    </div>
    </div>


	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/bootstrap.datepicker.js"></script>
    <script type="text/javascript">
        $(function () {

            // datepicker plugin
            $('.datepicker').datepicker().on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });

        });
    </script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
<%
DBM.close(con);
DBM.close(state);
DBM.close(rs);
%>
</html>