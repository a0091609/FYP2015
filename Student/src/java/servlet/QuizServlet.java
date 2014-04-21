package servlet;

import com.google.gson.Gson;
import entity.GameProfile;
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
import session.ModuleBeanLocal;
import session.QuestionBeanLocal;
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
                String userId = request.getSession().getAttribute("userId").toString();
                List<QuizDetails> quizzes = quizBean.studentGetModuleQuiz(userId, moduleId);
                request.setAttribute("quizzes", quizzes);

                request.setAttribute("streak", quizBean.getStreakCount(userId, moduleId));
                request.setAttribute("itemRetry", quizBean.getQuizItemQty(userId, moduleId, "Retry"));
                request.setAttribute("completedQuiz", quizBean.getCompletedQuiz(userId, moduleId));

                request.getRequestDispatcher("/quiz/quiz.jsp").forward(request, response);
            } else if (action.equals("playQuiz")) {
                String quizId = request.getParameter("quizId");
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();

                Boolean authToPlay = quizBean.checkAuthToPlay(userId, moduleId, Long.valueOf(quizId));

                if (authToPlay) {
                    request.getSession().setAttribute("quizId", quizId);
                    //create quiz session
                    quizBean.createQuizSession(userId, Long.valueOf(quizId));

                    GameProfile p = quizBean.getGameProfile(userId, moduleId);
                    request.getSession().setAttribute("initialLvl", p.getExpLevel());

                    List<QuestionDetails> questions = quizBean.getQuizQuestions(Long.valueOf(quizId));
                    request.setAttribute("questions", questions);
                    request.setAttribute("streak", quizBean.getStreakCount(userId, moduleId));
                    request.setAttribute("itemHelp", quizBean.getQuizItemQty(userId, moduleId, "GetHelp"));
                    request.setAttribute("itemFifty", quizBean.getQuizItemQty(userId, moduleId, "Fifty-Fifty"));

                    request.getRequestDispatcher("/quiz/doQuiz.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/Student/QuizServlet?action=viewAllQuiz");
                }
            } else if (action.equals("checkAnswer")) {
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();
                String quizId = request.getSession().getAttribute("quizId").toString();
                String questId = request.getParameter("questId").toString();
                String answer = request.getParameter("option").toString();

                response.setContentType("application/json;charset=utf-8");
                Gson gson = new Gson();
                PrintWriter pw = response.getWriter();
                pw.print(gson.toJson(quizBean.checkAnswer(userId, moduleId, Long.valueOf(quizId), Long.valueOf(questId), answer)));
                pw.close();
            } else if (action.equals("useHints")) {
                String qId = request.getParameter("qId").toString();
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();

                // check if enough item
                String hints = quizBean.useHints(userId, moduleId, Long.valueOf(qId));

                response.setContentType("application/json;charset=utf-8");
                Gson gson = new Gson();
                PrintWriter pw = response.getWriter();
                pw.print(gson.toJson(hints));
                pw.close();
            } else if (action.equals("useFifty")) {
                String questionId = request.getParameter("qId").toString();
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();
                String corrAns = quizBean.useFifty(userId, moduleId, Long.valueOf(questionId));

                response.setContentType("application/json;charset=utf-8");
                Gson gson = new Gson();
                PrintWriter pw = response.getWriter();
                pw.print(gson.toJson(corrAns));
                pw.close();
            } else if (action.equals("getItemQty")) {
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();
                String itemName = request.getParameter("itemName").toString();

                response.setContentType("application/json;charset=utf-8");
                Gson gson = new Gson();
                PrintWriter pw = response.getWriter();
                pw.print(gson.toJson(quizBean.getQuizItemQty(userId, moduleId, itemName)));
                pw.close();
            } else if (action.equals("finishQuiz")) {
                String userId = request.getSession().getAttribute("userId").toString();
                String moduleId = request.getSession().getAttribute("moduleId").toString();
                String quizId = request.getSession().getAttribute("quizId").toString();
                String initialLvl = request.getSession().getAttribute("initialLvl").toString();

                // the following sequence ensures latest EXP points and levels are retrieved
                quizBean.finishQuiz(userId, moduleId, quizId);
                request.setAttribute("streakBonus", quizBean.getSreakBonus(userId, moduleId));
                request.setAttribute("results", quizBean.getQuizResults(userId, Long.valueOf(quizId)));
                request.setAttribute("initialLvl", initialLvl);
                request.setAttribute("profile", quizBean.getProfileDetails(userId, moduleId));
                request.setAttribute("ptsToNext", quizBean.ptsToNextLvl(userId, moduleId));
                request.setAttribute("leaderboardPos", quizBean.getLeaderboardPos(userId, moduleId));
                request.setAttribute("unlockedQuiz", quizBean.getUnlockedQuiz(Long.valueOf(quizId)));
                request.setAttribute("newItem", quizBean.getNewItem(userId, moduleId));

                request.getRequestDispatcher("quiz/results.jsp").forward(request, response);
            } else if (action.equals("sendFeedback")) {
                String userId = request.getSession().getAttribute("userId").toString();
                String quizId = request.getSession().getAttribute("quizId").toString();
                String feedback = request.getParameter("feedback");

                quizBean.saveStudentFeedback(userId, Long.valueOf(quizId), feedback);
                
                request.getSession().removeAttribute("quizId");
                response.sendRedirect("/Student/QuizServlet?action=viewAllQuiz");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
