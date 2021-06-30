package Servlet;

import Action.*;
import Action.blog;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class blogger extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
            if (command == null) {
                command = "VIEW";
            }
            switch (command) {
                case "VIEW":
                    viewMemberHomePage(request, response);
                    break;
                case "SEARCH":
                    searchResult(request, response);
                    break;
            }
        } catch (Exception ignored) {
        }
    }

    private void viewMemberHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        getPost dao = new getPost();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        List<blog> tendingPosts = dao.getAllTrendingPosts();
        List<blog> followingPosts = dao.getAllFollowerPosts(username);
        request.setAttribute("TRENDING", tendingPosts);
        request.setAttribute("FOLLOWPOSTS", followingPosts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("memberHomePage.jsp");
        dispatcher.forward(request, response);
    }

    private void searchResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        action action = new action();
        HttpSession theSession = request.getSession();
        String searchKey = request.getParameter("Keyword");
        theSession.setAttribute("Keyword", searchKey);
        List<getProfile> userInfo = action.SearchResult(searchKey);
        List<blog> searchBlogs = action.getAllBlogPosts(searchKey);
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

    public String getServletInfo() {
        return "Short description";
    }

}
