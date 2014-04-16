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
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>
        <%@include file="/WEB-INF/jspf/headerBar.jspf" %> 
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
                        <div class="span12 no-more-tables">
                            <p>
                                Welcome to the "Ask an Expert" forums!<br>
                                Got a burning question you need answered? Offer a big bounty and get the best answers! <br>
                                Already an expert? Help out your peers and start raking up those bounties!
                            </p>
                            <br>
                            <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                <thead class="cf">
                                    <tr>
                                        <th>Asker</th>
                                        <th>Title</th>
                                        <th>Topics</th>
                                        <th>Bounty</th>
                                        <th>Date Posted</th>
                                        <th>Views</th>
                                        <th>Status</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeX">
                                        <td data-title="Asker"><center><img class="smallTableImg"><br>Philson Nah</center></td>
                                        <td data-title="Title">Basic questions on SQL</td>
                                        <td data-title="Topics">Databases</td>
                                        <td data-title="Bounty">30-04-2014</td>
                                        <td data-title="Date Posted">30-04-2014</td>
                                        <td data-title="Views">30</td>
                                        <td data-title="Status">30-04-2014</td>
                                        <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
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