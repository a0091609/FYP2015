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


                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid profile">
                        <div class="span12">
                            <!--BEGIN TABS-->
                            <div class="tabbable tabbable-custom tabbable-full-width">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1_1" data-toggle="tab">Overview</a></li>
                                    <li><a href="#tab_1_2" data-toggle="tab">Profile Info</a></li>
                                    <li><a href="#tab_1_4" data-toggle="tab">Earnings</a></li>
                                    <li><a href="#tab_1_5" data-toggle="tab">Skill Points</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane row-fluid active" id="tab_1_1">
                                        <ul class="unstyled profile-nav span3">
                                            <li><img src="assets/img/profile/profile-img.png" alt="" /></li>
                                        </ul>
                                        <div class="span9">
                                            <div class="row-fluid">
                                                <div class="span7 profile-info">
                                                    <h2>John Doe</h2>
                                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt laoreet dolore magna aliquam tincidunt erat volutpat laoreet dolore magna aliquam tincidunt erat volutpat.</p>
                                                    <ul class="unstyled">
                                                        <li><i class="icon-user"></i> <b>Job Class:</b> Beginner</li>
                                                        <li><i class="icon-usd"></i> <b>Gold Balance:</b> 0</li>
                                                        <li><i class="icon-signal"></i> <b>Lifetime Earnings:</b> 99999</li>
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

                                                        <tr>
                                                            <td>Pixel Ltd</td>
                                                            <td class="hidden-phone">Server hardware purchase</td>
                                                            <td>52560.10$ <span class="label label-success label-mini">Paid</span></td>
                                                            <td class="hidden-phone"><a class="btn mini green-stripe" href="#">View</a></td>
                                                            <td><a class="btn mini green-stripe" href="#">View</a></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end tab-pane-->





                                    <div class="tab-pane profile-classic row-fluid" id="tab_1_2">
                                        <div class="span2"><img src="assets/img/profile/profile-img.png" alt="" /> <a href="#" class="profile-edit">edit</a></div>
                                        <ul class="unstyled span10">
                                            <li><span>User Name:</span> JDuser</li>
                                            <li><span>First Name:</span> John</li>
                                            <li><span>Last Name:</span> Doe</li>
                                            <li><span>Counrty:</span> Spain</li>
                                            <li><span>Birthday:</span> 18 Jan 1982</li>
                                            <li><span>Occupation:</span> Web Developer</li>
                                            <li><span>Email:</span> <a href="#">john@mywebsite.com</a></li>
                                            <li><span>Interests:</span> Design, Web etc.</li>
                                            <li><span>Website Url:</span> <a href="#">http://www.mywebsite.com</a></li>
                                            <li><span>Mobile Number:</span> +1 646 580 DEMO (6284)</li>
                                            <li><span>About:</span> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</li>
                                        </ul>
                                    </div>
                                    <!--tab_1_2-->


                                    <div class="tab-pane" id="tab_1_4">
                                        <div class="row-fluid add-portfolio">
                                            <div class="pull-left">
                                                <span>502 Items sold this week</span>
                                            </div>
                                            <div class="pull-left">
                                                <a href="#" class="btn icn-only green">Add a new Project <i class="m-icon-swapright m-icon-white"></i></a>                          
                                            </div>
                                        </div>
                                        <!--end add-portfolio-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_metronic.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5" style="overflow:hidden;">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>187</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>1789</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$37.240</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_azteca.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>24</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>660</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$7.060</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_conquer.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5" style="overflow:hidden;">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>24</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>975</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$21.700</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
                                    </div>
                                    <!--end tab-pane-->

                                    <div class="tab-pane" id="tab_1_5">
                                        <div class="row-fluid add-portfolio">
                                            <div class="pull-left">
                                                <span>502 Items sold this week</span>
                                            </div>
                                            <div class="pull-left">
                                                <a href="#" class="btn icn-only green">Add a new Project <i class="m-icon-swapright m-icon-white"></i></a>                          
                                            </div>
                                        </div>
                                        <!--end add-portfolio-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_metronic.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5" style="overflow:hidden;">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>187</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>1789</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$37.240</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_azteca.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>24</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>660</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$7.060</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
                                        <div class="row-fluid portfolio-block">
                                            <div class="span5 portfolio-text">
                                                <img src="assets/img/profile/portfolio/logo_conquer.jpg" alt="" />
                                                <div class="portfolio-text-info">
                                                    <h4>Metronic - Responsive Template</h4>
                                                    <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                </div>
                                            </div>
                                            <div class="span5" style="overflow:hidden;">
                                                <div class="portfolio-info">
                                                    Today Sold
                                                    <span>24</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Total Sold
                                                    <span>975</span>
                                                </div>
                                                <div class="portfolio-info">
                                                    Earns
                                                    <span>$21.700</span>
                                                </div>
                                            </div>
                                            <div class="span2 portfolio-btn">
                                                <a href="#" class="btn bigicn-only"><span>Manage</span></a>                      
                                            </div>
                                        </div>
                                        <!--end row-fluid-->
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

                var ctx = $("#myChart").get(0).getContext("2d");
                var myNewChart = new Chart(ctx);

                var data = {
                    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Partying", "Running"],
                    datasets: [
                        {
                            fillColor: "rgba(220,220,220,0.5)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            data: [65, 59, 90, 81, 56, 55, 40]
                        },
                        {
                            fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [28, 48, 40, 19, 96, 27, 100]
                        }
                    ]
                }

                new Chart(ctx).Radar(data);


            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>