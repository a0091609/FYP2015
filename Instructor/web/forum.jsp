<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Items Management</title>
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
            <%@include file="/WEB-INF/jspf/sideBar.jspf" %> 
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
                                    <a href="index.jsp">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Items">Quests</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Choose a Quest</a>
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
<br>
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Topic</th>
                                                            <th>Closing Date</th>
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gradeX">
                                                            <td data-title="Name">What's that sequel!</td>
                                                            <td data-title="Description">Basic questions on SQL</td>
                                                            <td data-title="lala">Databases</td>
                                                            <td data-title="Bonus">30-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    <tr class="gradeX">
                                                            <td data-title="Name">Web Wiz Induction</td>
                                                            <td data-title="Description">Learn the basics of HTML and CSS</td>
                                                            <td data-title="lala">Web Basics</td>
                                                            <td data-title="Bonus">20-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    <tr class="gradeX">
                                                            <td data-title="Name">Who wants to be a millionaire</td>
                                                            <td data-title="Description">Introduction to marketing and business models</td>
                                                            <td data-title="lala">Marketing</td>
                                                            <td data-title="Bonus">14-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green" data-toggle="modal" href="#newPetForm"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                

                                            </div>
                                            <div class="tab-pane " id="portlet_tab2">
                                                <h2>2 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Intermediate
                                                </p>
                                                <div class="actions">
                                                    <a class="btn blue" data-toggle="modal" href="#newPetForm"><i class="icon-plus"></i> Info</a>
                                                </div><br>

                                                <!-- Modal Form for new Pet -->
                                                <div id="newPetForm" class="modal hide fade" tabindex="-1" data-width="760">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h3>2 Star Marketing</h3>
                                                    </div>
                                                    <form action="Items?action=createPet" method="post" class="form-horizontal" id="petForm">
                                                        <div class="modal-body">
                                                            <div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
                                                                <div class="row-fluid">
                                                                    <div class="span12">
                                                                        <p>Quest Name: Who wants to be a millionaire</p>
                                                                        <p>Description: Introduction to marketing and business models</p>
                                                                        <p>Gold Rewards: 100 Gold</p>
                                                                        <p>Skill Rewards: 10SP (Marketing)</p>
                                                                        <br><br>                                                                        
                                                                        <p>Click on NEXT to download the assignment.</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" data-dismiss="modal" class="btn">Close</button>
                                                            <input type="submit" value="Next" class="btn blue">
                                                        </div>
                                                    </form>
                                                </div>

                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_2">
                                                    <thead class="cf">
                                                        
                                                            <tr>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Topic</th>
                                                            <th>Closing Date</th>
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                          
                                                      
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gradeX">
                                                            <td data-title="Name">What's that sequel!</td>
                                                            <td data-title="Description">Basic questions on SQL</td>
                                                            <td data-title="lala">Databases</td>
                                                            <td data-title="Bonus">30-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    <tr class="gradeX">
                                                            <td data-title="Name">Web Wiz Induction</td>
                                                            <td data-title="Description">Learn the basics of HTML and CSS</td>
                                                            <td data-title="lala">Web Basics</td>
                                                            <td data-title="Bonus">20-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    <tr class="gradeX">
                                                            <td data-title="Name">Who wants to be a millionaire</td>
                                                            <td data-title="Description">Introduction to marketing and business models</td>
                                                            <td data-title="lala">Marketing</td>
                                                            <td data-title="Bonus">14-04-2014</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn green" data-toggle="modal" href="#newPetForm"><i class="icon-eye-open"></i> View</a></center></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab3">
                                                <h2>Keys</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis eu turpis nec tempus. Sed aliquam fringilla tellus et fringilla. Fusce sed vehicula eros, ut iaculis risus. Quisque auctor nibh quis ligula tincidunt, non aliquet ligula laoreet. Nunc ante dui, condimentum nec purus ac, aliquet tempor augue. Nullam egestas lacus sit amet turpis mollis, sed dictum nisl laoreet. Aliquam tempus bibendum ligula vitae tempus. Nulla tristique viverra metus et feugiat. Quisque augue mauris, consequat et diam et, posuere lobortis enim.
                                                </p>
                                                <div class="actions">
                                                    <a class="btn blue" data-toggle="modal" href="#newQuiz-form"><i class="icon-plus"></i> New Key</a>
                                                </div><br>
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_1">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>Image</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Cost</th>
                                                            <th>Bonus</th>                                                            
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gradeX">
                                                            <td data-title="Image"><img class="smallTableImg"></td>
                                                            <td data-title="Name">Pikachu</td>
                                                            <td data-title="Description">A cute electric mouse. It zaps!</td>
                                                            <td data-title="Cost">500</td>
                                                            <td data-title="Bonus">5</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn red"><i class="icon-trash"></i> Delete</a></center></td>
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