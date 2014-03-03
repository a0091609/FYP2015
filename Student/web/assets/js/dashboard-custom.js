var APIKEY = "wslHwY4vC8n7cDdR2I8pV";
var API_DOMAIN = "https://ivle.nus.edu.sg/";
var API_URL = API_DOMAIN + "api/lapi.svc/";
var LOGIN_URL = API_DOMAIN + "api/login/?apikey=" + APIKEY + "&url=http%3A%2F%2Flocalhost%3A8080%2FStudent%2FAuthServlet";

function dashboardInit(token) {
    getUserId(token).done(function(data) {
        var userId = data;

        isStudent(userId).done(function(data) {
            if (data.response === false) {
                saveStudentProfile(token);
                processModules(token, userId);
            }
            createLoginSession(userId, token).done(function(data) {
                setTimeout(function() {
                    displayModules();
                }, 3000);
            });
        });
    });
}

function getUserId(token) {
    // Retreive userId
    var userIdUrl = API_URL + "UserID_Get?callback=?&APIKey=" + APIKEY + "&Token=" + token + "&output=json";

    return jQuery.getJSON(userIdUrl, function(data) {
        return data;
    });
}

function isStudent(userId) {
    var checkStudentUrl = "/Student/ProfileServlet?action=checkIsStudent&userId=" + userId;
    return $.get(checkStudentUrl, function(data) {
        return data.response;
    });
}

function saveStudentProfile(token) {
    var profileUrl = API_URL + "Profile_View?output=json&callback=?&APIKey=" + APIKEY + "&AuthToken=" + token;
    jQuery.getJSON(profileUrl, function(profileData) {
        $.ajax({
            type: 'post',
            url: '/Student/ProfileServlet?action=createStudent',
            data: profileData.Results[0],
            success: function(data) {
                if (data.response) {
                    console.log("New Student profile created.");
                }
            }
        });
    });
}

function createLoginSession(userId, token) {
    // Retrieve username
    var usernameUrl = API_URL + "UserName_Get?output=json&callback=?&APIKey=" + APIKEY + "&Token=" + token;

    return jQuery.getJSON(usernameUrl, function(data) {
        var username = data;
        $('.username').html(username);
        $.ajax({
            type: 'post',
            url: '/Student/AuthServlet?action=createLoginSession',
            data: {'userId': userId, 'username': username},
            success: function(data) {
                return true;
            }
        });
    });
}

function processModules(token, userId) {
    // Retrieve all registered modules
    var moduleUrl = API_URL + "Modules?APIKey=" + APIKEY + "&AuthToken=" + token + "&Duration=1&IncludeAllInfo=false&output=json&callback=?";

    jQuery.getJSON(moduleUrl, function(data) {
        var i;
        for (i = 0; i < data.Results.length; i++) {
            saveModule(data.Results[i], userId);
        }
    });
}

function saveModule(data, userId) {
    var mData = data;

    var creatorId = mData.Creator === null ? "" : mData.Creator["UserID"];

    $.ajax({
        type: 'post',
        url: '/Student/ModuleServlet?action=createModule',
        data: {id: mData.ID, code: mData.CourseCode, name: mData.CourseName, creatorId: creatorId, userId: userId},
        success: function(data) {
            if (data.response) {
                console.log();
            }
        }
    });
}

function displayModules() {
    var url = "/Student/ModuleServlet?action=getStudentModules";
    jQuery.getJSON(url, function(data) {
        var moduleList = '', i;
        for (i = 0; i < data.length; i++) {
            var m = data[i];

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

//            if (!m.activated) {
//            }
//            else {
//                moduleList += '<a href="/Student/QuizServlet?action=viewAllQuiz&moduleId=' + m.moduleId + '&moduleName=' + m.moduleName + '">Quiz</a>';
//            }
            moduleList += '<a href="/Student/QuizServlet?action=viewAllQuiz&moduleId=' + m.moduleId + '&moduleName=' + m.moduleName + '">Quiz</a>';
            moduleList += '</div>\
                           </div>';
            // End of portlet-body
        }
        $('#modules').html(moduleList);
    });
}