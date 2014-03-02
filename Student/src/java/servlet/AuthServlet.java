/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chih Yong
 */
@WebServlet(name = "AuthServlet", urlPatterns = {"/AuthServlet", "/AuthServlet?*"})
public class AuthServlet extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String token = "";
            if (request.getParameter("token") != null) {
                token = request.getParameter("token");
                System.out.println("AuthServlet token: " + token);

                request.getSession().setAttribute("token", token);
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            }
            else {
                String action = request.getParameter("action");
                System.out.println("AuthServlet action: " + action);

                if (action.equals("createLoginSession")) {
                    String userId = request.getParameter("userId");
                    String username = request.getParameter("username");

                    request.getSession().setAttribute("userId", userId);
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("userType", "student");

                    response.setContentType("application/json;charset=utf-8");
                    JsonObject json = new JsonObject();
                    json.addProperty("response", "Login session for " + userId + " " + username + " created.");

                    PrintWriter pw = response.getWriter();
                    pw.print(json);
                    pw.close();
                }
                else if(action.equals("logout")) {
                    request.getSession().invalidate();
                    response.sendRedirect("dashboard.jsp");
                }
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
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
            throws ServletException, IOException {
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
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
