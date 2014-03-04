/*
 * GLMS Items Servlet
 */
package servlet;

import java.io.IOException;
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
@WebServlet(name = "Items", urlPatterns =
{
    "/Items", "/Items?*"
})
public class ItemServlet extends HttpServlet
{

    //Global Variables
    HttpServletRequest request;
    HttpServletResponse response;

    //EJB References
    @EJB
    ItemBeanLocal itemBean;

    
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
        String action = request.getParameter("action");
        System.out.println("ItemsServlet action: " + action);

        try
        {
            //User not logged in
            if (session.getAttribute("userId") == null)
            {
                response.sendRedirect(request.getContextPath());
            }

            //Default action null allowed for convenience
            if (action == null || action.equals("viewAllItems"))
            {
                displayItems();
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
            System.out.println("ItemsServlet: servlet action ended.");
        }
    }

//Private methods, for convenience
    private void displayItems() throws Exception
    {
//        // Get the saved coupons
//        data = coupons.getMySavedCoupons(username);
//        System.out.println("Saved Coupons: " + data);
//        request.setAttribute("saved", data);
//
//        data = null;
//
//        // Get the all the issued coupons
//        data = coupons.getAllIssued();
//        System.out.println("All Issued Coupons: " + data);
//        request.setAttribute("allIssued", data);
//
//        data = null;

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
