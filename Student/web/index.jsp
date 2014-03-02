<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("token") == null) {
        String APIKEY = "wslHwY4vC8n7cDdR2I8pV";
        String API_DOMAIN = "https://ivle.nus.edu.sg/";
        String API_URL = API_DOMAIN + "api/lapi.svc/";
        String LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY + "&url=http%3A%2F%2Flocalhost%3A8080%2FStudent%2FAuthServlet";
        response.sendRedirect(LOGIN_URL);
    }
    else
    {
        response.sendRedirect("dashboard.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta HTTP-EQUIV="REFRESH" content="0; url=login.jsp">
        <title>GLMS</title>
    </head>
    <body>

        This page is used to check login status. 
        If user is logged in, redirect to dashboard.
        Otherwise, redirect to login page.

    </body>
</html>
