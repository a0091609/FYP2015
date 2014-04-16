/*
 * This servlet handles the student profile
 * For the module dashboard
 */
package servlet;

import entity.Module;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Modules", urlPatterns =
{
    "/Modules", "/Modules?*"
})
public class Modules extends HttpServlet
{

    //Global Variables
    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession session;
    private List data = null;

    //EJB References
    @EJB
    ItemBeanLocal itemBean;
    @EJB
    ModuleBeanLocal moduleBean;

    //Functionalities needed:        
    //  1. Retrieve all module details      [DONE!]
    //  2. Retrieve Student Skills          [NOT DONE]
    //  3. Retrieve Gold Details            [NOT DONE]
    //  4. Retrieve Job Classes             [NOT DONE]
    //  5. Retrieve Quest Completed         [NOT DONE]
    //  6. Redirect to Module Dashboard     [DONE!]
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //Standard Servlet Initialization
        session = request.getSession();
        this.request = request;
        this.response = response;
        String userId = (String) session.getAttribute("userId");
        String moduleId = request.getParameter("moduleId");
        String action = request.getParameter("action");
        System.out.println("ModuleDashboard action: " + action);

        try
        {
            //User not logged in
            if (userId == null)
            {
                response.sendRedirect(request.getContextPath());
            }
            //Default action brings them to the module selection page
            else if (action == null || moduleId == null)
            {
                response.sendRedirect("Login");
            }
            //Show the module dashboard
            else if (action.equals("moduleDashboard"))
            {
                //  1. Retrieve all module details  
                moduleDetails(moduleId);
                
                //  2. Retrieve Student Skills          [NOT DONE]
                //  3. Retrieve Gold Details            [NOT DONE]
                //  4. Retrieve Job Classes             [NOT DONE]
                //  5. Retrieve Quest Completed         [NOT DONE]
                
                //  6. Redirect to Module Dashboard
                request.getRequestDispatcher("/moduleDashboard.jsp").forward(request, response);
            }
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        finally
        {
            System.out.println("ModuleDashboard: servlet action ended.");
        }
    }

//Private methods, for convenience
    //Retrieves and process all the module details
    private void moduleDetails(String moduleId) throws Exception
    {
        //Need to set the moduleID or it will be lost
        Module mod = moduleBean.getModule(moduleId);
        request.setAttribute("module", mod);
        session.setAttribute("moduleId", moduleId);

        //Prevents browser from caching and not updating
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

    //Create a new pet item
    private void createPet(String moduleId) throws Exception
    {
        //Extract the form parameters
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int cost = Integer.parseInt(request.getParameter("cost"));
        int bonus = Integer.parseInt(request.getParameter("bonus"));

        //Create the pet
        itemBean.createPet(moduleId, name, description, cost, bonus);

        //Send a server msg to feedback
        data = new ArrayList();
        data.add("New Pet: " + name + " has been created");
        request.setAttribute("serverMsg", data);
        System.out.println("New Pet: " + name + " has been created");
        data = null;
    }

    //Delete an item
    private void delete() throws Exception
    {
        //Delete the item
        long itemId = Long.parseLong(request.getParameter("itemId"));
        String name = itemBean.getItem(itemId).getName();
        itemBean.deleteItem(itemId);

        //Send a server msg to feedback
        data = new ArrayList();
        data.add("Item: " + name + " has been deleted.");
        request.setAttribute("serverMsg", data);
        System.out.println("Item: " + name + " has been deleted.");
        data = null;
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
