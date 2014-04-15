package servlet;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.AccountBeanLocal;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet", "/ProfileServlet?*"})
public class ProfileServlet extends HttpServlet 
{

    @EJB
    AccountBeanLocal accountBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            System.out.println("ProfileServlet action: " + action);

            if (action.equals("checkIsInstructor")) {
                String userId = request.getParameter("userId");

                response.setContentType("application/json;charset=utf-8");
                JsonObject json = new JsonObject();
                json.addProperty("response", accountBean.isInstructor(userId));

                PrintWriter pw = response.getWriter();
                pw.print(json);
                pw.close();
            }
            else if (action.equals("createInstructor")) {
                String userId = request.getParameter("UserID");
                String name = request.getParameter("Name");
                String email = request.getParameter("Email");
                String gender = request.getParameter("Gender");
                String faculty = request.getParameter("Faculty");
                
                response.setContentType("application/json;charset=utf-8");
                JsonObject json = new JsonObject();
                json.addProperty("response", accountBean.createInstructor(userId, name, email, gender, faculty));

                PrintWriter pw = response.getWriter();
                pw.print(json);
                pw.close();
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
