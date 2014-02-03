/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.QuizBeanLocal;

/**
 *
 * @author Chih Yong
 */
@WebServlet(name = "QuizServlet", urlPatterns = {"/QuizServlet", "/QuizServlet?*"})
public class QuizServlet extends HttpServlet
{

    @EJB
    QuizBeanLocal quizBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("session userId: " + request.getSession().getAttribute("userId"));
            if (request.getSession().getAttribute("userId") == null) {
                response.sendRedirect("/Instructor/workspace.jsp");
            }
            String action = request.getParameter("action");
            System.out.println("QuizServlet action: " + action);

            if (action.equals("createQuiz")) {
                RequestDispatcher rd = request.getRequestDispatcher("/quiz/newQuiz.jsp");
                rd.forward(request, response);
            }
            else if (action.equals("saveNewQuiz")) {
                String quizName = request.getParameter("quizName");
                String moduleId = request.getParameter("moduleId");

                Long quizId = quizBean.saveNewQuiz(quizName, moduleId);

                request.setAttribute("quizId", quizId);
                request.setAttribute("quizName", quizName);

                request.getRequestDispatcher("/quiz/newQuestion.jsp").forward(request, response);
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
