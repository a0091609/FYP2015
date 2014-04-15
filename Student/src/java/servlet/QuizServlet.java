package servlet;

import com.google.gson.Gson;
import helper.QuestionDetails;
import helper.QuizDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.QuizBeanLocal;

@WebServlet(name = "QuizServlet", urlPatterns = {"/QuizServlet", "/QuizServlet?*"})
public class QuizServlet extends HttpServlet {

    @EJB
    private QuizBeanLocal quizBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("userId") == null) {
                response.sendRedirect(request.getContextPath());
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
                } else {
                    moduleId = request.getSession().getAttribute("moduleId").toString();
                }

                List<QuizDetails> quizzes = quizBean.studentGetModuleQuiz(moduleId);
                request.setAttribute("quizzes", quizzes);

                request.getRequestDispatcher("/quiz/quiz.jsp").forward(request, response);
            } else if (action.equals("playQuiz")) {
                String quizId = request.getParameter("quizId");
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();

                Boolean authToPlay = quizBean.checkAuthToPlay(userId, moduleId, Long.valueOf(quizId));

                if (authToPlay) {
                    request.getSession().setAttribute("quizId", quizId);
                    List<QuestionDetails> questions = quizBean.getQuizQuestions(Long.valueOf(quizId));

                    request.setAttribute("questions", questions);
                    request.getRequestDispatcher("/quiz/doQuiz.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/Student/QuizServlet?action=viewAllQuiz");
                }
            } else if (action.equals("checkAnswer")) {
                String questId = request.getParameter("questId").toString();
                String answer = request.getParameter("option").toString();

                response.setContentType("application/json;charset=utf-8");
                Gson gson = new Gson();
                PrintWriter pw = response.getWriter();
                pw.print(gson.toJson(quizBean.checkAnswer(Long.valueOf(questId), answer)));
                pw.close();
            }
        } catch (Exception e) {

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
