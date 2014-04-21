<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Ask an Expert</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link href="assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>

        <!-- BEGIN HEADER -->   
        <div class="header navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="navbar-inner">
                <div class="container-fluid">
                    <!-- BEGIN LOGO -->
                    <a class="brand" href="Login">
                        <img src="assets/img/logo.png" alt="logo" />
                    </a>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                        <img src="assets/img/menu-toggler.png" alt="" />
                    </a>          
                    <!-- END RESPONSIVE MENU TOGGLER -->            
                    <!-- BEGIN TOP NAVIGATION MENU -->              
                    <ul class="nav pull-right">
                        <!-- BEGIN NOTIFICATION DROPDOWN -->   
                        <li class="dropdown" id="header_notification_bar">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="icon-warning-sign"></i>
                                <span class="badge"></span>
                            </a>
                            <ul class="dropdown-menu extended notification">
                            </ul>
                        </li>
                        <!-- END NOTIFICATION DROPDOWN -->
                        <!-- BEGIN INBOX DROPDOWN -->
                        <li class="dropdown" id="header_inbox_bar">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="icon-envelope"></i>
                                <span class="badge"></span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                            </ul>
                        </li>
                        <!-- END INBOX DROPDOWN -->
                        <!-- BEGIN TODO DROPDOWN -->
                        <li class="dropdown" id="header_task_bar">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="icon-tasks"></i>
                                <span class="badge"></span>
                            </a>
                            <ul class="dropdown-menu extended tasks">
                            </ul>
                        </li>
                        <!-- END TODO DROPDOWN -->               
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <li class="dropdown user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <img class="headerPhoto" src="assets/img/ChihYong.jpg" />
                                <span class="username">Wong Chih Yong</span>
                                <i class="icon-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="extra_profile.html"><i class="icon-user"></i> My Profile</a></li>
                                <li><a href="page_calendar.html"><i class="icon-calendar"></i> My Calendar</a></li>
                                <li><a href="inbox.html"><i class="icon-envelope"></i> My Messages <span class="badge badge-important">3</span></a></li>
                                <li><a href="#"><i class="icon-tasks"></i> My Tasks <span class="badge badge-success">8</span></a></li>
                                <li class="divider"></li>
                                <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> Full Screen</a></li>
                                <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                    </ul>
                    <!-- END TOP NAVIGATION MENU --> 
                </div>
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->

        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <%-- Import for the side bar --%>
            <%@include file="/WEB-INF/jspf/sideBar2.jspf" %> 
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN PAGE HEADER-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title">
                                Ask an Expert Forums
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="Login">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Modules?action=moduleDashboard&moduleId=<%=session.getAttribute("moduleId")%>">IS1112</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Ask an Expert</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12 blog-page">
                            <div class="row-fluid">
                                <div class="span9 article-block">
                                    <h1>A Question on SQL Joins</h1>

                                    <!--end news-tag-data-->
                                    <div>
                                        <p>
                                            Hi<br><br>
                                            I am quite new to databases and I got stuck in the 1 Star quest. <br>
                                            I was wondering if anyone has done it yet? Could you help me out? <br><br>
                                            I am currently having problems with writing the JOIN statement. <br>
                                            Can somebody provide an example of how to use the JOIN statement? <br><br>
                                            I am offering a bounty of 50 gold for the best answer. <br>
                                            Thanks.<br>
                                        </p>

                                    </div>
                                    <br>
                                    <div class="blog-tag-data">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <ul class="unstyled inline blog-tags">
                                                    <li>
                                                        <i class="icon-tags"></i> 
                                                        <a href="#">IS1112</a> 
                                                        <a href="#">Databases</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="span6 blog-tag-data-inner">
                                                <ul class="unstyled inline">
                                                    <li><i class="icon-calendar"></i> <a href="#">April 22, 2014</a></li>
                                                    <li><i class="icon-usd"></i> <a href="#">Bounty: 50 Gold</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="media">
                                        <h3>Answers</h3>
                                        <a href="#" class="pull-left">
                                            <img alt="" src="assets/img/PhilAvatar.png" class="media-object">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading">PHILSON NAH (Beginner)<span> <a data-toggle="modal" href="#responsive">Mark as Accepted</a></span></h4>
                                            <p><br>
                                                Before I give you an example, here is a list of the types the different SQL JOINs you can use:<br>
                                                <br>
                                                INNER JOIN: Returns all rows when there is at least one match in BOTH tables<br>
                                                LEFT JOIN: Return all rows from the left table, and the matched rows from the right table<br>
                                                RIGHT JOIN: Return all rows from the right table, and the matched rows from the left table<br>
                                                FULL JOIN: Return all rows when there is a match in ONE of the tables<br>
                                                <br>
                                                <br>
                                                Here is an example that contains an INNER JOIN:<br>
                                                <br>
                                                SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate<br>
                                                FROM Orders<br>
                                                INNER JOIN Customers<br>
                                                ON Orders.CustomerID=Customers.CustomerID;<br>
                                            </p>
                                        </div>
                                    </div>
                                    <!--end media-->
                                    <hr>
                                </div>
                                <!--end span9-->
                                <div class="span3 blog-sidebar">
                                    <h2>Asker Profile</h2>
                                    <img style="width:140px" src="assets/img/cyAvatar.png">
                                    <br><br>
                                    <p><b>Name: </b>Wong Chih Yong</p>
                                    <p><b>Job Class: </b>E-Commerce Warrior</p>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                </div>
                                <!--end span3-->
                            </div>
                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->  


                    <!-- MODAL WINDOW -->
                    <form action="Quests?action=markAccepted" method="post">
                        <div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h3>Accept Answer</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <h4>Mark Answer as Accepted?</h4>
                                        <p>
                                            Once answer is accepted, the bounty will be paid out.<br>
                                            Are you sure you wish to mark answer as accepted?
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Cancel</button>
                                <button type="submit" class="btn red">Confirm</button>
                            </div>

                        </div>
                    </form>


                </div>
                <!-- END PAGE CONTAINER-->    
            </div>
            <!-- END PAGE -->
        </div>
        <!-- END CONTAINER -->

        <%-- Import for the footer bar --%>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>   

        <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
        <%-- Standard JS imports for every page--%>
        <%@include file="/WEB-INF/jspf/javascripts.jspf" %>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                //$('#footable').footable();
                TableManaged.init();
                setActivePage("link-forums");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>