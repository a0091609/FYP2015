/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
@WebServlet(name = "LoginServlet", urlPatterns =
{
    "/LoginServlet", "/LoginServlet?*"
})
public class LoginServlet extends HttpServlet
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
    //  1. Login the Student                                   [NOT DONE]
    //  2. Retrieve his list of modules                        [NOT DONE]
    //  3. Redirect to dashboard2                              [NOT DONE]
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //Standard Servlet Initialization
        HttpSession session = request.getSession();
        this.request = request;
        this.response = response;
        String userId = request.getParameter("userId");
        System.out.println("LoginServlet userId: " + userId);

        try
        {
            //Make sure that a userID has been specified
            if (userId == null)
            {
                response.sendRedirect(request.getContextPath());
            }
            else
            {
                //Standard login stuff
                session.setAttribute("userId", userId);
                session.setAttribute("username", "Philson Nah");
                session.setAttribute("userType", "student");

                //Get Student module list
                data = moduleBean.getStudentModules(userId);
                request.setAttribute("moduleList", data);
                System.out.println("Modules: " + data);

                //Redirect to dashboard
                request.getRequestDispatcher("/dashboard2.jsp").forward(request, response);
            }
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        finally
        {
            System.out.println("LoginServlet: servlet action ended.");
        }
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
