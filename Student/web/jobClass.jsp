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
        <meta charset="utf-8" />
        <title>GLMS | Job Classes></title>
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
                                IS1112 - Job Classes
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="Login">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Login">IS1112</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Jobs</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->

                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <h1>E-Commerce Warrior</h1>
                        <div class="span3"><center><img src="assets/img/warrior.png" alt="" /></center></div>
                        <div class="span4"><center><canvas id="myChart" width="300" height="300"></canvas></center></div>
                        <div class="span4">
                            <h2>Skill Requirements</h2>
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="icon-bolt"></i> Skill Name</th>
                                        <th><i class="icon-dashboard"></i> Skill Points</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>HTML</td>
                                        <td>30 SP</td>
                                    </tr>
                                    <tr>
                                        <td>PHP</td>
                                        <td>30 SP</td>
                                    </tr>
                                    <tr>
                                        <td>Marketing</td>
                                        <td>50 SP</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <br>
                        <h1>Programming Wizard</h1>
                        <div class="span3"><center><img src="assets/img/mage.png" alt="" /></center></div>
                        <div class="span4"><center><canvas id="myChart2" width="300" height="300"></center></canvas></div>
                        <div class="span4">
                            <h2>Skill Requirements</h2>
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="icon-bolt"></i> Skill Name</th>
                                        <th><i class="icon-dashboard"></i> Skill Points</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>HTML</td>
                                        <td>30 SP</td>
                                    </tr>
                                    <tr>
                                        <td>PHP</td>
                                        <td>50 SP</td>
                                    </tr>
                                    <tr>
                                        <td>Databases</td>
                                        <td>30 SP</td>
                                    </tr>
                                    <tr>
                                        <td>Security</td>
                                        <td>30 SP</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <br>
                        <h1>Security Ranger</h1>
                        <div class="span3"><center><img src="assets/img/archer.png" alt="" /></center></div>
                        <div class="span4"><center><canvas id="myChart3" width="300" height="300"></canvas></center></div>
                        <div class="span4">
                            <h2>Skill Requirements</h2>
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="icon-bolt"></i> Skill Name</th>
                                        <th><i class="icon-dashboard"></i> Skill Points</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Databases</td>
                                        <td>50 SP</td>
                                    </tr>
                                    <tr>
                                        <td>Security</td>
                                        <td>50 SP</td>
                                    </tr>
                                    <tr>
                                        <td>PHP</td>
                                        <td>30 SP</td>
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
        <script type="text/javascript" src="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script type="text/javascript" src="assets/plugins/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/Chart.min.js"></script>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                TableManaged.init();
                setActivePage("link-job");

                var ctx = $("#myChart").get(0).getContext("2d");
                var myNewChart = new Chart(ctx);
                var ctx2 = $("#myChart2").get(0).getContext("2d");
                var myNewChart2 = new Chart(ctx2);
                var ctx3 = $("#myChart3").get(0).getContext("2d");
                var myNewChart3 = new Chart(ctx3);

                var data1 = {
                    labels: ["Databases", "Security", "Marketing", "HTML", "PHP"],
                    datasets: [
                        {
                            fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [0, 0, 50, 30, 30]
                        }
                    ]
                }

                var data2 = {
                    labels: ["Databases", "Security", "Marketing", "HTML", "PHP"],
                    datasets: [
                        {
                            fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [30, 30, 0, 30, 50]
                        }
                    ]
                }

                var data3 = {
                    labels: ["Databases", "Security", "Marketing", "HTML", "PHP"],
                    datasets: [
                        {
                            fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [50, 50, 0, 0, 30]
                        }
                    ]
                }

                new Chart(ctx).Radar(data1);
                new Chart(ctx2).Radar(data2);
                new Chart(ctx3).Radar(data3);
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>