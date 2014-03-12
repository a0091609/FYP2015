/*
 * GLMS Items Servlet
 */
package servlet;

import entity.Module;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.ItemBeanLocal;
import session.ModuleBeanLocal;

/**
 *
 * @author Philson
 */
@WebServlet(name = "Items", urlPatterns =
{
    "/Items", "/Items?*"
})
public class ItemServlet extends HttpServlet
{

    //Global Variables
    HttpServletRequest request;
    HttpServletResponse response;
    private List data = null;

    //EJB References
    @EJB
    ItemBeanLocal itemBean;
    @EJB
    ModuleBeanLocal moduleBean;

    
    //Functionalities needed:        
        //  1. Retrieve all the Items for a particular module      [NOT DONE]
        //  2. Create a Style Item                                 [NOT DONE]
        //  3. Create a Pet                                        [NOT DONE]
        //  4. Create a Booster Pack                               [NOT DONE]
        //  5. Create a Quest Item                                 [NOT DONE]
        //  6. Delete an Item                                      [NOT DONE]

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //Standard Servlet Initialization
        HttpSession session = request.getSession();
        this.request = request;
        this.response = response;
        String userId = (String) session.getAttribute("userId");
        String moduleId = request.getParameter("moduleId");
        String action = request.getParameter("action");
        System.out.println("ItemServlet action: " + action);

        try
        {
            //User not logged in
            if (userId == null)
            {
                response.sendRedirect(request.getContextPath());
            }

            //Default action brings them to the module selection page
            else if (action==null || moduleId==null)
            {
                data = moduleBean.getInstructorModules(userId);
                request.setAttribute("moduleList", data);
                request.getRequestDispatcher("/items/items.jsp").forward(request, response);
            }
            
            else if(action.equals("viewAllItems"))
            {
                displayItems(moduleId); 
            }
            else if (action.equals("createStyleItem"))
            {
                //todo
            }
            else if (action.equals("createPet"))
            {
                //todo
            }
            else if (action.equals("createBoosterPack"))
            {
                //todo
            }
            else if (action.equals("createQuestItem"))
            {
                //todo
            }
            else if (action.equals("deleteItem"))
            {
                //todo
            }
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        finally
        {
            System.out.println("ItemServlet: servlet action ended.");
        }
    }

    
    
//Private methods, for convenience
    
    
    //Displays all the items for a module
    private void displayItems(String moduleId) throws Exception
    {
        // Get the saved coupons
        data = itemBean.getAllItems(moduleId);
        System.out.println("All Items: " + data);
        request.setAttribute("allItems", data);
        
        //Need to set the moduleID or it will be lost
        Module mod = moduleBean.getModule(moduleId);
        request.setAttribute("module", mod);

        //Prevents browser from caching and not updating
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        //Direct them to the display page!
        request.getRequestDispatcher("/items/itemMgt.jsp").forward(request, response);
    }
                
                
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
