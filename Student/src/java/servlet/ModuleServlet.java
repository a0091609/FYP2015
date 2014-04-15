package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import entity.Module;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ModuleBeanLocal;

@WebServlet(name = "ModuleServlet", urlPatterns = {"/ModuleServlet", "/ModuleServlet?*"})
public class ModuleServlet extends HttpServlet
{

    @EJB
    ModuleBeanLocal moduleBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            System.out.println("ModuleServlet action: " + action);

            if (action.equals("createModule")) {
                String moduleId = request.getParameter("id");
                String moduleCode = request.getParameter("code");
                String moduleName = request.getParameter("name");
                String moduleCreator = request.getParameter("creatorId");
                String userId = request.getParameter("userId");

                response.setContentType("application/json;charset=utf-8");
                JsonObject json = new JsonObject();
                json.addProperty("response", moduleBean.saveStudentModule(moduleId, moduleCode, moduleName, moduleCreator, userId));

                PrintWriter pw = response.getWriter();
                pw.print(json);
                pw.close();
            }
            else if (action.equals("getStudentModules")) {
                String userId = request.getSession().getAttribute("userId").toString();
                List<Module> list = moduleBean.getStudentModules(userId);
                response.setContentType("application/json;charset=utf-8");
                response.getWriter().write(new Gson().toJson(list));
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
