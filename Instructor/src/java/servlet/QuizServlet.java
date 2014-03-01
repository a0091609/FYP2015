/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import helper.QuizDetails;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            if (request.getSession().getAttribute("userId") == null) {
                response.sendRedirect("/Instructor/dashboard.jsp");
            }
            String action = request.getParameter("action");
            System.out.println("QuizServlet action: " + action);

            if (action.equals("viewAllQuiz")) {
                String moduleId = "", moduleName = "";
                HttpSession session = request.getSession();

                if (session.getAttribute("moduleId") == null) {
                    moduleId = request.getParameter("moduleId");
                    moduleName = request.getParameter("moduleName");

                    request.getSession().setAttribute("moduleId", moduleId);
                    request.getSession().setAttribute("moduleName", moduleName);
                }
                else {
                    moduleId = request.getSession().getAttribute("moduleId").toString();
                }

                List<QuizDetails> quizzes = quizBean.getModuleQuiz(moduleId);
                request.setAttribute("quizzes", quizzes);

                request.getRequestDispatcher("/quiz/allQuizzes.jsp").forward(request, response);
            }
            else if (action.equals("createQuiz")) {
                RequestDispatcher rd = request.getRequestDispatcher("/quiz/newQuiz.jsp");
                rd.forward(request, response);
            }
            else if (action.equals("saveNewQuiz")) {
                String quizName = request.getParameter("quizName");
                String moduleId = request.getSession().getAttribute("moduleId").toString();

                Long quizId = quizBean.saveNewQuiz(quizName, moduleId);

                request.getSession(false).setAttribute("quizId", quizId);
                request.getSession(false).setAttribute("quizName", quizName);

                response.sendRedirect("quiz/newMultiChoice.jsp");
            }
            else if (action.equals("saveQuizInfo")) {
                String quizId = request.getSession().getAttribute("quizId").toString();
                String descr = request.getParameter("descr");
                String difficultyLvl = request.getParameter("difficulty");
                
                String dateRange = request.getParameter("datesOpen");
                String dateOpen = dateRange.substring(0, 10);
                String dateClose = dateRange.substring(14);

                Boolean succeed = quizBean.saveQuizInfo(Long.parseLong(quizId), descr,
                        difficultyLvl, convertToDateObj(dateOpen), convertToDateObj(dateClose));

                request.getSession().removeAttribute("quizId");
                request.getSession().removeAttribute("quizName");

                response.sendRedirect("/Instructor/QuizServlet?action=viewAllQuiz");
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private Date convertToDateObj(String date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Date dateObj;
        try {
            dateObj = df.parse(date);
            return dateObj;
        }
        catch (ParseException e) {
            e.printStackTrace();
            return null;
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
