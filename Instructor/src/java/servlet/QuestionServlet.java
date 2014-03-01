/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.QuestionBeanLocal;

/**
 *
 * @author Chih Yong
 */
@WebServlet(name = "QuestionServlet", urlPatterns = {"/QuestionServlet", "/QuestionServlet?*"})
public class QuestionServlet extends HttpServlet
{

    @EJB
    QuestionBeanLocal questionBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            System.out.println("QuestionServlet action: " + action);

            if (action.equals("saveNewMultiChoice")) {
                String quizId = request.getSession().getAttribute("quizId").toString();
                String questName = request.getParameter("questName");
                String questText = request.getParameter("questText");
                String option1 = request.getParameter("option1");
                String option2 = request.getParameter("option2");
                String option3 = request.getParameter("option3");
                String option4 = request.getParameter("option4");
                Integer answer = Integer.parseInt(request.getParameter("answer"));
                
                Boolean succeed = questionBean.saveMultiChoice(quizId, questName, questText, option1, option2, option3, option4, answer);

                // Continue to quiz settings or add new question
                if (request.getParameter("next").equals("Next: Quiz settings")) {
                    response.sendRedirect("quiz/quizInfo.jsp");
                }
                else {
                    response.sendRedirect("quiz/newMultiChoice.jsp");
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
