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
                    //lapicalls.js
                    displayUsername();
                    displayProfile();
                    displayModule();
                }
            });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <b>Welcome</b>

        <br /><br />

        Your modules for this semester<br />

        <span id="modules"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>

        <br />

        <div>Get Username<br />
            <span id="userInfo"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>
        </div>

        <br />

        <div>Get Profile<br />
            <span id="profile"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>
        </div>
    </body>
</html>
