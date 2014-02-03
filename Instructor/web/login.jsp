<%-- 
    Document   : login
    Created on : Jan 27, 2014, 3:31:39 AM
    Author     : Chih Yong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
        <script>
            var APIKEY = "wslHwY4vC8n7cDdR2I8pV";
            var API_DOMAIN = "https://ivle.nus.edu.sg/";
            var API_URL = API_DOMAIN + "api/lapi.svc/";
            var LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY;
            //+ "&url=http%3A%2F%2Flocalhost%3A8080%2FInstructor%2Fworkspace.jsp";

            $(function() {
                $('form').on('submit', function(e) {
                    $.ajax({
                        type: 'post',
                        url: LOGIN_URL,
                        headers: {
                            "Access-Control-Request-Method": "POST",
                            "Access-Control-Request-Headers": "Access-Control-Allow-Origin:https://localhost:8181"
                        },
                        data: $('form').serialize(),
                        crossDomain: true,
                        xhrFields: {
                            withCredentials: true
                        }
                    })
                            .done(function(data) {
                                console.log(data);
                                console.log("done");
                            })
                            .fail(function(xhr, textStatus, errorThrown) {
                                alert(xhr.responseText);
                                alert(textStatus);
                            });
                    e.preventDefault();
                });
            });
        </script>
    </head>
    <body>
        <form>
            <input type="text" name="userid" placeholder="User ID" ><br>
            <input type="password" name="password" placeholder="Password" ><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
