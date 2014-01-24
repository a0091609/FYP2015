<%-- 
    Document   : workspace
    Created on : Jan 22, 2014, 2:51:42 AM
    Author     : Chih Yong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor</title>
        <%@include file = "/WEB-INF/header.jspf" %>
        <script>
            $(document).ready(function() {
                if (TOKEN.length < 1) {
                    window.location = LOGIN_URL;
                }
                else {
                    displayUsername();
                    displayProfile();
                    displayModule();
                }
            });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
