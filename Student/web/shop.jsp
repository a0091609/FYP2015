<%@page import="entity.Skill"%>
<%@page import="entity.Quest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Shop</title>
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
                                Item Shop
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
                                    <a href="#">Shop</a>
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
                            <div class="portlet box blue tabbable">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-dollar"></i>
                                        <span class="hidden-480">Current Balance: 999</span>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="tabbable portlet-tabs">
                                        <ul class="nav nav-tabs">
                                            <li><a href="#portlet_tab3" data-toggle="tab">Booster Packs</a></li>
                                            <li><a href="#portlet_tab2" data-toggle="tab">Keys</a></li>
                                            <li class="active"><a href="#portlet_tab1" data-toggle="tab">Style Items</a></li>
                                        </ul>
                                        <div class="tab-content no-more-tables">
                                            <div class="tab-pane active" id="portlet_tab1">
                                                <h2>Style Items</h2>
                                                <p>
                                                    Special items used to enhance the look of your profile avatar.
                                                </p>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/vest.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Black Hooded Vest</h4>
                                                            <p>A trendy black hooded vest.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Top</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>250 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/jeans.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Blue Jeans</h4>
                                                            <p>A pair of casual faded blue jeans.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Bottom</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>250 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/shoe.png" style="width:80px;padding-top:20px;">
                                                        <div class="portfolio-text-info">
                                                            <h4>Soccer Cleats</h4>
                                                            <p>A new pair of branded soccer shoes.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Shoe</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>250 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/spikey.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Spikey Red</h4>
                                                            <p>A spikey haircut in striking red color.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Hairstyle</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>250 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/hat.png" style="width:80px;padding-top:20px;">
                                                        <div class="portfolio-text-info">
                                                            <h4>Baseball Cap</h4>
                                                            <p>A sporty baseball cap for sporty people.</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Accessory</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>250 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="space5"></div>           
                                            </div>




                                            <div class="tab-pane " id="portlet_tab2">
                                                <h2>Keys</h2>
                                                <p>
                                                    Powerful items used to unlock higher difficulty quests.
                                                </p>

                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/key2.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Item Name</h4>
                                                            <p>Item description</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Item Type
                                                            <span>Quest Key</span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Cost
                                                            <span>100 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>

                                                <div class="space5"></div>                                               
                                            </div>





                                            <div class="tab-pane " id="portlet_tab3">
                                                <h2>Booster Packs</h2>
                                                <p>
                                                    Items to boost your skills! Buy these items to upgrade your knowledge.
                                                </p>

                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/book.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Database Booster</h4>
                                                            <p>Extra revision materials for the topic on databases</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Materials</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>300 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/book.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Web Dev Booster</h4>
                                                            <p>Additional tools and resources for web development</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Materials</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>300 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/book.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>IT Security</h4>
                                                            <p>Supplementary readings on cryptography</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Materials</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>300 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/Ticket2.PNG" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Consult a Pro</h4>
                                                            <p>Book a consultation session with TA</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Invitation</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>500 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/Ticket2.PNG" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Consult the Master</h4>
                                                            <p>Book a consultation session with the Professor</p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info span6">
                                                            Item Type
                                                            <span>Invitation</span>
                                                        </div>
                                                        <div class="portfolio-info span6">
                                                            Cost
                                                            <span>1000 Gold</span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="#" class="btn bigicn-only"><span>Buy Now</span></a>                        
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
                setActivePage("link-store");
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>