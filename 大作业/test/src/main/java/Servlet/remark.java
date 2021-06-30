package Servlet;

import Action.remarkAction;
import Action.database;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class remark extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
            if (command == null) {
                command = "VIEWALLC";
            }
            switch (command) {
                case "COMMENT":
                    addComment(request, response);
                    break;
                case "DELETE":
                    deleteComment(request, response);
                    break;
                default:
                    break;

            }
        } catch (Exception ex) {
            Logger.getLogger(blog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            remarkAction dao = new remarkAction(database.getConnection());
            Date submittedDate = new Date(System.currentTimeMillis());
            String Date = submittedDate.toString();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String Comment = request.getParameter("comment");
            String BlogId = request.getParameter("blogId");
            session.setAttribute("blogId", BlogId);
            Action.remark comment = new Action.remark(username, Comment, BlogId, Date);
            dao.addRemark(comment);
            blog.viewSingleBlog(request, response);
        }
    }

    private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        remarkAction dao = new remarkAction(database.getConnection());
        int commentId = Integer.parseInt(request.getParameter("commentId"));
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        dao.deleteComment(commentId, username);
        String role = (String) session.getAttribute("role");
        String BlogId = request.getParameter("blogId");
        session.setAttribute("blogId", BlogId);
        if (role.equalsIgnoreCase("member")) {
            blog.viewSingleBlog(request, response);
        } else if (role.equalsIgnoreCase("blogger")) {
            blog.viewSingleBlog(request, response);
        }
    }
}
