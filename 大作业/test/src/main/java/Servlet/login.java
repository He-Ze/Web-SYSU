package Servlet;

import Action.authenticateUser;
import Action.blogger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            authenticateUser dao = new authenticateUser();
            blogger user = new blogger(username, password);
            blogger authenticatedUser = dao.authenticateUser(user);
            if (authenticatedUser == null) {
                out.print("<script type=\"text/javascript\">");
                out.print("alert('用户不存在或密码错误');");
                out.print("</script>");
                request.getRequestDispatcher("index.html").include(request, response);
            } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("firstName", authenticatedUser.getFirstName());
                    session.setAttribute("lastName", authenticatedUser.getLastName());
                    session.setAttribute("role", "blogger");
                    response.sendRedirect("blog");
                }
            } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public String getServletInfo() {
        return "Short description";
    }

}
