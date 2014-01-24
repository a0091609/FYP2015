var APIKEY = "wslHwY4vC8n7cDdR2I8pV";
var API_DOMAIN = "https://ivle.nus.edu.sg/";
var API_URL = API_DOMAIN + "api/lapi.svc/";
var LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY + "&url=http%3A%2F%2Flocalhost%3A8080%2FInstructor%2Fworkspace.jsp";

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

    //Get all registered modules
    jQuery.getJSON(moduleUrl, function(data) {
        $('#modules').html("<span>Response: " + JSON.stringify(data) + "</span>");

        for (i = 0; i < data.Results.length; i++) {
            var m = data.Results[i];
            saveModule(m);
        }
    });
}

function displayProfile() {
    var profileUrl = API_URL + "Profile_View?output=json&callback=?&APIKey=" + APIKEY + "&AuthToken=" + TOKEN;

    jQuery.getJSON(profileUrl, function(data) {
        saveInstructorProfile(data);
    });
}

function saveInstructorProfile(data) {
    var profileData = data;
    // If userId not found, save instructor profile.
    var url = "/Instructor/ProfileServlet?action=checkIsInstructor&userId=" + profileData.Results[0]["UserID"];
    $.get(url, function(data) {
        if (!data.response) { // data.response return True or False
            $.ajax({
                type: 'post',
                url: '/Instructor/ProfileServlet?action=createInstructor',
                data: profileData.Results[0],
                success: function(data) {
                }
            });
        }
    });
}

function saveModule(data) {
    var mData = data;
    // If moduleId not found, save module.
    var url = "/Instructor/ModuleServlet?action=checkIsModule&moduleId=" + mData.ID;
    $.get(url, function(data) {
        if (!data.response) { // data.response return True or False
            $.ajax({
                type: 'post',
                url: '/Instructor/ModuleServlet?action=createModule',
                data: {id: mData.ID, code: mData.CourseCode, name: mData.CourseName, creatorId: mData.Creator["UserID"]},
                success: function(data) {
                }
            });
        }
    });
}