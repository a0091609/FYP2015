<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <%Module mod = (Module) request.getAttribute("module");%>
        <meta charset="utf-8" />
        <title>GLMS | Ask an Expert</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link href="assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
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
                                Ask an Expert Forums
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="Login">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Modules?action=moduleDashboard&moduleId=<%=session.getAttribute("moduleId")%>">IS1112</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Ask an Expert</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12 blog-page">
                            <div class="row-fluid">
                                <div class="span9 article-block">
                                    <h1>A Question on SQL Joins</h1>

                                    <!--end news-tag-data-->
                                    <div>
                                        <p>
                                            Hi<br><br>
                                            I am quite new to databases and I got stuck in the 1 Star quest. <br>
                                            I was wondering if anyone has done it yet? Could you help me out? <br><br>
                                            I am currently having problems with writing the JOIN statement. <br>
                                            Can somebody provide an example of how to use the JOIN statement? <br><br>
                                            I am offering a bounty of 50 gold for the best answer. <br>
                                            Thanks.<br>
                                        </p>

                                    </div>
                                    <br>
                                    <div class="blog-tag-data">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <ul class="unstyled inline blog-tags">
                                                    <li>
                                                        <i class="icon-tags"></i> 
                                                        <a href="#">IS1112</a> 
                                                        <a href="#">Databases</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="span6 blog-tag-data-inner">
                                                <ul class="unstyled inline">
                                                    <li><i class="icon-calendar"></i> <a href="#">April 22, 2014</a></li>
                                                    <li><i class="icon-usd"></i> <a href="#">Bounty: 50 Gold</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="media">
                                        <h3>Answers</h3>
                                        <p>No answers yet! Post a good answer for a chance to earn the bounty!</p>
                                    </div>
                                    <!--end media-->
                                    <hr>


                                    <div class="post-comment">
                                        <h3>Post an Answer</h3>
                                        <form action="forums.jsp">
                                            <label>Answer <span class="color-red">*</span></label>
                                            <textarea class="span10 m-wrap" rows="8"></textarea>
                                            <p><button class="btn blue" type="submit">Post Your Answer</button></p>
                                        </form>
                                    </div>
                                </div>
                                <!--end span9-->
                                <div class="span3 blog-sidebar">
                                    <h2>Asker Profile</h2>
                                    <img style="width:140px" src="assets/img/cyAvatar.png">
                                    <br><br>
                                    <p><b>Name: </b>Wong Chih Yong</p>
                                    <p><b>Job Class: </b>E-Commerce Warrior</p>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                    <div class="space20"></div>
                                </div>
                                <!--end span3-->
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
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                //$('#footable').footable();
                TableManaged.init();
                setActivePage("link-forums");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>