package Servlet;

import Action.blog;
import Action.getProfile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class search extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            WideSearch(request, response);
        } catch (Exception ignored) {
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private void WideSearch(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Action.search dao = new Action.search();
        HttpSession theSession = request.getSession();
        String searchKey = "%" + request.getParameter("Keyword") + "%";
        theSession.setAttribute("Keyword", searchKey);
        List<getProfile> userInfo = dao.SearchResult(searchKey);
        List<blog> searchBlogs = dao.searchBlogs(searchKey);
        if (userInfo.isEmpty() && searchBlogs.isEmpty()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchBloggersNull.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("search_posts", searchBlogs);
            request.setAttribute("users_info", userInfo);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WideSearch.jsp");
            dispatcher.forward(request, response);
        }
    }
}
