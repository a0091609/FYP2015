function displayModules(userId) {
    var url = "/Instructor/ModuleServlet?action=getInstructorModules";
    jQuery.getJSON(url, function(data) {
        var moduleList = '', i, j;
        for (i = 0; i < data.length; i++) {
            var m = data[i];

            moduleList += '<div class="row-fluid"><div class="span12">';

            moduleList += '<div class="portlet box grey"> \
                           <div class="portlet-title"> \
                           <div class="caption"><i class="icon-reorder"></i>' + m.moduleCode + ' ' + m.moduleName + '</div>';
            moduleList += '<div class="tools"><a href="javascript:;" class="collapse"></a> \
                           <a href="#portlet-config" data-toggle="modal" class="config"></a> \
                           </div> \
                           </div>';
            moduleList += '<div class="portlet-body">';
            moduleList += '<a href="/Instructor/QuizServlet?action=createQuiz&moduleId=' + m.moduleId + '&moduleName=' + m.moduleName + '">Create Quiz</a>';
            moduleList += '</div>\
                           </div>';

            moduleList += '</div></div>';
        }
        console.log(moduleList);
        $('#modules').html(moduleList);
    });
}