/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Module;
import java.io.IOException;
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
@WebServlet(name = "Quests", urlPatterns =
{
    "/Quests", "/Quests?*"
})
public class QuestServlet extends HttpServlet
{

    //Global Variables
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private List data = null;

    //EJB References
    @EJB
    ItemBeanLocal itemBean;
    @EJB
    ModuleBeanLocal moduleBean;

    
    //Functionalities needed:        
    //  1. Retrieve all Quests for a module             [NOT DONE]
    //  2. Retrieve all Quests submitted by Avatar      [NOT DONE]
    //  3. Retrieve all Keys owned by Avatar            [NOT DONE]
    //  4. Retrieve all details for partcular Quest     [NOT DONE]
    //  5. Submit a quest and update rewards            [NOT DONE]
    //  6. Notify user of their accomplishment          [NOT DONE]
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //Standard Servlet Initialization
        session = request.getSession();
        this.request = request;
        this.response = response;
        String userId = (String) session.getAttribute("userId");
        String moduleId = (String) session.getAttribute("moduleId");
        String action = request.getParameter("action");
        System.out.println("QuestServlet action: " + action);

        try
        {
            //User not logged in
            if (userId == null)
            {
                response.sendRedirect("login.jsp");
            }
            //Module ID not specified
            else if (moduleId == null)
            {
                response.sendRedirect("Login");
            }

            //Default action brings them to the quest display page
            else if (action == null || action.equals("viewAllQuests"))
            {
                //1. Retrieve all Quests for a module
                //2. Retrieve all Quests submitted by Avatar
                //3. Retrieve all Keys owned by Avatar
            }
            else if (action.equals("openQuest"))
            {
                //  4. Retrieve all details for partcular Quest 
            }
            else if (action.equals("submitQuest"))
            {
                //  5. Submit a quest and update rewards            
                //  6. Notify user of their accomplishment          
            }
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        finally
        {
            System.out.println("QuestServlet: servlet action ended.");
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
