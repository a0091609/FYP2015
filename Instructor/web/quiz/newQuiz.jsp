<%-- 
    Document   : newQuiz
    Created on : Feb 2, 2014, 3:43:47 PM
    Author     : Chih Yong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Quiz for <%= request.getParameter("moduleName") %></h1>
        
        Let's give the quiz a name:
        <form action="QuizServlet?action=saveNewQuiz&moduleId=<%= request.getParameter("moduleId") %>" method="post">
            <input type="text" name="quizName"><br>
            <input type="submit" value="Go">
        </form>
    </body>
</html>
