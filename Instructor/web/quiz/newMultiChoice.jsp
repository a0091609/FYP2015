<%-- 
    Document   : newMultiChoice
    Created on : Feb 2, 2014, 5:57:12 PM
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
        <%= request.getAttribute("quizId")%>
        <%= request.getAttribute("quizName")%>

        <form>
            <input type="text" name="questionName" placeholder="Give a name for your question..."><br>
            <input type="text" name="questionText" placeholder="Please type your full question here..."><br>
            
            <input type="text" name="answer1" placeholder="Answer 1"><br>
            <input type="text" name="answer2" placeholder="Answer 2"><br>
            <input type="text" name="answer3" placeholder="Answer 3"><br>
            <input type="text" name="answer4" placeholder="Answer 4"><br>
            <input type="text" name="answer5" placeholder="Answer 5"><br>
            
            <input type="submit" value="Add more question">
        </form>
    </body>
</html>
