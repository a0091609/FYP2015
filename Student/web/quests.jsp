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
                                                <%
                                                    ArrayList completed = (ArrayList) request.getAttribute("questsCompleted");
                                                    ArrayList oneStar = (ArrayList) request.getAttribute("oneStar");

                                                    //Print all the Pets
                                                    for (Object o : oneStar)
                                                    {
                                                        Quest q = (Quest) o;
                                                        String name = q.getName();
                                                        String description = q.getDescription();
                                                        Integer goldReward = q.getGoldReward();
                                                        String skill = q.getSkillReward().getName();
                                                        Integer sp = q.getSkillReward().getSkillPoints();
                                                        String view = "Quests?action=openQuest&questId=" + q.getId();
                                                        String style;
                                                        String button;

                                                        if (completed.contains(q))
                                                        {
                                                            style = "btn bigicn-only green disabled";
                                                            button = "Submitted";
                                                            view = "#";
                                                        }
                                                        else
                                                        {
                                                            style = "btn bigicn-only";
                                                            button = "View";
                                                        }
                                                %>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/1star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4><%=name%></h4>
                                                            <p class="questDesc">
                                                                <%=description%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span><%=skill%> +<%=sp%></span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +<%=goldReward%></span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="<%=view%>" class="<%=style%>"><span><%=button%></span></a>                        
                                                    </div>
                                                </div>
                                                <%  //Done printing
                                                    }
                                                %>
                                                <div class="space5"></div>           
                                            </div>




                                            <div class="tab-pane " id="portlet_tab2">
                                                <h2>2 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Intermediate
                                                </p>
                                                <%
                                                    ArrayList keys = (ArrayList) request.getAttribute("keys");
                                                    ArrayList twoStar = (ArrayList) request.getAttribute("twoStar");

                                                    //Print all the Pets
                                                    for (Object o : twoStar)
                                                    {
                                                        Quest q = (Quest) o;
                                                        String name = q.getName();
                                                        String description = q.getDescription();
                                                        Integer goldReward = q.getGoldReward();
                                                        String skill = q.getSkillReward().getName();
                                                        Integer sp = q.getSkillReward().getSkillPoints();
                                                        String view = "Quests?action=openQuest&questId=" + q.getId();
                                                        String style;
                                                        String button;

                                                        if (!keys.contains(q.getKeyRequired()))
                                                        {
                                                            style = "btn bigicn-only red disabled";
                                                            button = "Locked";
                                                            view = "#";
                                                        }
                                                        else if (completed.contains(q))
                                                        {
                                                            style = "btn bigicn-only green disabled";
                                                            button = "Submitted";
                                                            view = "#";
                                                        }
                                                        else
                                                        {
                                                            style = "btn bigicn-only";
                                                            button = "View";
                                                        }
                                                %>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4><%=name%></h4>
                                                            <p class="questDesc">
                                                                <%=description%>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span><%=skill%> +<%=sp%></span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +<%=goldReward%></span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="<%=view%>" class="<%=style%>"><span><%=button%></span></a>                        
                                                    </div>
                                                </div>
                                                <%  //Done printing
                                                    }
                                                %>



                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/2star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/2star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/2star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/2star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <a href="#" class="btn bigicn-only red disabled"><span>Locked</span></a>                        
                                                    </div>
                                                </div>
                                                <div class="space5"></div>                                               
                                            </div>





                                            <div class="tab-pane " id="portlet_tab3">
                                                <h2>3 Star Quests</h2>
                                                <p>
                                                    Difficulty Level: Advanced
                                                </p>
                                                <%
                                                    ArrayList threeStar = (ArrayList) request.getAttribute("threeStar");

                                                    //Print all the Pets
                                                    for (Object o : threeStar)
                                                    {
                                                        Quest q = (Quest) o;
                                                        String name = q.getName();
                                                        String description = q.getDescription();
                                                        Integer goldReward = q.getGoldReward();
                                                        String skill = q.getSkillReward().getName();
                                                        Integer sp = q.getSkillReward().getSkillPoints();
                                                        String view = "Quests?action=openQuest&questId=" + q.getId();
                                                        String style;
                                                        String button;

                                                        if (!keys.contains(q.getKeyRequired()))
                                                        {
                                                            style = "btn bigicn-only red disabled";
                                                            button = "Locked";
                                                            view = "#";
                                                        }
                                                        else if (completed.contains(q))
                                                        {
                                                            style = "btn bigicn-only green disabled";
                                                            button = "Submitted";
                                                            view = "#";
                                                        }
                                                        else
                                                        {
                                                            style = "btn bigicn-only";
                                                            button = "View";
                                                        }
                                                %>
                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/3star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4><%=name%></h4>
                                                            <p class="questDesc">
                                                                <%=description%>
                                                            </p> 
                                                        </div>
                                                    </div>
                                                    <div class="span5">
                                                        <div class="portfolio-info">
                                                            Skill Gain
                                                            <span><%=skill%> +<%=sp%></span>
                                                        </div>
                                                        <div class="portfolio-info">
                                                            Gold Reward
                                                            <span>Gold +<%=goldReward%></span>
                                                        </div>
                                                    </div>
                                                    <div class="span2 portfolio-btn">
                                                        <a href="<%=view%>" class="<%=style%>"><span><%=button%></span></a>                        
                                                    </div>
                                                </div>
                                                <%  //Done printing
                                                    }
                                                %>




                                                <div class="row-fluid portfolio-block">
                                                    <div class="span5 portfolio-text">
                                                        <img src="assets/img/3star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/3star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/3star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <img src="assets/img/3star.png" style="width:80px">
                                                        <div class="portfolio-text-info">
                                                            <h4>Quest Name</h4>
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
                                                        <a href="#" class="btn bigicn-only red disabled"><span>Locked</span></a>                        
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

                    <%
                        //This part is for showing the submission msg
                        Boolean submission = (Boolean) request.getAttribute("submission");
                        if (submission != null)
                        {
                            Integer golds = (Integer) request.getAttribute("gold");
                            Skill skill = (Skill) request.getAttribute("skill");
                            String skillType = skill.getName();
                            Integer sp = skill.getSkillPoints();
                    %>
                    <!-- MODAL WINDOW -->
                    <div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h3>Quest Submitted</h3>
                        </div>
                        <div class="modal-body">
                            <div class="row-fluid">
                                <div class="span12">
                                    <center><h1>OUTSTANDING!</h1></center>
                                </div>
                                <br><br>
                            </div><div class="row-fluid"><br></div>
                            <div class="row-fluid">
                                <div class="span4">
                                    <img src="assets/img/winner.png" style="width:100%">
                                </div>
                                <div class="span8">
                                    <h4>Your quest has been submitted</h4>
                                    <p>You have earned the following rewards: </p>
                                    <p><b>Gold Reward: </b> +<%=golds%> Gold</p>
                                    <p><b>Skill Gain: </b> +<%=sp%> <%=skillType%></p>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn">Close</button>
                        </div>
                    </div>
                    <%
                        }
                    %>

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
                $('#responsive').modal('show');
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>