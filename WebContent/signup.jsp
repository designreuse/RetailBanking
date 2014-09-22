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
    <link href="css/lib/bootstrap-wysihtml5.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/uniform.default.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/select2.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signups.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/compiled/form-wizard.css" type="text/css" media="screen" />
    <link href="css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet" />
    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <div class="row-fluid login-wrapper">
        
            <img class="logo" src="img/logo-white.png" />

    <div class="box span10">
    <div class=" content-wrap">
                    
                        <div class="wizard row-fluid" id="fuelux-wizard">
                            <ul class="wizard-steps">
                                <li class="active" data-target="#step1">
                                    <span class="step">1</span>
                                    <span class="title">General <br> information</span>
                                </li>
                                <li data-target="#step2">
                                    <span class="step">2</span>
                                    <span class="title">Address <br> information</span>
                                </li>
                                <li data-target="#step3">
                                    <span class="step">3</span>
                                    <span class="title">Contact<br> Information</span>
                                </li>
                                <li data-target="#step4">
                                    <span class="step">4</span>
                                    <span class="title">SSN <br> info</span>
                                </li>
                            </ul>                            
                        </div>
                        <form id="signup" action="checkSignup.jsp" method="POST">
                        <div class="step-content">
                            <div id="step1" class="step-pane active">
                                <div class="row-fluid form-wrapper">
                                    <div class="span8">
                                        
                                            <div class="field-box">
                                                <label >Name:</label>
                                                <input id="name" name="name"type="text" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="pw">password:</label>
                                                <input id="pw" name="pw"type="password" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="cpw">confirm password:</label>
                                                <input id="cpw" name="cpw"type="password" class="span8">
                                            </div>
                                            

                                            <div class="field-box">
                                                <label for="dob">Date of Birth:</label>
                                                <input id="dob" name="dob"type="text" class="span8 datepicker">
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div id="step2" class="step-pane">
                                <div class="row-fluid form-wrapper">
                                    <div class="span8">
                                        
                                            <div class="field-box">
                                                <label for="add">Address:</label>
                                                <input id="add" name="add"type="text" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="city">City:</label>
                                                <input id="city" name="id" type="text" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="zip">Postal/ZIP code:</label>
                                                <input id="zip" name="zip"type="text" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="country">Country:</label>
                                                <input id="country" name="country"type="text" class="span8">
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div id="step3" class="step-pane">
                                <div class="row-fluid form-wrapper">
                                    <div class="span8">
                                       
                                            <div class="field-box">
                                                <label for="email">Email Address:</label>
                                                <input id="email" name="email"type="text" class="span8">
                                            </div>
                                            <div class="field-box">
                                                <label for="phone">Phone/Mobile Number:</label>
                                                <input id="phone"name="phone" type="text" class="span8">
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div id="step4" class="step-pane">
                                <div class="row-fluid form-wrapper payment-info">
                                    <div class="span8">
                                        
                                            <div class="field-box">
                                                <label for="ssn">SSN Number:</label>
                                                <input id="ssn" name="ssn" type="text" class="span5">
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-actions">
                            <button class="btn-glow primary btn-prev" disabled="" type="button"> 
                                <i class="icon-chevron-left"></i> Prev
                            </button>
                            <button data-last="Finish" class="btn-glow primary btn-next" type="button">
                                Next <i class="icon-chevron-right"></i>
                            </button>
                            <button class="btn-glow success btn-finish" type="submit">
                                Setup your account!
                            </button>
                        </div>
                        </form>
                </div>
    </div>
        
        <div class="span4 no-account">
            <p>Already have an account?</p>
            <a href="5signin.html">Sign in</a>
        </div>
    </div>

    
	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.9.0.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/fuelux.wizard.js"></script>
    <script src="js/bootstrap.datepicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#signup").validate({
                rules: {
                    name: {
                        required:true,  
                        digits: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    pw: {
                        required:true,  
                        digits: true,
                        minlength: 6
                       
                    },
                    cpw: {
                        required:true,   
                        digits: true,
                        minlength: 6,
                        equalTo:"#pw"
                    },
                    dob: {  
                        date:true
                    },
                    add: {
                        required:true,   
                        digits: true
                    },
                    city: { 
                        required:true,  
                        digits: true
                    }, 
                    zip: { 
                        required:true,  
                        digits: true,
                        rangelength:[5,5]
                    },
                    country: {
                        required:true,   
                        digits: true
                    },
                    email: {
                        required:true,   
                        email:true
                    }, 
                    phone: {
                        required:true,   
                        number:true
                    },
                    ssn: {
                        required:true,   
                        number:true
                    }  
                },
                messages:{
                    zip:{
                        rangelength:"your zip code should be 5 digits"
                    }
                }
            });
            var $wizard = $('#fuelux-wizard'),
                $btnPrev = $('.wizard-actions .btn-prev'),
                $btnNext = $('.wizard-actions .btn-next'),
                $btnFinish = $(".wizard-actions .btn-finish");
            // datepicker plugin
            $('.datepicker').datepicker().on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });

            $wizard.wizard().on('finished', function(e) {
                // wizard complete code
            }).on("changed", function(e) {
                var step = $wizard.wizard("selectedItem");
                // reset states
                $btnNext.removeAttr("disabled");
                $btnPrev.removeAttr("disabled");
                $btnNext.show();
                $btnFinish.hide();

                if (step.step === 1) {
                    $btnPrev.attr("disabled", "disabled");
                } else if (step.step === 4) {
                    $btnNext.hide();
                    $btnFinish.show();
                }
            });

            $btnPrev.on('click', function() {
                $wizard.wizard('previous');
            });
            $btnNext.on('click', function() {
                $wizard.wizard('next');
            });
        });
    </script>

<!-- <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div> -->
</body>
</html>