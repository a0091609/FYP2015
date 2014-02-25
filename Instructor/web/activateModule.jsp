<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Module Activation</title>
        <%-- Standard imports for every page--%>
        <%@include file="WEB-INF/jspf/stylesheets.jspf" %>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>
        <%@include file="WEB-INF/jspf/headerBar.jspf" %> 
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <%-- Import for the side bar --%>
            <%@include file="WEB-INF/jspf/sideBar.jspf" %> 
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN PAGE HEADER-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title">
                                Create New Course
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="index.jsp">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="dashboard.jsp">Dashboard</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li><a href="#">Create Course</a></li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <form action="#" class="form-horizontal">
                                <!-- ALL THE FORM CONTENTS GO HERE! -->


                                <!-- COURSE INFORMATION -->
                                <div class="portlet box blue">
                                    <div class="portlet-title">
                                        <div class="caption"><i class="icon-reorder"></i>Course Information</div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"></a>
                                        </div>
                                    </div>
                                    <div class="portlet-body form">
                                        <br>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Module Code:</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" type="text" disabled />
                                                </div>
                                                <br>
                                            </div>

                                            <div class="span6">
                                                <label class="control-label">Module ID:</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" type="text" disabled />
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Module Name:</label>
                                            <div class="controls">
                                                <input class="span12 m-wrap" type="text" disabled />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Description:</label>
                                            <div class="controls">
                                                <textarea class="span12 m-wrap" style="resize: none" disabled rows="5"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- PEDAGOGY -->
                                <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption"><i class="icon-reorder"></i>Teaching Pedagogy</div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"></a>
                                        </div>
                                    </div>
                                    <div class="portlet-body form">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Pedagogy:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Adaptive Teaching
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        teaching pedagogy is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Learner Centered Pedagogy
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        teaching pedagogy is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Features -->
                                <div class="portlet box purple">
                                    <div class="portlet-title">
                                        <div class="caption"><i class="icon-reorder"></i>Gamification Components</div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"></a>
                                        </div>
                                    </div>
                                    <div class="portlet-body form">


                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Points:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Experience Points (EXP)
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Virtual Currency (Coins)
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Ranking:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Global Leaderboard
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Social Leaderboard
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Items:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Automatic Rewards
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Marketplace
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Tasks:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Quiz
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Quests
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <label class="control-label">Profiles:</label>
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Buddy Lists
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                            <div class="span6">
                                                <div class="controls">
                                                    <label class="radio">
                                                        <input type="checkbox" name="" value="" />
                                                        Avatars
                                                    </label>
                                                    <div class="help-block">
                                                        Please enter a brief description of what this 
                                                        feature is about, so that they will 
                                                        know what they are choosing.
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <!-- END OF FORM CONTENTS! -->
                            </form>
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
        <%@include file="WEB-INF/jspf/footer.jspf" %>   

        <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
        <%-- Standard JS imports for every page--%>
        <%@include file="WEB-INF/jspf/javascripts.jspf" %>
        <script type="text/javascript" src="/Instructor/assets/js/lapicalls.js"></script>
        <script type="text/javascript" src="/Instructor/assets/js/dashboard-custom.js"></script>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>