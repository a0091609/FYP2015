<%@page import="entity.Pet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Module"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>GLMS | Items Management</title>
        <%-- Standard imports for every page--%>
        <%@include file="/WEB-INF/jspf/stylesheets.jspf" %>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed page-sidebar-fixed">
        <%-- Import for the header bar --%>
        <%@include file="/WEB-INF/jspf/headerBar.jspf" %> 
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <%-- Import for the side bar --%>
            <%@include file="/WEB-INF/jspf/sideBar.jspf" %> 
            <!-- BEGIN PAGE -->
            <div class="page-content">
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <%Module mod = (Module) request.getAttribute("module");%>
                    <!-- BEGIN PAGE HEADER-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title">
                                Items Management
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="index.jsp">Home</a> 
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="Items">Items</a>
                                    <i class="icon-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#"><%=mod.getModuleCode()%></a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->




                    <!-- BEGIN PAGE CONTENT-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN SAMPLE FORM PORTLET-->   
                            <div class="portlet box red tabbable">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-reorder"></i>
                                        <span class="hidden-480">Items</span>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <div class="tabbable portlet-tabs">
                                        <ul class="nav nav-tabs">
                                            <li><a href="#portlet_tab4" data-toggle="tab">Booster Packs</a></li>
                                            <li><a href="#portlet_tab3" data-toggle="tab">Quest Items</a></li>
                                            <li><a href="#portlet_tab2" data-toggle="tab">Pets</a></li>
                                            <li class="active"><a href="#portlet_tab1" data-toggle="tab">Style Items</a></li>
                                        </ul>
                                        <div class="tab-content no-more-tables">
                                            <div class="tab-pane active" id="portlet_tab1">
                                                Temporarily disabled.
                                                <!--
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_3">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>test</th>
                                                            <th>Username</th>
                                                            <th>Email</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">
                                                            <td data-title="title"><input type="checkbox" class="checkboxes" value="1" /></td>
                                                            <td data-title="title">xxxx</td>
                                                            <td data-title="title"><a href="mailto:xxx">xxxxx</a></td>
                                                            <td data-title="title"><span class="label label-success">Approved</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                -->

                                            </div>
                                            <div class="tab-pane " id="portlet_tab2">
                                                <h2>Pets</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis eu turpis nec tempus. Sed aliquam fringilla tellus et fringilla. Fusce sed vehicula eros, ut iaculis risus. Quisque auctor nibh quis ligula tincidunt, non aliquet ligula laoreet. Nunc ante dui, condimentum nec purus ac, aliquet tempor augue. Nullam egestas lacus sit amet turpis mollis, sed dictum nisl laoreet. Aliquam tempus bibendum ligula vitae tempus. Nulla tristique viverra metus et feugiat. Quisque augue mauris, consequat et diam et, posuere lobortis enim.
                                                </p>
                                                <div class="actions">
                                                    <a class="btn blue" data-toggle="modal" href="#newPetForm"><i class="icon-plus"></i> New Pet</a>
                                                </div><br>

                                                <!-- Modal Form for new Pet -->
                                                <div id="newPetForm" class="modal hide fade" tabindex="-1" data-width="760">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h3>New Pet</h3>
                                                    </div>
                                                    <form action="Items?action=createPet" method="post" class="form-horizontal" id="petForm">
                                                        <div class="modal-body">
                                                            <div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
                                                                <div class="row-fluid">
                                                                    <div class="span12">
                                                                        <p><label>Image: <input type="file" class="span12 m-wrap"></label></p>
                                                                        <p><label>Name: <input type="text" name="name" class="span12 m-wrap" placeholder="Give the pet a name"></label></p>
                                                                        <p>
                                                                            <label>Description: 
                                                                                <textarea name="description" class="span12 m-wrap" style="resize: none" rows="4" placeholder="Enter a brief description about this pet"></textarea>
                                                                            </label>
                                                                        </p>
                                                                        <p><label>Cost:
                                                                                <input name="cost" type="number" placeholder="Enter the cost of this pet" class="span12 m-wrap">
                                                                            </label>
                                                                            <span class="help-inline">Recommended: Cost = 10 x Bonus</span>
                                                                        </p>
                                                                        <p><label>Max Bonus:
                                                                                <input name="bonus" type="number" placeholder="The max amt of gold this pet gives" class="span12 m-wrap">
                                                                            </label>
                                                                            <span class="help-inline">The pet will give a random amount of gold between 1 and this number.</span>
                                                                        </p>
                                                                        <input type="hidden" name="moduleId" value='<%=mod.getModuleId()%>'>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" data-dismiss="modal" class="btn">Close</button>
                                                            <input type="submit" value="Go" class="btn blue">
                                                        </div>
                                                    </form>
                                                </div>

                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_2">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>Image</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Cost</th>
                                                            <th>Bonus</th>                                                            
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <%
                                                            ArrayList allItems = (ArrayList) request.getAttribute("allItems");

                                                            //Print all the Pets
                                                            for (Object o : allItems)
                                                            {
                                                                if (o instanceof Pet)
                                                                {
                                                                    Pet pet = (Pet) o;
                                                                    String image = pet.getImgURL();
                                                                    String name = pet.getName();
                                                                    String des = pet.getDescription();
                                                                    int cost = pet.getCost();
                                                                    int bonus = pet.getMaxBonus();
                                                                    String delete = "Items?action=deleteItem&itemId=" + pet.getId() + "&moduleId=" + mod.getModuleId();
                                                        %>

                                                        <tr class="gradeX">
                                                            <td data-title="Image"><img class="smallTableImg" src="<%=image%>"></td>
                                                            <td data-title="Name"><%=name%></td>
                                                            <td data-title="Description"><%=des%></td>
                                                            <td data-title="Cost"><%=cost%></td>
                                                            <td data-title="Bonus"><%=bonus%></td>
                                                            <td data-title="Actions"><center><a href="<%=delete%>" class="btn red"><i class="icon-trash"></i> Delete</a></center></td>
                                                    </tr>

                                                    <%  //Done printing
                                                            }
                                                        }
                                                    %>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab3">
                                                <h2>Keys</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis eu turpis nec tempus. Sed aliquam fringilla tellus et fringilla. Fusce sed vehicula eros, ut iaculis risus. Quisque auctor nibh quis ligula tincidunt, non aliquet ligula laoreet. Nunc ante dui, condimentum nec purus ac, aliquet tempor augue. Nullam egestas lacus sit amet turpis mollis, sed dictum nisl laoreet. Aliquam tempus bibendum ligula vitae tempus. Nulla tristique viverra metus et feugiat. Quisque augue mauris, consequat et diam et, posuere lobortis enim.
                                                </p>
                                                <div class="actions">
                                                    <a class="btn blue" data-toggle="modal" href="#newQuiz-form"><i class="icon-plus"></i> New Key</a>
                                                </div><br>
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_1">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>Image</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Cost</th>
                                                            <th>Bonus</th>                                                            
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gradeX">
                                                            <td data-title="Image"><img class="smallTableImg"></td>
                                                            <td data-title="Name">Pikachu</td>
                                                            <td data-title="Description">A cute electric mouse. It zaps!</td>
                                                            <td data-title="Cost">500</td>
                                                            <td data-title="Bonus">5</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn red"><i class="icon-trash"></i> Delete</a></center></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane " id="portlet_tab4">
                                                <h2>Booster</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis eu turpis nec tempus. Sed aliquam fringilla tellus et fringilla. Fusce sed vehicula eros, ut iaculis risus. Quisque auctor nibh quis ligula tincidunt, non aliquet ligula laoreet. Nunc ante dui, condimentum nec purus ac, aliquet tempor augue. Nullam egestas lacus sit amet turpis mollis, sed dictum nisl laoreet. Aliquam tempus bibendum ligula vitae tempus. Nulla tristique viverra metus et feugiat. Quisque augue mauris, consequat et diam et, posuere lobortis enim.
                                                </p>
                                                <div class="actions">
                                                    <a class="btn blue" data-toggle="modal" href="#newQuiz-form"><i class="icon-plus"></i> New Booster</a>
                                                </div><br>
                                                <table class="table table-striped table-bordered table-hover table-condensed cf" id="sample_4">
                                                    <thead class="cf">
                                                        <tr>
                                                            <th>Image</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Cost</th>
                                                            <th>Bonus</th>                                                            
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gradeX">
                                                            <td data-title="Image"><img class="smallTableImg"></td>
                                                            <td data-title="Name">Pikachu</td>
                                                            <td data-title="Description">A cute electric mouse. It zaps!</td>
                                                            <td data-title="Cost">500</td>
                                                            <td data-title="Bonus">5</td>
                                                            <td data-title="Actions"><center><a href="#" class="btn red"><i class="icon-trash"></i> Delete</a></center></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->  




                </div>
                <!-- END PAGE CONTAINER-->    
            </div>
            <!-- END PAGE -->
        </div>
        <!-- END CONTAINER -->

        <%-- Import for the footer bar --%>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>   

        <!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
        <%-- Standard JS imports for every page--%>
        <%@include file="/WEB-INF/jspf/javascripts.jspf" %>
        <script>
            jQuery(document).ready(function()
            {
                App.init(); // initlayout and core plugins
                //$('#footable').footable();
                TableManaged.init();
                setActivePage("link-items");


            <%
                ArrayList serverMsg = (ArrayList) request.getAttribute("serverMsg");
                if (serverMsg != null)
                {
                    //Print all the server messages
                    for (Object o : serverMsg)
                    {
                        String msg = (String) o;
            %>
                        $.gritter.add({
                            title: 'Items Management',
                            text: '<%=msg%>'
                        });
            <%
                    }
                }
            %>


            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>