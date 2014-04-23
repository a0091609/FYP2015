<%@page import="java.util.ArrayList, java.text.SimpleDateFormat, helper.QuizDetails" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Student Quizzes</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.css"/>
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/glyphicons_halflings/css/halflings.css" rel="stylesheet" />

        <style>
            .nohover:hover{
                border-color: transparent;
                cursor: default;
            }
        </style>
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
                                    <a href="/Student/dashboard.jsp">Dashboard</a>
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
                                <div class="span10 responsive" data-tablet="span12 fix-offset" data-desktop="span12">
                                    <div class="portlet box grey">
                                        <div class="portlet-title">
                                            <div class="caption">Quiz</div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover" id="sample_2">
                                                <thead>
                                                    <tr>
                                                        <th>Quiz</th>
                                                        <th>Difficulty</th>
                                                        <th>Date Open</th>
                                                        <th>Date Close</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        ArrayList quizzes = (ArrayList) request.getAttribute("quizzes");
                                                        for (Object o : quizzes) {
                                                            QuizDetails quiz = (QuizDetails) o;
                                                            String lvl = quiz.getDifficultyLvl();
                                                            String stars = "", tips = "";
                                                            if (lvl.equals("beginner")) {
                                                                tips = "Beginner";
                                                                stars = "<i class='icon-star' style='font-size: 20px;'></i>";
                                                            } else if (lvl.equals("intermediate")) {
                                                                tips = "Intermediate";
                                                                stars = "<i class='icon-star' style='font-size: 20px;'></i> <i class='icon-star' style='font-size: 20px;'></i>";
                                                            } else {
                                                                tips = "Advanced";
                                                                stars = "<i class='icon-star' style='font-size: 20px;'></i> <i class='icon-star' style='font-size: 20px;'></i> <i class='icon-star' style='font-size: 20px;'></i>";
                                                            }

                                                    %>
                                                    <tr class="odd gradeX">
                                                        <td><%=quiz.getName()%></td>
                                                        <td style="text-align: center;"><div class="tooltips" data-placement="top" data-original-title="<%=tips%>"><%=stars%></div></td>
                                                        <td><%=quiz.getDateOpen()%></td>
                                                        <td><%=quiz.getDateClose()%></td>
                                                        <td>
                                                            <%
                                                                if (quiz.isActive()) {
                                                                    out.print("<a href='/Student/QuizServlet?action=playQuiz&quizId="
                                                                            + quiz.getQuizId() + "' class='btn mini purple'><i class='halflings-icon white play'></i> Play</a>");
                                                                } else {
                                                                    out.print(quiz.getStatus());
                                                                }
                                                            %>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="span2">
                                    <div class="tile bg-red tooltips nohover" data-placement="bottom" data-original-title="Your current Correct Streak.">
                                        <div class="tile-body text-center" style="font-size: 80px; padding-top: 35px;">
                                            <%=request.getAttribute("streak")%>
                                        </div>
                                        <div class="tile-object text-center" style="font-size: 15px;">
                                            <i class="icon-fire"></i> Correct Streak
                                        </div>
                                    </div>
                                    <div class="tile bg-yellow tooltips" data-placement="bottom" data-original-title="Retry a quiz.">
                                        <a href="#redoQuiz" data-toggle="modal">
                                            <div class="tile-body">
                                                <i class="icon-refresh"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">                           
                                                    Retry
                                                </div>
                                                <div class="number" id="itemFifty">
                                                    <%=request.getAttribute("itemRetry")%>
                                                </div>
                                            </div>          
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="redoQuiz" class="modal hide fade" tabindex="-1" data-replace="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h3>Retry a Quiz</h3>
                        </div>

                        <form action="QuizServlet?action=" method="post" class="form-horizontal" id="quizForm">
                            <div class="modal-body">
                                <div class="control-group">
                                    <label class="control-label" >Choose a Quiz</label>
                                    <div class="controls">
                                        <select  class="m-wrap span12" required>
                                            <option value="" disabled></option>
                                            <%
                                                ArrayList completedQuiz = (ArrayList) request.getAttribute("completedQuiz");
                                                if (completedQuiz != null) {
                                                    for (Object o : completedQuiz) {
                                                        QuizDetails d = (QuizDetails) o;
                                                        out.print("<option value='" + d.getQuizId() + "'>" + d.getName() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                                <input type="submit" value="Go" class="btn blue">
                            </div>
                        </form>
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