<%@page import="java.util.ArrayList, java.text.SimpleDateFormat, helper.QuizDetails" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Instructor Dashboard</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.css"/>
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
        <link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css" />
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
                                Quizzes
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Dashboard</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    Quizzes
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid profile">
                        <div class="span12">
                            <div class="row-fluid">
                                <div class="span12 responsive" data-tablet="span12 fix-offset" data-desktop="span12">
                                    <div class="portlet box grey">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="icon-user"></i>Quiz</div>
                                            <div class="actions">
                                                <a class="btn blue" data-toggle="modal" href="#newQuiz-form"><i class="icon-plus"></i> New Quiz</a>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="sample_2">
                                                <thead>
                                                    <tr>
                                                        <th>Quiz</th>
                                                        <th>Difficulty</th>
                                                        <th>Date Open</th>
                                                        <th>Date Close</th>
                                                        <th>Time Created</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        ArrayList quizzes = (ArrayList) request.getAttribute("quizzes");
                                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                                        for (Object o : quizzes) {
                                                            QuizDetails quiz = (QuizDetails) o;
                                                    %>
                                                    <tr class="odd gradeX">
                                                        <td><%=quiz.getName()%></td>
                                                        <td><%=quiz.getDifficultyLvl()%></td>
                                                        <td><%=dateFormat.format(quiz.getDateOpen())%></td>
                                                        <td><%=dateFormat.format(quiz.getDateClose())%></td>
                                                        <td><%=quiz.getTimeCreated()%></td>
                                                        <td></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                            <div id="newQuiz-form" class="modal hide fade" tabindex="-1" data-width="760">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h3>New Quiz</h3>
                                                </div>
                                                <form action="QuizServlet?action=saveNewQuiz" method="post" id="quizForm">
                                                    <div class="modal-body">
                                                        <div class="scroller" style="height:200px" data-always-visible="1" data-rail-visible1="1">
                                                            <div class="row-fluid">
                                                                <div class="span12 text-center">
                                                                    <h4>Let's give the quiz a name:</h4>
                                                                    <input type="text" name="quizName" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal" class="btn">Close</button>
                                                        <input type="submit" value="Go" class="btn blue">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        <script src="/Instructor/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript" ></script>
        <script src="/Instructor/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript" ></script>
        <script src="/Instructor/assets/scripts/ui-modals.js"></script>
        <script type="text/javascript" src="/Instructor/assets/plugins/select2/select2.min.js"></script>
        <script type="text/javascript" src="/Instructor/assets/plugins/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="/Instructor/assets/plugins/data-tables/DT_bootstrap.js"></script>
        <script src="/Instructor/assets/scripts/table-managed.js"></script>    
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                UIModals.init();
                TableManaged.init();
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>