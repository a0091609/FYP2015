/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Avatar;
import entity.Module;
import entity.Quest;
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
import session.ModuleBeanLocal;
import session.QuestBeanLocal;

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
    QuestBeanLocal questBean;
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
                displayAllQuests(moduleId, userId);
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
    //Displays all the quests for a module
    private void displayAllQuests(String moduleId, String userId) throws Exception
    {
        //1. Retrieve all Quests for a module
        //2. Retrieve all Quests submitted by Avatar
        //3. Retrieve all Keys owned by Avatar

        // Get all the Quests
        List<Quest> allQuests = questBean.getAllQuests(moduleId);
        System.out.println("All Items: " + data);

        //Sort 1 star quests
        List<Quest> oneStar = new ArrayList();
        for (Quest quest : allQuests)
        {
            if (quest.getDifficulty() == 1)
            {
                oneStar.add(quest);
            }
        }
        request.setAttribute("oneStar", oneStar);

        //Sort 2 star quests
        List<Quest> twoStar = new ArrayList();
        for (Quest quest : allQuests)
        {
            if (quest.getDifficulty() == 2)
            {
                twoStar.add(quest);
            }
        }
        request.setAttribute("twoStar", twoStar);

        //Sort 3 star quests
        List<Quest> threeStar = new ArrayList();
        for (Quest quest : allQuests)
        {
            if (quest.getDifficulty() == 3)
            {
                threeStar.add(quest);
            }
        }
        request.setAttribute("threeStar", threeStar);

        //Get users stuff
        Avatar a = questBean.getAvatar(userId, moduleId);
        request.setAttribute("questsCompleted", a.getQuestsCompleted());
        request.setAttribute("keys", questBean.getStudentKeys(a));

        //Need to set the Module or it will be lost
        Module mod = moduleBean.getModule(moduleId);
        request.setAttribute("module", mod);

        //Prevents browser from caching and not updating
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        //Direct them to the display page!
        request.getRequestDispatcher("quests.jsp").forward(request, response);
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
