<%@page import="entity.Quest"%>
<%@page import="entity.Skill"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="entity.Avatar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <%Module mod = (Module) request.getAttribute("module");%>
        <meta charset="utf-8" />
        <title>GLMS | <%=mod.getModuleName()%></title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link href="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/chosen-bootstrap/chosen/chosen.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pages/profile.css" rel="stylesheet" type="text/css" />
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>
        <%@include file="/WEB-INF/jspf/headerBar2.jspf" %> 
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
                                <%=mod.getModuleCode()%> - <%=mod.getModuleName()%>
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="Login">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Login">Modules</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%=mod.getModuleCode()%></a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->


                    <%
                        //Grab information from servlet
                        Avatar student = (Avatar) request.getAttribute("student");

                        String name = student.getStudent().getName();
                        Integer gold = student.getCurrentBalance();
                        Integer lifeEarnings = student.getLifetimeEarnings();
                        List<Skill> skills = student.getSkills();
                        List<Quest> quests = student.getQuestsCompleted();
                    %>


                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid profile">
                        <div class="span12">
                            <!--BEGIN TABS-->
                            <div class="tabbable tabbable-custom tabbable-full-width">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1_1" data-toggle="tab">Overview</a></li>
                                    <li><a href="#tab_1_2" data-toggle="tab">Profile</a></li>
                                    <li><a href="#tab_1_5" data-toggle="tab">Skills</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane row-fluid active" id="tab_1_1">
                                        <ul class="unstyled profile-nav span3">
                                            <li><center><img src="assets/img/PhilAvatar.png" alt="" /></center></li>
                                        </ul>
                                        <div class="span9">
                                            <div class="row-fluid">
                                                <div class="span7 profile-info">
                                                    <h2><%=name%></h2>
                                                    <p>
                                                        Hi! I am Philson, a 4th year IS student.  
                                                        I am passionate about technology, and constantly stay in touch with the latest IT trends through blogs, websites and YouTube. 
                                                        I enjoy blogging, and researching about the latest web and mobile technologies. 
                                                    </p>
                                                    <ul class="unstyled">
                                                        <li><i class="icon-user"></i> <b>Job Class:</b> Beginner</li>
                                                        <li><i class="icon-usd"></i> <b>Gold Balance:</b> <%=gold%></li>
                                                        <li><i class="icon-signal"></i> <b>Lifetime Earnings:</b> <%=lifeEarnings%></li>
                                                    </ul>
                                                </div>
                                                <!--end span8-->
                                                <div class="span5">
                                                    <center><canvas id="myChart" width="240" height="240"></canvas></center>
                                                </div>
                                                <!--end span4-->
                                            </div>
                                            <!--end row-fluid-->
                                        </div>
                                        <!--end span9-->
                                        <div class="row-fluid">
                                            <div class="span12" style="display: block;">
                                                <h3>Quests Completed</h3>
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="icon-compass"></i> Name</th>
                                                            <th class="hidden-phone"><i class="icon-info-sign"></i> Description</th>
                                                            <th><i class="icon-star"></i> Difficulty</th>
                                                            <th class="hidden-phone"><i class="icon-plus-sign"></i> Skill Gain</th>
                                                            <th><i class="icon-dollar"></i> Earnings</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            //Print all the Quests
                                                            for (Quest q : quests)
                                                            {
                                                                String qName = q.getName();
                                                                String description = q.getDescription().substring(0, 110) + "...";
                                                                Integer goldReward = q.getGoldReward();
                                                                String skill = q.getSkillReward().getName();
                                                                Integer sp = q.getSkillReward().getSkillPoints();
                                                                Integer difficulty = q.getDifficulty();
                                                        %>
                                                        <tr>
                                                            <td><%=qName%></td>
                                                            <td class="hidden-phone questDesc" style="width:auto"><%=description%></td>
                                                            <td><%=difficulty%> star</td>
                                                            <td class="hidden-phone">+<%=sp%> <%=skill%></td>
                                                            <td>+<%=goldReward%> gold</td>
                                                        </tr>
                                                        <%
                                                            } //Done Printing
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tab-pane-->





                                    <div class="tab-pane profile-classic row-fluid" id="tab_1_2">
                                        <div class="span2"><img src="assets/img/myAvatar.jpg" style="width:180px"/></div>
                                        <ul class="unstyled span10">
                                            <li><span>First Name:</span> Philson</li>
                                            <li><span>Last Name:</span> Nah</li>
                                            <li><span>Citizenship:</span> Singaporean</li>
                                            <li><span>Birthday:</span> 9 Feb 1989</li>
                                            <li><span>1st Major:</span> Information Systems (Hons)</li>
                                            <li><span>2nd Major:</span> -</li>
                                            <li><span>Email:</span> <a href="#">Philson@nus.edu.sg</a></li>
                                            <li><span>Interests:</span> Design, Web, Mobile etc.</li>
                                            <li><span>Website Url:</span> <a href="#">http://www.facebook.com/philson.nah</a></li>
                                            <li><span>Mobile Number:</span> 9696 6686</li>
                                        </ul>
                                    </div>
                                    <!--tab_1_2-->


                                    <div class="tab-pane" id="tab_1_5">
                                        <div class="row-fluid">
                                            <div class="span6"><center><canvas id="myChart2" width="400" height="400"></canvas></center></div>
                                            <div class="span6">
                                                <h1><%=name%></h1>
                                                <p><b>Job Class:</b> Beginner</p>
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="icon-bolt"></i> Skill Name</th>
                                                            <th><i class="icon-dashboard"></i> Skill Points</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            //Print all the skills
                                                            for (Skill s : skills)
                                                            {
                                                        %>
                                                        <tr>
                                                            <td><%=s.getName()%></td>
                                                            <td><%=s.getSkillPoints()%></td>
                                                        </tr>
                                                        <%
                                                            } //Done Printing
                                                        %>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--END TABS-->
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
        <script type="text/javascript" src="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script type="text/javascript" src="assets/plugins/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/Chart.min.js"></script>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                TableManaged.init();

            <%
                List<String> skillTypes = new ArrayList();
                List<Integer> skillPoints = new ArrayList();
                //Process student skills
                for (Skill s : skills)
                {
                    skillTypes.add(s.getName());
                    skillPoints.add(s.getSkillPoints());
                }
            %>

                var ctx = $("#myChart").get(0).getContext("2d");
                var myNewChart = new Chart(ctx);
                var ctx2 = $("#myChart2").get(0).getContext("2d");
                var myNewChart2 = new Chart(ctx2);


                var data = {
                    labels: [
            <%
                //Print all the skill names
                for (String s : skillTypes)
                {
                    out.print("\"" + s + "\",");
                }
            %>
                    ],
                    datasets: [
                        {
                            fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [
            <%
                //Print all the skill points
                for (Integer sp : skillPoints)
                {
                    out.print(sp + ",");
                }
            %>
                            ]
                        }
                    ]
                }
                new Chart(ctx).Radar(data);
                new Chart(ctx2).Radar(data);

            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>