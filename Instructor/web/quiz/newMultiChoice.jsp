<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | New Question</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
        <link rel="stylesheet" type="text/css" href="/Instructor/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" type="text/css" href="/Instructor/assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.css"/>
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
                                New Question for <%= session.getAttribute("quizName")%>
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%= session.getAttribute("moduleName")%></a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%= session.getAttribute("quizName")%></a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    New Question
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <form class="horizontal-form" method="post" action="/Instructor/QuestionServlet?action=saveNewMultiChoice&quizId=<%= session.getAttribute("quizId")%>">
                                <div class="row-fluid margin-bottom-15">
                                    <div class="span12">
                                        <input type="text" class="m-wrap span12" name="questName" placeholder="Give a name for your question..." required>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span12">
                                        <textarea class="span12 wysihtml5 m-wrap" rows="6" name="questText" placeholder="Please type your full question here..." required></textarea>
                                    </div>
                                </div>

                                <div class="row-fluid">
                                    <div class="span12">
                                        <div class="control-group">
                                            <label class="control-label">Students may need some help:</label>
                                            <div class="controls">
                                                <input type="text" class="m-wrap span12" name="answerHint" placeholder="Please type your hints here..." required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-fluid">
                                    <div class="span3">
                                        <input type="text" class="m-wrap span12" name="option1" placeholder="Option 1" required>
                                    </div>
                                    <div class="span3">
                                        <input type="text" class="m-wrap span12" name="option2" placeholder="Option 2" required>
                                    </div>
                                    <div class="span3">
                                        <input type="text" class="m-wrap span12" name="option3" placeholder="Option 3" required>
                                    </div>
                                    <div class="span3">
                                        <input type="text" class="m-wrap span12" name="option4" placeholder="Option 4" required>
                                    </div>
                                </div>
                                <br>
                                <div class="row-fluid margin-bottom-15">
                                    <div class="span3">
                                        <div class="control-group">
                                            <label class="control-label">Answer</label>
                                            <div class="controls">
                                                <select class="m-wrap span12" name="answer" required>
                                                    <option value="" disabled></option>
                                                    <option value="0">Option 1</option>
                                                    <option value="1">Option 2</option>
                                                    <option value="2">Option 3</option>
                                                    <option value="3">Option 4</option>
                                                </select>
                                                <span class="help-block">Select correct answer.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="next" value="+ Add question" class="btn blue">
                                <input type="submit" name="next" value="Next: Quiz settings" class="btn green">
                                <button id="confirm_opener" class="btn red">Cancel</button>
                            </form>

                            <div id="dialog_confirm" title="Are you sure you want to leave this page?" class="hide">
                                <p><span class="icon icon-warning-sign"></span>
                                    Please note that your questions won't be saved.
                                </p>
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
        <script type="text/javascript" src="/Instructor/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
        <script type="text/javascript" src="/Instructor/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                if (!jQuery().wysihtml5) {
                    return;
                }

                if ($('.wysihtml5').size() > 0) {
                    $('.wysihtml5').wysihtml5({
                        "stylesheets": ["/Instructor/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
                    });
                }

                //confirm dialog
                $("#dialog_confirm").dialog({
                    dialogClass: 'ui-dialog-green',
                    autoOpen: false,
                    resizable: false,
                    height: 210,
                    modal: true,
                    buttons: [
                        {
                            'class': 'btn red',
                            "text": "Exit",
                            click: function() {
                                window.location.href="/Instructor/QuizServlet?action=viewAllQuiz"; 
                            }
                        },
                        {
                            'class': 'btn',
                            "text": "Cancel",
                            click: function() {
                                $(this).dialog("close");
                            }
                        }
                    ]
                });

                $("#confirm_opener").click(function() {
                    $("#dialog_confirm").dialog("open");
                    $('.ui-dialog button').blur();// avoid button autofocus
                });
            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>