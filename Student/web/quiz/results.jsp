<%@page import="java.util.ArrayList, helper.GameProfileDetails, helper.QuizResults, helper.QuizDetails, helper.QuizItemDetails, helper.LeaderboardDetails" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Quiz Results</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.css"/>
        <link href="assets/plugins/glyphicons/css/glyphicons.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
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
                                    Quiz Results
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->


                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span7">
                            <div class="row-fluid">
                                <table class="table table-striped table-bordered table-advance table-hover">
                                    <thead>
                                        <tr>
                                            <th><i class="icon-question-sign"></i> Question</th>
                                            <th><i class="icon-bookmark"></i> Correct Answer</th>
                                            <th>Your Answer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList results = (ArrayList) request.getAttribute("results");
                                            for (Object o : results) {
                                                QuizResults result = (QuizResults) o;
                                        %>
                                        <tr>
                                            <td class="highlight">
                                                <div class="<%
                                                    if (result.isIsCorrect()) {
                                                        out.print("success");
                                                    } else {
                                                        out.print("important");
                                                    }
                                                     %>"></div>
                                                     <div style="padding-left:5px;"><%=result.getQuestionText()%></div>
                                            </td>
                                            <td><%=result.getAnswer()%></td>
                                            <td><span class="tooltips glyphicons no-js icn-only
                                                   <%
                                                       if (result.isIsCorrect()) {
                                                           out.print("ok_2");
                                                       } else {
                                                           out.print("remove_2");
                                                       }
                                                   %>" data-placement="right" data-original-title="<%
                                                       if (result.isIsCorrect()) {
                                                           out.print("You were correct.");
                                                       } else {
                                                           out.print("You were wrong.");
                                                       }
                                                   %>"
                                                   >
                                                    <i></i> <%=result.getWrongAns()%>
                                                </span></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <%
                                        GameProfileDetails p = (GameProfileDetails) request.getAttribute("profile");
                                        QuizDetails q = (QuizDetails) request.getAttribute("unlockedQuiz");
                                        String streakBonus = request.getAttribute("streakBonus").toString();
                                        String initialLvl = request.getAttribute("initialLvl").toString();
                                        LeaderboardDetails l = (LeaderboardDetails) request.getAttribute("leaderboardPos");
                                    %>
                                    <div class="portlet box yellow">
                                        <div class="portlet-title">
                                            <div class="caption"><i class="icon-trophy"></i>Rewards</div>
                                        </div>

                                        <div class="portlet-body">
                                            <ul class="feeds">
                                                <!--New Item-->
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-important">                        
                                                                    <i class="icon-gift"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    You have earned an Item for completing the quiz.
                                                                    <span class="label label-warning label-mini">
                                                                        Take action 
                                                                        <i class="icon-share-alt"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date">
                                                            <a class="btn mini blue" data-toggle="modal" href="#newItem"> Open</a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!--End of New Item-->

                                                <!--Unlocked Quiz-->
                                                <%if (q != null) {%>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-important">                        
                                                                    <i class="icon-gift"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    You have unlocked <b><%=q.getName()%></b>.
                                                                    <span class="label label-warning label-mini">
                                                                        Take action 
                                                                        <i class="icon-share-alt"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col2">
                                                        <div class="date">
                                                            <a class="btn mini blue" href="/Student/QuizServlet?action=playQuiz&quizId=<%=q.getQuizId()%>"> Play</a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <%
                                                    }
                                                %>
                                                <!--End of Unlocked Quiz-->

                                                <!--Streak Bonus-->
                                                <%if (Integer.valueOf(streakBonus) > 0) {%>
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-success">                        
                                                                    <i class="icon-thumbs-up"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    You have earned <b><%=streakBonus%> Correct Streak Bonus!</b>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <%}%>
                                                <!--End of Streak Bonus-->

                                                <!--Current EXP Level-->
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <%if (!initialLvl.equals(p.getExpLevel())) {
                                                                %>
                                                                <div class="label label-success">
                                                                    <i class="icon-thumbs-up"></i>
                                                                </div>
                                                                <%
                                                                } else {
                                                                %>
                                                                <div class="label label-info">
                                                                    <i class="icon-heart"></i>
                                                                </div>
                                                                <%
                                                                    }
                                                                %>

                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    <%
                                                                        if (!initialLvl.equals(p.getExpLevel())) {
                                                                            out.print("Congratulations! You have leveled up to ");
                                                                    %>
                                                                    <b style="text-transform: capitalize;"><%=p.getExpLevel()%></b>.
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    You are now <b style="text-transform: capitalize;"><%=p.getExpLevel()%></b>.
                                                                    <%
                                                                        }
                                                                    %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!--End of Current EXP Level-->

                                                <!--Current EXP Points-->
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-info">                        
                                                                    <i class="icon-heart"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    You have <b><%=p.getExpPoint()%> EXP</b> now. <b><%=request.getAttribute("ptsToNext")%> EXP</b> to next level.
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!--End of Current EXP Points--> 

                                                <!--Leaderboard Position-->
                                                <li>
                                                    <div class="col1">
                                                        <div class="cont">
                                                            <div class="cont-col1">
                                                                <div class="label label-warning">                        
                                                                    <i class="icon-bell-alt"></i>
                                                                </div>
                                                            </div>
                                                            <div class="cont-col2">
                                                                <div class="desc">
                                                                    <%if (!(l.getPosition() > 1)) {%>
                                                                    Congratulations! You are top of the Leaderboard.
                                                                    <%} else {%>
                                                                    You currently rank no. <b><%=l.getPosition()%></b> and is <b><%=l.getPtsAway()%> EXP</b> away from <b><%=l.getUserInFront()%></b>.
                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!--End of Leaderboard Position-->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            QuizItemDetails item = (QuizItemDetails) request.getAttribute("newItem");
                            String name = item.getName();
                        %>
                        <div id="newItem" class="modal hide fade" tabindex="-1" data-replace="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h3><i class="icon-gift"></i> New Item Added to Your Collection!</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span4">
                                        <div class="tile bg-yellow">
                                            <div class="tile-body">
                                                <i class="icon-random"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">
                                                </div>
                                                <div class="number">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span8">
                                        <h4><%=name%></h4>
                                        <%=item.getDescr()%>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                            </div>
                        </div>


                        <div class="span5">
                            <form action="/Student/QuizServlet?action=sendFeedback" method="post" class="horizontal-form">
                                <h3 class="form-section"><i class="icon-pencil"></i> Feedback Form</h3>
                                What did you find most confusing or difficult about the material? If nothing was confusing, explain what you found most useful.

                                <div class="control-group margin-top-20">
                                    <label class="control-label" >Message</label>
                                    <div class="controls">
                                        <textarea class="m-wrap span12" rows="5" name="feedback" required></textarea>
                                    </div>
                                </div>
                                <button type="submit" class="btn blue"><i class="icon-ok"></i> Send</button>
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