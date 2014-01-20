var APIKEY = "wslHwY4vC8n7cDdR2I8pV";
var API_DOMAIN = "https://ivle.nus.edu.sg/";
var API_URL = API_DOMAIN + "api/lapi.svc/";
var LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY + "&url=http%3A%2F%2Flocalhost%3A8080%2FStudent%2Flapicallsresults.jsp";

//variable to store the Authentication Token
var TOKEN = "";

var myModuleInfo = null;

//function to get the query string parameters
var search = function() {
    var p = window.location.search.substr(1).split(/\&/), l = p.length, kv, r = {};

    while (l--) {
        kv = p[l].split(/\=/);
        r[kv[0]] = kv[1] || true; //if no value just set it as true
    }
    return r;
}();

//check query string for search token
if (search.token && search.token.length > 0 && search.token !== 'undefined') {
    TOKEN = search.token;
}

function displayUsername() {
    var usernameUrl = API_URL + "UserName_Get?output=json&callback=?&APIKey=" + APIKEY + "&Token=" + TOKEN;

    jQuery.getJSON(usernameUrl, function(data) {
        $('#userInfo').html("<span>Response: " + data + "</span>");
    });
}

function displayModule() {
    var moduleUrl = API_URL + "Modules?APIKey=" + APIKEY + "&AuthToken=" + TOKEN + "&Duration=1&IncludeAllInfo=false&output=json&callback=?";

    //Get all the modules belonging to me
    jQuery.getJSON(moduleUrl, function(data) {
        $('#modules').html("<span>Response: " + JSON.stringify(data) + "</span>");
        myModuleInfo = data;

        var lbl_Module = "", i;
        for (i = 0; i < data.Results.length; i++) {
            var m = data.Results[i];

            //output the course code, acadyear and coursename
            lbl_Module += m.CourseCode + " " + m.CourseAcadYear + " - " + m.CourseName;

            //if there's new notifications add it in at the end
            if (m.Badge > 0) {
                lbl_Module += " (" + m.Badge + ")";
            }
            lbl_Module += "<br />"; //put a line break

            //get the tools belonging to this module
            lbl_Module += "<span id='announcement_" + m.ID + "' />";
            lbl_Module += "<span id='forum_" + m.ID + "' />";
            lbl_Module += "<span id='workbin_" + m.ID + "' />";
        }

        $('#lbl_Modules').html(lbl_Module);
    });
}

function displayProfile() {
    var profileUrl = API_URL + "Profile_View?output=json&callback=?&APIKey=" + APIKEY + "&AuthToken=" + TOKEN;

    jQuery.getJSON(profileUrl, function(data) {
        var profileData = data;
        $('#profile').html("<span>Response: " + JSON.stringify(profileData) + "</span>");

        // If userId not found in database, save student profile.
        var url = "/Student/ProfileServlet?action=checkIsStudent&userId=" + profileData.Results[0]["UserID"];
        $.get(url, function(data) {

            if (!data.response) {
                console.log(profileData);
                $.ajax({
                    type: 'post',
                    url: '/Student/ProfileServlet?action=createStudent',
                    data: profileData.Results[0],
                    success: function(data) {

                    }
                });
            }
        });
    });


}