<%@page import="java.util.ArrayList, helper.QuestionDetails" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Quiz Time</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="/Student/assets/plugins/select2/select2_metro.css" />
        <link rel="stylesheet" type="text/css" href="/Student/assets/plugins/chosen-bootstrap/chosen/chosen.css" />

        <style>
            .nohover:hover{
                border-color: #555555 !important;
                cursor: default;
            }
        </style>
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
                                Quiz
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="/Student/dashboard.jsp">Dashboard</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <%= session.getAttribute("moduleName")%>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    Quiz
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->

                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <%
                                ArrayList quests = (ArrayList) request.getAttribute("questions");
                                int questNum = quests.size(), j;

                            %>
                            <div class="portlet box blue" id="form_wizard_1">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span class="step-title">Question 1 of <%=questNum%></span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn red tooltips" data-placement="bottom" data-original-title="Correct Streak"><i class="icon-fire"></i> <span id="streakCount"><%=request.getAttribute("streak")%></span></div>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="form-wizard">
                                        <div class="navbar steps" style="margin-bottom:5px;">
                                            <div class="navbar-inner">
                                                <ul class="row-fluid">
                                                    <!--for loop here-->
                                                    <%
                                                        j = 1;
                                                        for (int i = 0; i < questNum; i++, j++) {
                                                            out.print("<li class='span" + (12 / questNum) + "'>"
                                                                    + "<a href='#tab" + j + "' data-toggle='tab' class='step'>"
                                                                    + "<span class='number'>" + j + "</span>"
                                                                    + "</a>"
                                                                    + "</li>");
                                                        }
                                                    %>
                                                </ul>
                                            </div>
                                        </div>
                                        <div id="bar" class="progress progress-success progress-striped">
                                            <div class="bar"></div>
                                        </div>
                                        <div class="tab-content">
                                            <!--loop start-->
                                            <%
                                                j = 1;
                                                for (Object o : quests) {
                                                    QuestionDetails quest = (QuestionDetails) o;
                                            %>
                                            <div class="tab-pane <%=(j == 1) ? "active" : ""%>" id="tab<%=j%>">
                                                <div class="row-fluid margin-bottom-5">
                                                    <div class="span12" style="font-size:18px;">
                                                        <!--Question Text-->
                                                        <%=quest.getQuestionText()%>
                                                    </div>
                                                </div>
                                                <div class="row-fluid margin-bottom-10">
                                                    <div class="span12" id="hint<%=j%>">
                                                        <!--Question Hint-->
                                                    </div>
                                                </div>

                                                <!--Start of Answer options-->
                                                <div id="results<%=j%>">
                                                    <form id="quest<%=j%>" name="<%=j%>" method="post" action="/Student/QuizServlet?action=checkAnswer">
                                                        <input type="hidden" name="questId" id="questId" value="<%=quest.getQuestionId()%>">
                                                        <div class="row-fluid">
                                                            <div class="span8 control-group">
                                                                <label class="control-label">Choose an answer:</label>
                                                                <div class="row-fluid">
                                                                    <div class="span6 margin-bottom-15" style="background-color: #d9edf7;">
                                                                        <!--Answer A-->
                                                                        <label class="radio">
                                                                            <input type="radio" name="option" id="option" value="<%=quest.getOptions().get(0)%>" required>
                                                                            <%=quest.getOptions().get(0)%>
                                                                        </label>
                                                                    </div>
                                                                    <div class="span6 margin-bottom-15" style="background-color: #d9edf7;">
                                                                        <!--Answer B-->
                                                                        <label class="radio">
                                                                            <input type="radio" name="option" id="option" value="<%=quest.getOptions().get(1)%>">
                                                                            <%=quest.getOptions().get(1)%>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="row-fluid">
                                                                    <div class="span6 margin-bottom-15" style="background-color: #d9edf7;">
                                                                        <!--Answer C-->
                                                                        <label class="radio">
                                                                            <input type="radio" name="option" id="option" value="<%=quest.getOptions().get(2)%>">
                                                                            <%=quest.getOptions().get(2)%>
                                                                        </label>
                                                                    </div>
                                                                    <div class="span6 margin-bottom-15" style="background-color: #d9edf7;">
                                                                        <!--Answer D-->
                                                                        <label class="radio">
                                                                            <input type="radio" name="option" id="option" value="<%=quest.getOptions().get(3)%>">
                                                                            <%=quest.getOptions().get(3)%>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="span4">

                                                                <!--Fun Quiz Items-->
                                                                <div class="tiles">
                                                                    <%
                                                                        String ahelpClass = "tile bg-yellow hint";
                                                                        String afiftyClass = "tile bg-yellow hint";
                                                                        String itemHelp = request.getAttribute("itemHelp").toString();
                                                                        String itemFifty = request.getAttribute("itemFifty").toString();
                                                                        if (itemHelp.equals("0")) {
                                                                            ahelpClass = "tile bg-grey hint nohover";
                                                                        }
                                                                        if (itemFifty.equals("0")) {
                                                                            afiftyClass = "tile bg-grey hint nohover";
                                                                        }
                                                                    %>
                                                                    <a href="#" id="<%=quest.getQuestionId() + " " + j%>" class="<%=ahelpClass%>">
                                                                        <div class="tile-body">
                                                                            <i class="icon-info-sign"></i>
                                                                        </div>
                                                                        <div class="tile-object">
                                                                            <div class="name">
                                                                                Get Help
                                                                            </div>
                                                                            <div class="number" id="itemHelp">                           
                                                                                <%=request.getAttribute("itemHelp")%>
                                                                            </div>
                                                                        </div>          
                                                                    </a>
                                                                </div>
                                                                <div class="tiles">
                                                                    <a href="#" id="<%=quest.getQuestionId() + " " + j%> " class="<%=afiftyClass%>">
                                                                        <div class="tile-body">
                                                                            <i class="icon-random"></i>
                                                                        </div>
                                                                        <div class="tile-object">
                                                                            <div class="name">                           
                                                                                Fifty-Fifty
                                                                            </div>
                                                                            <div class="number" id="itemFifty">
                                                                                <%=request.getAttribute("itemFifty")%>
                                                                            </div>

                                                                        </div>          
                                                                    </a>
                                                                </div>
                                                                <!--End of Fun Quiz Items-->
                                                            </div>
                                                        </div>
                                                        <div class="row-fluid margin-bottom-25 text-center">
                                                            <input type="submit" name="" value="Submit" class="btn green">
                                                        </div>
                                                    </form>
                                                    <!--End of Answer Options-->
                                                </div>
                                            </div>
                                            <%
                                                    j++;
                                                }
                                            %>
                                            <!--loop end-->
                                        </div>


                                        <div class="form-actions clearfix">
                                            <a href="javascript:;" class="btn button-previous">
                                                <i class="m-icon-swapleft"></i> Back 
                                            </a>
                                            <a href="javascript:;" class="btn blue button-next">
                                                Next <i class="m-icon-swapright m-icon-white"></i>
                                            </a>
                                            <a href="/Student/QuizServlet?action=finishQuiz" class="btn green button-finish" style="display:none;">
                                                Finish <i class="m-icon-swapright m-icon-white"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
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
        <script type="text/javascript" src="/Student/assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script type="text/javascript" src="/Student/assets/plugins/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="/Student/assets/plugins/select2/select2.min.js"></script>
        <script src="/Student/assets/js/doQuiz-custom.js"></script>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                FormWizard.init();

                // Ajax post to check answer
                $("form").each(function() {
                    $(this).submit(function(event) {
                        event.preventDefault();

                        var form = $(this);
                        var url = $(this).attr('action');
                        var posting = $.post(url, {questId: $('#questId').val(), option: $('#option:checked').val()});

                        posting.done(function(data) {
                            var isCorrect = data.isCorrect;
                            var correctAns = data.correctAns;
                            var pts = data.pts;

                            var status = '', color = '', display = '';
                            if (isCorrect) {
                                status = '<h2>Correct! =)</h2>';
                                color = '#1d943b';
                                display = '<h4>' + pts + ' points for you!</h4><br>'
                            }
                            else {
                                status = '<h2>Wrong!</h2><h3>You lost your Correct Streak =(</h3>';
                                color = '#bb2413';
                                display = '<h4>"' + correctAns + '"</h4> was correct.<br>';
                            }

                            var content = '';
                            content += '<div class="span12 text-center margin-bottom-25" style="color: #FFFFFF; background-color: ' + color + '">\
                                     ' + status + '<br>\
                                     <p>' + display + '<p>';
                            content += '<div>';

                            var id = 'results' + form.attr('name');
                            $('#' + id).empty().append(content);
                            $('#streakCount').html(data.streak);
                        });
                    });
                });

                $('a.hint').click(function() {
                    var values = this.id.split(" ");
                    var qId = values[0];
                    var qId2 = values[1];

                    //disable
                    $(this).removeClass('bg-yellow').addClass('bg-grey nohover');

                    //TODO: need to check if enough items
                    var getHintsUrl = "/Student/QuizServlet?action=useHints&qId=" + qId;
                    $.get(getHintsUrl, function(data) {
                        if (data === '') {
                            return false;
                        } else
                        {
                            var content = '<div class="alert alert-success"><i class="icon-info-sign"></i> ' + data + '</div>';
                            $('#hint' + qId2).html(content);

                            // get new item qty
                            var getItemQtyUrl = "/Student/QuizServlet?action=getItemQty&itemName=GetHelp";
                            $.get(getItemQtyUrl, function(data) {
                                $('#itemHelp').html(data);
                            });

                            return false;
                        }
                    });


                });

                $('.fifty').click(function() {
                    var values = this.id.split(" ");
                    var qId = values[0];
                    var qId2 = values[1];

                    //TODO: need to check if enough items
                    var useFiftyUrl = "/Student/QuizServlet?action=useFifty&qId=" + qId;

                    return false;
                });
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>