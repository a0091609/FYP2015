<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Quiz Settings</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="/Instructor/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" />
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>
        <%@include file="/WEB-INF/jspf/headerBar.jspf" %> 
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

                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%= session.getAttribute("moduleName")%></a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%= session.getAttribute("quizName")%></a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    Quiz Info
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="row-fluid">
                                <div class="span12 text-center">
                                    <h3><%= session.getAttribute("quizName")%></h3>
                                </div>
                            </div>
                            <hr>
                            <div class="row-fluid">
                                <div class="span12 text-center">
                                    <h3>Tell a bit more about the quiz.</h3>
                                </div>
                            </div>

                            <form class="horizontal-form" id="quizForm" method="post" action="/Instructor/QuizServlet?action=saveQuizInfo&quizId=<%= session.getAttribute("quizId")%>">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">Description</label>
                                            <div class="controls">
                                                <textarea class="m-wrap" rows="3" name="descr" style="width:98%;"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">Difficulty level</label>
                                            <div class="controls">
                                                <select class="m-wrap span12" name="difficulty" required>
                                                    <option value="" disabled></option>
                                                    <option value="beginner">Beginner</option>
                                                    <option value="intermediate">Intermediate</option>
                                                    <option value="advanced">Advanced</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-group">
                                            <label class="control-label">Dates Open</label>
                                            <div class="controls">
                                                <div class="input-prepend">
                                                    <span class="add-on"><i class="icon-calendar"></i></span><input type="text" class="m-wrap date-range" name="datesOpen"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <input type="submit" value="Done" class="btn green">
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
        <%@include file="/WEB-INF/jspf/footer.jspf" %>   

        <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
        <%-- Standard JS imports for every page--%>
        <%@include file="/WEB-INF/jspf/javascripts.jspf" %>
        <script type="text/javascript" src="/Instructor/assets/plugins/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="/Instructor/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugin
                if (!jQuery().daterangepicker) {
                    return;
                }

                $('.date-range').daterangepicker(
                        {
                            opens: (App.isRTL() ? 'left' : 'right'),
                            format: 'dd/MM/yyyy',
                            separator: ' to ',
                            startDate: Date.today(),
                            endDate: Date.today().add({
                                days: 7
                            }),
                            minDate: Date.today(),
                        }
                );
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>