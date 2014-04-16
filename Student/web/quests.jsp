<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <%Module mod = (Module) request.getAttribute("module");%>
        <meta charset="utf-8" />
        <title>GLMS | Quests</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css" />
        <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
        <link href="assets/css/pages/search.css" rel="stylesheet" type="text/css"/>
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
                                Quests
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
                                    <a href="#">Quest</a>
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
                                        <span class="hidden-480">Quests</span>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="tabbable portlet-tabs">
                                        <ul class="nav nav-tabs">
                                            <li><a href="#portlet_tab3" data-toggle="tab">3 Star</a></li>
                                            <li><a href="#portlet_tab2" data-toggle="tab">2 Star</a></li>
                                            <li class="active"><a href="#portlet_tab1" data-toggle="tab">1 Star</a></li>
                                        </ul>
                                        <div class="tab-content no-more-tables">
                                            <div class="tab-pane active" id="portlet_tab1">
                                                <h2>1 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Beginner
                                                </p>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/1star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
                                                            <p class="questDesc">
                                                                The purpose of this assignment is getting practical experience of requirement analysis, 
                                                                database design, and implementing database system in MS SQL Server 2005. In this 
                                                                assignment, you are going to design a simple database system for Xiaoshan International 
                                                                Airport. You can find more detail in the following specification. Besides the database 
                                                                design, you also must to answer some questions.
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only green disabled"><span>Submitted</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only red disabled"><span>Locked</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit .</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="space5"></div>           
                                            </div>




                                            <div class="tab-pane " id="portlet_tab2">
                                                <h2>2 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Intermediate
                                                </p>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
                                                            <p>Some description of quest here.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit .</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="space5"></div>                                               
                                            </div>


                                            <div class="tab-pane " id="portlet_tab3">
                                                <h2>3 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Advanced
                                                </p>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/3stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
                                                            <p>Some description of quest here.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2stars.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Metronic - Responsive Template</h4>
                                                            <p>Lorem ipsum dolor sit consectetuer adipiscing elit .</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span>Database +3</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +100</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>View</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="space5"></div>
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
        <%@include file="/WEB-INF/jspf/footer.jspf" %>   

        <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
        <%-- Standard JS imports for every page--%>
        <%@include file="/WEB-INF/jspf/javascripts.jspf" %>
        <script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
        <script src="assets/scripts/search.js"></script>      
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                Search.init();
                //$('#footable').footable();
                TableManaged.init();
                setActivePage("link-quests");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>