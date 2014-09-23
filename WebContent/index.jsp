<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.IOException,com.bank.*,java.sql.*" %>
<%@ page import="javax.xml.transform.Result" %>
<% 	Connection con = DBM.getConn();
    String sql = "SELECT * FROM transactions where receiver in (select accountnumber from account where userid= ?)or sender in (select accountnumber from account where userid= ?)";
    PreparedStatement ps = DBM.getPreState(con,sql);
    //String strId = session.getAttribute("userid").toString();
    //int id = Integer.parseInt(strId);
    int id =11;
    ps.setInt(1,id);
    ps.setInt(2,id);
    ResultSet rs = ps.executeQuery();
    String sql1 = "select sum(amount) from transactions where MONTH(date)=? And sender in (select accountnumber from account where userid= ?)";
    String sql2 = "select sum(amount) from transactions where MONTH(date)=? And receiver in (select accountnumber from account where userid= ?)";
    PreparedStatement[] psAmountSend = new PreparedStatement[12];
    PreparedStatement[] psAmountrecieve = new PreparedStatement[12];
    ResultSet rsAmountSend[] = new ResultSet[12];
    ResultSet rsAmountRecieve[] = new ResultSet[12]; 
    Double amount[] = new Double[12]; 
    for (int i=0;i<12;i++){ 	
    psAmountSend[i] = DBM.getPreState(con,sql1);
    psAmountSend[i].setInt(1,i+1);
    psAmountSend[i].setInt(2,id);
    rsAmountSend[i] = psAmountSend[i].executeQuery();
    rsAmountSend[i].next();
    psAmountrecieve[i] = DBM.getPreState(con,sql2);
    psAmountrecieve[i].setInt(1,i+1);
    psAmountrecieve[i].setInt(2,id);
    rsAmountRecieve[i] = psAmountrecieve[i].executeQuery();
    rsAmountRecieve[i].next();
    amount[i]= rsAmountSend[i].getDouble(1)-rsAmountRecieve[i].getDouble(1);
    System.out.println(amount[i]);
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Detail Admin - Chart Showcase</title>
    
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
    <link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    <link href="css/lib/morris.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/index.css" type="text/css" media="screen" /> 
    <link rel="stylesheet" href="css/compiled/chart-showcase.css" type="text/css" media="screen" />

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
                    <a href="4profile.html" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                        Your account
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Personal info</a></li>
                        <li><a href="#">Account settings</a></li>
                        <li><a href="#">Billing</a></li>
                        <li><a href="#">Export your data</a></li>
                        <li><a href="#">Send feedback</a></li>
                    </ul>
                </li>
                <li class="settings hidden-phone">
                    <a href="4profile.html" role="button">
                        <i class="icon-cog"></i>
                    </a>
                </li>
                <li class="settings hidden-phone">
                    <a href="5signin.html" role="button">
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
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="2index.html">
                    <i class="icon-home"></i>
                    <span>Home</span>
                </a>
            </li>            
            <li>
                <!-- transfer page -->
                <a href="3transfer.html">
                    <i class="icon-signal"></i>
                    <span>Transfer</span>
                </a>
            </li>
            <li>
            <li>
               <!--  Transaction records -->
                <a class="dropdown-toggle" href="#">
                    <i class="icon-edit"></i>
                    <span>Transaction</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="1transaction.html">Transaction</a></li>
                    <li><a href="#">Form wizard</a></li>
                </ul>
            </li>

            <li>
                <!-- person info -->
                <a href="4profile.html">
                    <i class="icon-cog"></i>
                    <span>My Info</span>
                </a>
            </li>
            <li>
                <a  href="5signin.html">
                    <i class="icon-share-alt"></i>
                    <span>Log out</span>
                </a>
              
            </li>
        </ul>
    </div>
    <!-- end sidebar -->


	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper">

                <!-- morris bar & donut charts -->
                <div class="row-fluid section">
                    <h4 class="title">
                        Morris.js
                    </h4>
                    <div class="span6 chart">
                        <h5>Devices sold</h5>
                        <div id="hero-bar" style="height: 250px;"></div>
                    </div>
                    <div class="span5 chart">
                        <h5>Month traffic</h5>
                        <div id="hero-donut" style="height: 250px;"></div>    
                    </div>
                </div>
                
                <div class="table-products">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h4>Transaction <small>Records</small></h4>
                        </div>
                    </div>

                    <div class="row-fluid filter-block">
                        <div class="pull-right">
                            <div class="ui-select">
                                <select>
                                  <option />Account
                                  <option />Signed last 30 days
                                  <option />Active users
                                </select>
                            </div>
                            <input type="text" class="search" />
                            <!-- Admin only -->
                        
                            
               				 <a class="btn-flat new-product" href="userTransactionTable.jsp?exportToExcel=YES">+ export</a>
                     
                        </div>
                    </div>
                    <div class="row-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <th class="span2">
                Date
            </th>
            <th class="span2">
                From
            </th>
            <th class="span2">
                to
            </th>
            <th class="span2">
                <span class="line"></span>Type
            </th>
            <th class="span2">
                <span class="line"></span>Amount
            </th>
            <th class="span2">
                <span class="line"></span>status
            </th>
            <th class="span2">
                <span class="line"></span>Description
            </th>
        </tr>
        </thead>
        <tbody>
        <!-- row -->


        <% 
            while (rs.next()){

        %>
        <tr class="first" id="row<%=rs.getInt(1)%>">
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
</div>
					
                    <div class="pagination">
                      <ul>
                        <li><a href="#">&#8249;</a></li>
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">&#8250;</a></li>
                      </ul>
                    </div>
                </div>

                <!-- jQuery knobs -->


            </div>
        </div>
    </div>
    <!-- end main container -->

	<!-- scripts for this page -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui-1.custom.min.js"></script>
    <!-- morrisjs -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="js/morris.min.js"></script>
    <!-- call all plugins -->
    <script src="js/theme.js"></script>

    <!-- build the charts -->
    <script type="text/javascript">
        // Morris Bar Chart
        Morris.Bar({
            element: 'hero-bar',
            data: [
                {Month: '1', amount:<%=amount[0]%>},
                {Month: '2', amount: <%=amount[1]%>},
                {Month: '3', amount: <%=amount[2]%>},
                {Month: '4', amount: <%=amount[3]%>},
                {Month: '5', amount: <%=amount[4]%>},
                {Month: '6', amount:<%=amount[5]%>},
                {Month: '7', amount:<%=amount[6]%>},
                {Month: '8', amount: <%=amount[7]%>},
                {Month: '9', amount:<%=amount[8]%>},
                {Month: '10', amount: <%=amount[9]%>},
                {Month: '11', amount: <%=amount[10]%>},
                {Month: '12', amount: <%=amount[11]%>}
            ],
            xkey: 'Month',
            ykeys: ['amount'],
            labels: ['amount'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#3d88ba"]
        });


        // Morris Donut Chart
        Morris.Donut({
            element: 'hero-donut',
            data: [
                {label: 'Direct', value: 25 },
                {label: 'Referrals', value: 40 },
                {label: 'Search engines', value: 25 },
                {label: 'Unique visitors', value: 10 }
            ],
            colors: ["#30a1ec", "#76bdee", "#c4dafe"],
            formatter: function (y) { return y + "%" }
        });
</script>
<%
DBM.close(ps);
DBM.close(rs);
DBM.close(con);
%>
</body>
</html>