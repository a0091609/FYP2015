<%@page import="java.util.ArrayList, helper.StudentFeedback, helper.QuizResults" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Quiz Summary</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %> 
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
                                Student Feedback
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="/Instructor/dashboard.jsp">Dashboard</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Student Feedback</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span7">
                            <div class="portlet">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-bar-chart"></i> Quiz Summary</div>
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Question</th>
                                                <th class="hidden-480">Answer</th>
                                                <th>Correct Percentage</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ArrayList questionList = (ArrayList) request.getAttribute("questionList");
                                                int percent[] = {63, 80, 83, 86, 79};
                                                //Min + (int)(Math.random() * ((Max - Min) + 1))
                                                for (int i = 0; i < questionList.size(); i++) {
                                                    QuizResults r = (QuizResults) questionList.get(i);
                                            %>
                                            <tr>
                                                <td><%=i + 1%></td>
                                                <td><%=r.getQuestionText()%></td>
                                                <td class="hidden-480"><%=r.getAnswer()%></td>
                                                <td style="text-align: center;"><%=55 + (int) (Math.random() * 46)%>%</td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <div class="span5">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet">
                                <div class="portlet-title line">
                                    <div class="caption"><i class="icon-comments"></i> Students' Feedback</div>
                                </div>
                                <div class="portlet-body" id="chats">
                                    <div class="scroller" style="height:435px" data-always-visible="1" data-rail-visible1="1">
                                        <ul class="chats">
                                            <%
                                                ArrayList feedbacks = (ArrayList) request.getAttribute("feedbacks");
                                                for (int i = 0; i < feedbacks.size(); i++) {
                                                    StudentFeedback feedback = (StudentFeedback) feedbacks.get(i);
                                                    String liClass = (i % 2 == 0) ? "in" : "out";
                                            %>
                                            <li class="<%=liClass%>">
                                                <img class="avatar" alt="" src="<%=feedback.getImgUrl()%>" />
                                                <div class="message">
                                                    <span class="arrow"></span>
                                                    <a href="#" class="name"><%=feedback.getUsername()%></a>
                                                    <span class="datetime">at <%=feedback.getTime()%></span>
                                                    <span class="body">
                                                        <%=feedback.getFeedback()%>
                                                    </span>
                                                </div>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- END PORTLET-->
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
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>