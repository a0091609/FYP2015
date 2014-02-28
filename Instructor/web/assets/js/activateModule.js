/* 
 * The logic for module activate component selection!
 */


//EVENT LISTENERS

//Event listeners for pedagogy
$('#adaptive').live('change', function()
{
    if ($('#adaptive').is(':checked'))
    {
        activateExp();
        activateGlobalLB();
        activateAutoRW();
        activateQuiz();
    }
    else
    {
        deactivateExp();
        deactivateGlobalLB();
        deactivateAutoRW();
        deactivateQuiz();
    }
});
$('#lcp').live('change', function()
{
    if ($('#lcp').is(':checked'))
    {
        activateCoins();
        activateSocialLB();
        activateMkt();
        activateQuest();
        activateAvatar();
        activateBuddy();
    }
    else
    {
        deactivateCoins();
        deactivateSocialLB();
        deactivateMkt();
        deactivateQuest();
        deactivateAvatar();
        deactivateBuddy();
    }
});



//Event listeners for individual components
$('#feature-exp').change(function()
{
    if ($(this).is(':checked'))
    {
        activateExp();
    }
    else
    {
        deactivateExp();
    }
});
$('#feature-coins').change(function()
{
    if ($(this).is(':checked'))
    {
        activateCoins();
    }
    else
    {
        deactivateCoins();
    }
});$('#feature-globalLB').change(function()
{
    if ($(this).is(':checked'))
    {
        activateGlobalLB();
    }
    else
    {
        deactivateglobalLB();
    }
});$('#feature-socialLB').change(function()
{
    if ($(this).is(':checked'))
    {
        activateSocialLB();
    }
    else
    {
        deactivateSocialLB();
    }
});$('#feature-autoRW').change(function()
{
    if ($(this).is(':checked'))
    {
        activateAutoRW();
    }
    else
    {
        deactivateAutoRW();
    }
});$('#feature-mkt').change(function()
{
    if ($(this).is(':checked'))
    {
        activateMkt();
    }
    else
    {
        deactivateMkt();
    }
});$('#feature-quest').change(function()
{
    if ($(this).is(':checked'))
    {
        activateQuest();
    }
    else
    {
        deactivateQuest();
    }
});$('#feature-quiz').change(function()
{
    if ($(this).is(':checked'))
    {
        activateQuiz();
    }
    else
    {
        deactivateQuiz();
    }
});$('#feature-buddy').change(function()
{
    if ($(this).is(':checked'))
    {
        activateBuddy();
    }
    else
    {
        deactivateBuddy();
    }
});$('#feature-avatar').change(function()
{
    if ($(this).is(':checked'))
    {
        activateAvatar();
    }
    else
    {
        deactivateAvatar();
    }
});






//ACTIVATE DEPENDENCIES
function activateExp()
{
    if (!$('#feature-exp').is(':checked'))
    {
        $("#feature-exp").trigger('click');
    }
}
function activateCoins()
{
    if (!$('#feature-coins').is(':checked'))
    {
        $("#feature-coins").trigger('click');
    }
}
function activateGlobalLB()
{
    if (!$('#feature-globalLB').is(':checked'))
    {
        $("#feature-globalLB").trigger('click');
    }
}
function activateSocialLB()
{
    if (!$('#feature-socialLB').is(':checked'))
    {
        $("#feature-socialLB").trigger('click');
    }
    activateBuddy();
}
function activateAutoRW()
{
    if (!$('#feature-autoRW').is(':checked'))
    {
        $("#feature-autoRW").trigger('click');
    }
    activateExp();
}
function activateMkt()
{
    if (!$('#feature-mkt').is(':checked'))
    {
        $("#feature-mkt").trigger('click');
    }
    activateCoins();
}
function activateQuiz()
{
    if (!$('#feature-quiz').is(':checked'))
    {
        $("#feature-quiz").trigger('click');
    }
}
function activateQuest()
{
    if (!$('#feature-quest').is(':checked'))
    {
        $("#feature-quest").trigger('click');
    }
    activateMkt();
}
function activateBuddy()
{
    if (!$('#feature-buddy').is(':checked'))
    {
        $("#feature-buddy").trigger('click');
    }
    activateAvatar();
}
function activateAvatar()
{
    if (!$('#feature-avatar').is(':checked'))
    {
        $("#feature-avatar").trigger('click');
    }
}



//DEACTIVATE DEPENDENCIES
function deactivateExp()
{
    if ($('#feature-exp').is(':checked'))
    {
        $("#feature-exp").trigger('click');
    }
    deactivateAutoRW();
}
function deactivateCoins()
{
    if ($('#feature-coins').is(':checked'))
    {
        $("#feature-coins").trigger('click');
    }
    deactivateMkt();
}
function deactivateGlobalLB()
{
    if ($('#feature-globalLB').is(':checked'))
    {
        $("#feature-globalLB").trigger('click');
    }
}
function deactivateSocialLB()
{
    if ($('#feature-socialLB').is(':checked'))
    {
        $("#feature-socialLB").trigger('click');
    }
}
function deactivateAutoRW()
{
    if ($('#feature-autoRW').is(':checked'))
    {
        $("#feature-autoRW").trigger('click');
    }
}
function deactivateMkt()
{
    if ($('#feature-mkt').is(':checked'))
    {
        $("#feature-mkt").trigger('click');
    }
    deactivateQuest();
}
function deactivateQuiz()
{
    if ($('#feature-quiz').is(':checked'))
    {
        $("#feature-quiz").trigger('click');
    }
}
function deactivateQuest()
{
    if ($('#feature-quest').is(':checked'))
    {
        $("#feature-quest").trigger('click');
    }
}
function deactivateBuddy()
{
    if ($('#feature-buddy').is(':checked'))
    {
        $("#feature-buddy").trigger('click');
    }
    deactivateSocialLB();
}
function deactivateAvatar()
{
    if ($('#feature-avatar').is(':checked'))
    {
        $("#feature-avatar").trigger('click');
    }
    deactivateBuddy();
}




/*//LIST OF IDs
 
 adaptive
 lcp
 feature-exp
 feature-coins
 feature-globalLB
 feature-socialLB
 feature-autoRW
 feature-mkt
 feature-quiz
 feature-quest
 feature-buddy
 feature-avatar
 
 */