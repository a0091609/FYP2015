<%@page import="java.util.ArrayList, helper.GameProfileDetails, helper.LeaderboardDetails" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Game Profile</title>
        <%-- Standard imports for every page--%>
        <%@include file="WEB-INF/jspf/stylesheets.jspf" %> 
        <link href="assets/css/pages/profile.css" rel="stylesheet" type="text/css" />
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
                                Game Profile
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
                                    <a href="#">Game Profile</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->


                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <ul class="unstyled profile-nav span2">
                                <li><img src="assets/img/gstwchihyong.jpg" alt="" /></li>
                            </ul>
                            <div class="span10">
                                <div class="row-fluid">
                                    <div class="span12 profile-info">
                                        <h1><%=session.getAttribute("username")%></h1>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span8 profile-info">
                                        <%
                                            GameProfileDetails p = (GameProfileDetails) request.getAttribute("profile");
                                        %>
                                        <div class="row-fluid">
                                            <div class="span4" data-tablet="span6" data-desktop="span3">
                                                <div class="dashboard-stat blue">
                                                    <div class="visual">
                                                        <i class="icon-heart"></i>
                                                    </div>
                                                    <div class="details">
                                                        <div class="number">
                                                            <%=p.getExpPoint()%>
                                                        </div>
                                                        <div class="desc">                           
                                                            EXP Points
                                                        </div>
                                                    </div>           
                                                </div>
                                            </div>
                                            <div class="span4" data-tablet="span6" data-desktop="span3">
                                                <div class="dashboard-stat green">
                                                    <div class="visual">
                                                        <i class="icon-user"></i>
                                                    </div>
                                                    <div class="details">
                                                        <div class="number" style="text-transform: capitalize; font-size:17px; font-weight:bold;">
                                                            <%=p.getExpLevel()%>
                                                        </div>
                                                        <div class="desc">                           
                                                            EXP Level
                                                        </div>
                                                    </div>            
                                                </div>
                                            </div>
                                            <div class="span4" data-tablet="span6" data-desktop="span3">
                                                <div class="dashboard-stat red">
                                                    <div class="visual">
                                                        <i class="icon-fire"></i>
                                                    </div>
                                                    <div class="details">
                                                        <div class="number">
                                                            <%=p.getStreak()%>
                                                        </div>
                                                        <div class="desc" style="font-size:12px;">                           
                                                            Correct Streak
                                                        </div>
                                                    </div>            
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span4">
                                        <a href="/Student/QuizServlet?action=viewAllQuiz&moduleId=<%=session.getAttribute("moduleId")%>&moduleName=<%=session.getAttribute("moduleName")%>" class="btn purple pull-right">View All Quiz</a>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span8">
                                        <div class="portlet">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="icon-trophy"></i> Leaderboard</div>
                                            </div>
                                            <div class="portlet-body">
                                                <ul class="feeds">
                                                    <%
                                                        ArrayList leaderboard = (ArrayList) request.getAttribute("leaderboard");
                                                        String userId = session.getAttribute("userId").toString();
                                                        for (Object o : leaderboard) {
                                                            LeaderboardDetails d = (LeaderboardDetails) o;
                                                            String lUserId = d.getUserId();
                                                            String lvl = d.getLvl(), lvlLabel = "";
                                                            if (lvl.equals("novice")) {
                                                                lvlLabel = "label-success";
                                                            } else if (lvl.equals("apprentice")) {
                                                                lvlLabel = "label-info";
                                                            } else if (lvl.equals("enthusiast")) {
                                                                lvlLabel = "label-warning";
                                                            } else if (lvl.equals("expert")) {
                                                                lvlLabel = "label-important";
                                                            } else if (lvl.equals("guru")) {
                                                                lvlLabel = "label-inverse";
                                                            }
                                                    %>
                                                    <li <%if (userId.equals(lUserId)) {
                                                            out.print("style='font-weight:bold;'");
                                                        }%>>
                                                        <a href="#">
                                                            <div class="col1">
                                                                <div class="cont">
                                                                    <div class="cont-col1">
                                                                        <img alt="" src="<%=d.getImgUrl()%>" style="height:25px; width: 25px;"/>
                                                                    </div>
                                                                    <div class="cont-col2">
                                                                        <div class="desc">
                                                                            <%=d.getName()%>
                                                                            <span class="label <%=lvlLabel%> label-mini" style="text-transform: capitalize; margin-left:5px;"><%=lvl%></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col2">
                                                                <div>
                                                                    <%=d.getPts()%>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <%
                                                        }
                                                    %>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <!--Reputation table-->
                                    <!--Need to be updated with real data after developing a reputation system-->
                                    <div class="span4">
                                        <div class="portlet sale-summary">
                                            <div class="portlet-title">
                                                <div class="caption"><i class="icon-comments"></i> Reputation</div>
                                            </div>
                                            <div class="portlet-body">
                                                <ul class="unstyled">
                                                    <li>
                                                        <span class="sale-info">Clarity <i class="icon-img-down"></i></span> 
                                                        <span class="sale-num">6</span>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">Idea Contribution <i class="icon-img-up"></i></span> 
                                                        <span class="sale-num">9</span>
                                                    </li>
                                                    <li>
                                                        <span class="sale-info">Demonstrate relevance</span> 
                                                        <span class="sale-num">2</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End of Reputation table-->

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
    <%@include file="WEB-INF/jspf/footer.jspf" %>   

    <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
    <%-- Standard JS imports for every page--%>
    <%@include file="WEB-INF/jspf/javascripts.jspf" %> 
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