<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Instructor</title>
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
                                <img class="headerPhoto" src="assets/img/myAvatar.jpg" />
                                <span class="username">Philson ADMIN</span>
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
            <%@include file="/WEB-INF/jspf/sideBar.jspf" %> 
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN PAGE HEADER-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title">
                                Quests Grading
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="Login">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">IS1112</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Quests</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Grading</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12 no-more-tables">
                            <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                <thead class="cf">
                                    <tr>
                                        <th>File</th>
                                        <th>Name</th>
                                        <th>Matric</th>
                                        <th>Topic</th>
                                        <th>Difficulty</th>
                                        <th>Date Submitted</th>
                                        <th>Status</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeX">
                                        <td data-title="File"><center><a href="assets/files/A0067379M.zip"><i class="icon-save"></i> A0067379M.zip</a></center></td>
                                <td data-title="Name">Philson Nah</td>
                                <td data-title="Matric">A0067379M</td>
                                <td data-title="Topics">Databases</td>
                                <td data-title="Difficulty">1 Star</td>
                                <td data-title="Date Posted">22-04-2014</td>
                                <td data-title="Status">Graded</td>
                                <td data-title="Actions"></td>
                                </tr>
                                <tr class="gradeX">
                                    <td data-title="File"><center><a href="#"><i class="icon-save"></i> A0075128E.zip</a></center></td>
                                <td data-title="Name">Wong Chih Yong</td>
                                <td data-title="Matric">A0075128E</td>
                                <td data-title="Topics">PHP</td>
                                <td data-title="Difficulty">1 Star</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Pending</td>
                                <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-ok"></i> Grade</a></center></td>
                                </tr>
                                <tr class="gradeX">
                                    <td data-title="File"><center><a href="#"><i class="icon-save"></i> A0075128E.zip</a></center></td>
                                <td data-title="Name">Wong Chih Yong</td>
                                <td data-title="Matric">A0075128E</td>
                                <td data-title="Topics">HTML</td>
                                <td data-title="Difficulty">1 Star</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Pending</td>
                                <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-ok"></i> Grade</a></center></td>
                                </tr>

                                <tr class="gradeX">
                                    <td data-title="File"><center><a href="#"><i class="icon-save"></i> A0075030W.zip</a></center></td>
                                <td data-title="Name">Ang Xin Xiang</td>
                                <td data-title="Matric">A0075030W</td>
                                <td data-title="Topics">Marketing</td>
                                <td data-title="Difficulty">1 Star</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Graded</td>
                                <td data-title="Actions"></td>
                                </tr>  
                                <tr class="gradeX">
                                    <td data-title="File"><center><a href="#"><i class="icon-save"></i> A0075030W.zip</a></center></td>
                                <td data-title="Name">Ang Xin Xiang</td>
                                <td data-title="Matric">A0075030W</td>
                                <td data-title="Topics">Security</td>
                                <td data-title="Difficulty">1 Star</td>
                                <td data-title="Date Posted">21-04-2014</td>
                                <td data-title="Status">Graded</td>
                                <td data-title="Actions"></td>
                                </tr>
                                </tbody>
                            </table>



                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->  


                    <!-- MODAL WINDOW -->
                    <form action="Quests?action=markAccepted" method="post">
                        <div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h3>Grade Submission</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <p>
                                            <label>Marks (5%):
                                                <input type="number" class="span12 m-wrap">
                                            </label>
                                        </p>
                                        <p>
                                            <label>Comments:<br>
                                                <textarea rows="4" cols="100" class="span12"></textarea>
                                            </label>
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
                setActivePage("link-quests");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>