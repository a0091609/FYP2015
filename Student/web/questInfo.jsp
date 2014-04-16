<%@page import="entity.Pet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Insert Quest Title Here></title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
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
                                Insert Quest Title Here
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
                                    <a href="#">Quests</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Quest Info</a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->


                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">                        
                        <div class="span6">
                            <object data="assets/quests/Assignment_1.pdf" type="application/pdf" width="100%" height="580px">
                                <p>It appears you don't have a PDF plugin for this browser.
                                    No biggie... you can <a href="assets/quests/Assignment_1.pdf">click here to download the PDF file.</a></p>
                            </object>
                        </div>
                        <div class="span6">
                            <h3>Quest Info</h3>
                            <p><b>Quest Title: </b> Hello</p>
                            <p><b>Difficulty: </b> 1 Star</p>
                            <p><b>Deadline: </b> 16/4/2014</p>
                            <p><b>Gold Reward: </b> +100 Gold</p>
                            <p><b>Skill Gain: </b> +3 Database</p>
                            <p><b>Quest Description: </b><br>
                                The purpose of this assignment is getting practical experience of requirement analysis, 
                                database design, and implementing database system in MS SQL Server 2005. In this 
                                assignment, you are going to design a simple database system for Xiaoshan International 
                                Airport. You can find more detail in the following specification. Besides the database 
                                design, you also must to answer some questions.
                            </p>
                            <button class="btn" onclick="history.back(-1)">Back</button> &nbsp;&nbsp;
                            <a data-toggle="modal" href="#responsive"><button class="btn red">Submit <i class="m-icon-swapright m-icon-white"></i></button></a>
                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->





                    <!-- MODAL WINDOW -->
                    <div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h3>Quest Submission</h3>
                        </div>
                        <div class="modal-body">
                            <div class="row-fluid">
                                <div class="span3">
                                    <img src="assets/img/1star.png" style="width:100%">
                                </div>
                                <div class="span9">
                                    <h4>File Upload</h4>
                                    <p>Please select and upload your completed assignment.</p>
                                    <p><input type="file" class="span12 m-wrap"></p>
                                </div>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn">Close</button>
                            <button type="button" class="btn red">Submit</button>
                        </div>
                    </div>






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
                setActivePage("link-quests");
                TableManaged.init();

            <%
                ArrayList serverMsg = (ArrayList) request.getAttribute("serverMsg");
                if (serverMsg != null)
                {
                    //Print all the server messages
                    for (Object o : serverMsg)
                    {
                        String msg = (String) o;
            %>
                $.gritter.add({
                    title: 'GLMS',
                    text: '<%=msg%>'
                });
            <%
                    }
                }
            %>


            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>