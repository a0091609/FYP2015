<%-- 
    Document   : workspace
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
                    populateUsername();
                    populateModule();
                }
            });
        </script>
    </head>
    <body>
        <h2>myIVLE</h2>
        <b>Welcome <span id="lbl_Name"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span></b>
        <br /><br />
        Modules you are taking this semester<br />
        <span id="lbl_Modules"><img src="http://ivle.nus.edu.sg/images/spinner.gif" alt=""/></span>

        <hr />
        
        <h3>Trace</h3>
        <div>Get UserName<br />
            <span id="dbg_UserInfo"></span>
        </div>
        
        <br />
        
        <div>Get Module Info<br />
            <span id="dbg_Modules"></span>
        </div>
    </body>
</html>
