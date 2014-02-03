<%-- 
    Document   : newQuestion
    Created on : Feb 2, 2014, 5:17:10 PM
    Author     : Chih Yong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function displayQuestionFormat() {
                var option = document.getElementById("questionOpt").value;

                if (option === "multiChoice") {
                    window.location = "/Instructor/QuestionServlet?action=createMultiChoice";
                }
                else if (option === "shortAnswer") {
                    showShortAns();
                }
            }
        </script>
    </head>
    <body>
        Create New Question
        <br>
        <%= request.getAttribute("quizId")%>
        <%= request.getAttribute("quizName")%>
        <select id="questionOpt" onchange="displayQuestionFormat()">
            <option value="multiChoice">Multiple Choice</option>
            <option value="shortAnswer">Short Answer</option>
        </select>
    </body>
</html>
