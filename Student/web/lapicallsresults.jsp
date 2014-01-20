<%-- 
    Document   : lapicallsresults
    Author     : Chih Yong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h2>LAPI Calls Results</h2>
        <b>Welcome</b>

        <br /><br />

        Modules you are taking this semester<br />

        <span id="lbl_Modules"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>

        <br />

        <div>Get Username<br />
            <span id="userInfo"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>
        </div>

        <br />

        <div>Get Profile<br />
            <span id="profile"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>
        </div>

        <br />

        <div>Get Module Info<br />
            <span id="modules"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>
        </div>
    </body>
</html>
