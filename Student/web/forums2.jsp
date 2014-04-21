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
                        <div class="span12 no-more-tables">
                            <p>
                                Welcome to the "Ask an Expert" forums!<br>
                                Got a burning question you need answered? Offer a big bounty and get the best answers! <br>
                                Already an expert? Help out your peers and start raking up those bounties!
                            </p>
                            <br>
                            <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                <thead class="cf">
                                    <tr>
                                        <th>Asker</th>
                                        <th>Title</th>
                                        <th>Topics</th>
                                        <th>Bounty</th>
                                        <th>Date Posted</th>
                                        <th>Status</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeX">
                                        <td data-title="Asker"><center><img src="assets/img/cyAvatar.png" style="width:40px"><br>Chih Yong</center></td>
                                <td data-title="Title">A Question on SQL Joins</td>
                                <td data-title="Topics">Databases</td>
                                <td data-title="Bounty">50 gold</td>
                                <td data-title="Date Posted">22-04-2014</td>
                                <td data-title="Status">Open</td>
                                <td data-title="Actions"><center><a href="viewPost2.jsp" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                </tr>
                                <tr class="gradeX">
                                    <td data-title="Asker"><center><img src="assets/img/PhilAvatar.png" style="width:40px"><br>Philson</center></td>
                                <td data-title="Title">Need help with PHP Statements</td>
                                <td data-title="Topics">PHP</td>
                                <td data-title="Bounty">10 gold</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Answered</td>
                                <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                </tr>
                                <tr class="gradeX">
                                    <td data-title="Asker"><center><img src="assets/img/PhilAvatar.png" style="width:40px"><br>Philson</center></td>
                                <td data-title="Title">A Question about HTML5</td>
                                <td data-title="Topics">HTML</td>
                                <td data-title="Bounty">10 gold</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Answered</td>
                                <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                </tr>
                                </tbody>
                            </table>



                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->  




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