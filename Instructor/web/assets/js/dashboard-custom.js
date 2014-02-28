var APIKEY = "wslHwY4vC8n7cDdR2I8pV";
var API_DOMAIN = "https://ivle.nus.edu.sg/";
var API_URL = API_DOMAIN + "api/lapi.svc/";
var LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY + "&url=http%3A%2F%2Flocalhost%3A8080%2FInstructor%2Fdashboard.jsp";
//variable to store the Authentication Token
var TOKEN = "";
var userId = "";
var username = "";
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

function dashboardInit() {
    var profileUrl = API_URL + "Profile_View?output=json&callback=?&APIKey=" + APIKEY + "&AuthToken=" + TOKEN;
    jQuery.getJSON(profileUrl, function(data) {
        userId = data.Results[0]["UserID"];
        // If matches instructor userId pattern, save instructor profile, create login session
        if (userId.length > 4 && isNaN(parseInt(userId.substr(4)))) {
            saveInstructorProfile(data);
            createLoginSession(userId, TOKEN);
            processModules(function() {
                setTimeout(function() {
                    displayModules();
                }, 2000);
            });
        }
        else {
            window.location = "http://localhost:8080/Student/";
        }
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
                    if (data.response) {
                        console.log("New instructor profile created.");
                    }
                }
            });
        }
        else {
            console.log("Instructor profile already exists.");
        }
    });
}

function displayUsername() {
    var usernameUrl = API_URL + "UserName_Get?output=json&callback=?&APIKey=" + APIKEY + "&Token=" + TOKEN;
    jQuery.getJSON(usernameUrl, function(data) {
        $('.username').html(data);
    });
}

function createLoginSession(userId, token) {
    // Retrieve username
    var usernameUrl = API_URL + "UserName_Get?output=json&callback=?&APIKey=" + APIKEY + "&Token=" + TOKEN;

    jQuery.getJSON(usernameUrl, function(data) {
        username = data;
        $.ajax({
            type: 'post',
            url: '/Instructor/AuthServlet?action=createLoginSession',
            data: {'userId': userId, 'username': username, 'token': TOKEN},
            success: function(data) {
                console.log(data.response);
                return true;
            }
        });
    });
}

function processModules(callback) {
    // Retrieve all registered modules
    var moduleUrl = API_URL + "Modules?APIKey=" + APIKEY + "&AuthToken=" + TOKEN + "&Duration=1&IncludeAllInfo=false&output=json&callback=?";

    jQuery.getJSON(moduleUrl, function(data) {
        var i;
        for (i = 0; i < data.Results.length; i++) {
            saveModule(data.Results[i]);
        }
    });
    callback && callback();
}

function saveModule(data) {
    var mData = data;
    var creatorId = mData.Creator["UserID"];

    $.ajax({
        type: 'post',
        url: '/Instructor/ModuleServlet?action=createModule',
        data: {id: mData.ID, code: mData.CourseCode, name: mData.CourseName, creatorId: creatorId},
        success: function(data) {
            if (data.response) {
                console.log();
            }
        }
    });
}

function displayModules() {
    var url = "/Instructor/ModuleServlet?action=getInstructorModules";
    jQuery.getJSON(url, function(data) {
        var moduleList = '', i;
        for (i = 0; i < data.length; i++) {
            var m = data[i];
            console.log(m);
            moduleList += '<div class="row-fluid"><div class="span12">';

            // Start of portlet box
            moduleList += '<div class="portlet box grey">';
            // Start of portlet-title
            moduleList += '<div class="portlet-title"> \
                           <div class="caption"><i class="icon-reorder"></i>' + m.moduleCode + ' ' + m.moduleName + '</div>';
            moduleList += '<div class="tools"><a href="javascript:;" class="collapse"></a> \
                           <a href="#portlet-config" data-toggle="modal" class="config"></a> \
                           </div> \
                           </div>';
            // End of portlet-title

            // Start of portlet-body
            moduleList += '<div class="portlet-body">';

            if (!m.activated) {
                moduleList += '<a href="/Instructor/ModuleServlet?action=activateModule&moduleId=' + m.moduleId + '&moduleCode=' + m.moduleCode + '&moduleName=' + m.moduleName + '">Activate module</a>';
            }
            else {
                moduleList += '<a href="/Instructor/QuizServlet?action=viewAllQuiz&moduleId=' + m.moduleId + '&moduleName=' + m.moduleName + '">Quiz</a>';
            }
            moduleList += '</div>\
                           </div>';
            // End of portlet-body
            moduleList += '</div></div>';
        }
        $('#modules').html(moduleList);
    });
}