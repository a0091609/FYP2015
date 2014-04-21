/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Item;
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

/**
 *
 * @author Philson
 */
@WebServlet(name = "ItemServlet", urlPatterns =
{
    "/Items", "/Items?*"
})
public class ItemServlet extends HttpServlet
{

    //Global Variables
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    //EJB References
    @EJB
    ItemBeanLocal itemBean;


    //Functionalities needed:        
    //  1. Retrieve all Items for a module             [Not Done]
    //  2. Retrieve all the CurrentBalance of Avatar   [Not Done]
    //  3. Purchase a Key for Avatar                   [Not Done]
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
        System.out.println("userId: " + userId);
        System.out.println("moduleId: " + moduleId);
        System.out.println("ItemServlet action: " + action);

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
            else if (action == null || action.equals("viewAllItems"))
            {
                System.out.println("Request: " + request);
                displayAllItems(moduleId, userId);
            }
            else if (action.equals("openQuest"))
            {
                //do nothing
            }
        }
        catch (Exception ex)
        {
            System.out.println("ERROR");
            System.out.println(ex.getMessage());
        }
        finally
        {
            System.out.println("ItemServlet: servlet action ended.");
        }
    }

//Private methods, for convenience
    //Displays all the quests for a module
    private void displayAllItems(String moduleId, String userId) throws Exception
    {
        //1. Retrieve all Items for a module
        //2. Retrieve currentBalance by Avatar

        // Get all the Items
        List<Item> allItems = itemBean.getAllItems(moduleId);
        System.out.println("All Items: " + allItems);
        request.setAttribute("allItems", allItems);

        //Direct them to the display page!
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
