<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Items Management</title>
        <%-- Standard imports for every page--%>
        <%@include file="WEB-INF/jspf/stylesheets.jspf" %>
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
                                Items Management
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="index.jsp">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="dashboard.jsp">Items</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN SAMPLE FORM PORTLET-->   
                            <div class="portlet box red tabbable">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-reorder"></i>
                                        <span class="hidden-480">Items</span>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="tabbable portlet-tabs">
                                        <ul class="nav nav-tabs">
                                            <li><a href="#portlet_tab4" data-toggle="tab">Booster Packs</a></li>
                                            <li><a href="#portlet_tab3" data-toggle="tab">Quest Items</a></li>
                                            <li><a href="#portlet_tab2" data-toggle="tab">Pets</a></li>
                                            <li class="active"><a href="#portlet_tab1" data-toggle="tab">Style Items</a></li>
                                        </ul>
                                        <div class="tab-content no-more-tables">
                                            <div class="tab-pane active" id="portlet_tab1">
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>test</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <td data-title="title"><input type="checkbox" class="checkboxes" value="1" /></td>
                                                            <td data-title="title">shuxer</td>
                                                            <td data-title="title"><a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a></td>
                                                            <td data-title="title"><span class="label label-success">Approved</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab2">
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_2">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>test</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <td data-title="title"><input type="checkbox" class="checkboxes" value="1" /></td>
                                                            <td data-title="title">shuxer</td>
                                                            <td data-title="title"><a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a></td>
                                                            <td data-title="title"><span class="label label-success">Approved</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab3">
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_1">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>test</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <td data-title="title"><input type="checkbox" class="checkboxes" value="1" /></td>
                                                            <td data-title="title">shuxer</td>
                                                            <td data-title="title"><a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a></td>
                                                            <td data-title="title"><span class="label label-success">Approved</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab4">
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_4">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>test</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <td data-title="title"><input type="checkbox" class="checkboxes" value="1" /></td>
                                                            <td data-title="title">shuxer</td>
                                                            <td data-title="title"><a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a></td>
                                                            <td data-title="title"><span class="label label-success">Approved</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
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
                //$('#footable').footable();
                TableManaged.init();
                setActivePage("link-items");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>