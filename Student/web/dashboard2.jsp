<%@page import="helper.ModuleDetails"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Student Dashboard</title>
        <%-- Standard imports for every page--%>
        <%@include file="WEB-INF/jspf/stylesheets.jspf" %>
        <% session.removeAttribute("moduleId");
            session.removeAttribute("moduleName");%>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-full-width">
        <%-- Import for the header bar --%>
        <%@include file="WEB-INF/jspf/headerBar.jspf" %> 
        <!-- BEGIN CONTAINER -->
        <div class="page-container">

            <!-- SIDEBAR REMOVED -->
            
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN PAGE HEADER-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title">
                                Student Modules
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>Modules </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <%
                            ArrayList moduleList = (ArrayList) request.getAttribute("moduleList");
                            int i = 0;
                            //Print all the modules
                            for (Object o : moduleList)
                            {
                                i++;
                                String color = "blue";
                                ModuleDetails mod = (ModuleDetails) o;

                                //Set the color of the tile
                                if (i % 4 == 0)
                                    color = "yellow";
                                else if (i % 3 == 0)
                                    color = "purple";
                                else if (i % 2 == 0)
                                    color = "green";
                                else
                                    color = "blue";

                                //later need to check to see if mod is activated
                                String moduleCode = mod.getModuleCode(); 
                                String moduleID = mod.getModuleId();
                                String modName = mod.getModuleName().trim();
                        %>
                        <div class="span3 responsive" data-tablet="span6" data-desktop="span3">
                            <div class="dashboard-stat <%=color%>">
                                <div class="visual">
                                    <i class="icon-book"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <%=moduleCode%>
                                    </div>
                                    <div class="desc">
                                        <%=modName%>
                                    </div>
                                </div>
                                <a class="more" href="Items?action=viewAllItems&moduleId=<%=moduleID%>">
                                    Open Module <i class="m-icon-swapright m-icon-white"></i>
                                </a>                 
                            </div>
                        </div>
                        <%  //Done printing
                            }
                        %>
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