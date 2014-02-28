/* 
 * Global JS File
 * For func/var that are acesssed by many pages
 */




//Simple function to toggle active page
function setActivePage(ID)
{
    $(".active").removeClass("active");
    $('#'+ID).addClass("active");
}