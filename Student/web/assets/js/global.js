/* 
 * Global JS File
 * For func/var that are acesssed by many pages
 */




//Simple function to toggle active page
function setActivePage(ID)
{
    $(".page-sidebar-menu .active").removeClass("active");
    $(".page-sidebar-menu .start").removeClass("start");
    $('#'+ID).addClass("start active");
}
