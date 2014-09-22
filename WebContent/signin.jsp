<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="login-bg">
<head>
	<title>Detail Admin - Sign in</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <div class="row-fluid login-wrapper">
        
        <img class="logo" src="img/logo-white.png" />
        <div class="span4 box">
            <div class="content-wrap">
                <h6> Please Log in</h6>
                <input id="un" class="span12" type="text" placeholder="User Name" />
                <input id="pw"class="span12" type="password" placeholder="Your password" />
                <span id="wmsg"></span>
                <a href="#" id= class="forgot">Forgot password?</a>
                <div class="remember">
                    <input id="remember-me" type="checkbox" />
                    <label for="remember-me">Remember me</label>
                </div>
                <a id="login" class="btn-glow primary login" >Log in</a>
            </div>
        </div>

        <div class="span4 no-account">
            <p>Don't have an account?</p>
            <a href="signup.html">Sign up</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>
	<script>
		
		$(function(){
			$('#login').click(function(){
                $.ajax({
                    type: "POST",
                    url: "checkSignIn.jsp",
                    data: {
                        username:$('#un').val(),
                        password: $('#pw').val()
                    },
                    success:function(msg){
                    	
                        if($.trim(msg)!='error'){
                        	if($.trim(msg)=='admin')
                        	document.location= 'AdminUser.jsp';
                        		//$("#wmsg").html("Admin");
                        	else
                        	document.location='copyOfUserProfile.jsp?user='+msg;
                        		//$("#wmsg").html(msg);
                        }
                        else{
                        	$("#wmsg").html("wrong password or username");
                        }
                    }
                });
            });
			
		});
	</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>