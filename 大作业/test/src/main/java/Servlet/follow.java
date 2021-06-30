package Servlet;

import Action.*;
import Action.blog;
import Action.blogger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

public class follow extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String userRole = (String) session.getAttribute("role");
        String follower = request.getParameter("follower");
        followAction fw = new followAction(database.getConnection());
        if (fw.isFollowing(username, follower)) {
            fw.unfollow(username, follower);
        } else {
            fw.follow1(username, follower);
        }
        ListUsers(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
            if (command == null) {
                ListUsers(request, response);
            }
            switch (Objects.requireNonNull(command)) {
                case "USERS":
                    ListUsers(request, response);
                    break;
                case "FOLLOW":
                    followUser(request, response);
                    break;
                case "CHECK":
                    processRequest(request, response);
                    break;
                case "VIEWPAGE":
                    viewBloggerPro(request, response);
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(follow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void ListUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
        followAction dao = new followAction();
        List<blogger> users = dao.viewAllUsers();
        request.setAttribute("USERLIST", users);
        followers(request, response);
    }

    private void followUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        followAction dao = new followAction();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String Follow = request.getParameter("follower");
        String Status = "";
        Action.follow follow = new Action.follow(username, Follow, Status);
        dao.follow(follow);
        ListUsers(request, response);

    }

    private void followers(HttpServletRequest request, HttpServletResponse response) throws Exception {
        followAction dao = new followAction();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        List<blogger> followers = dao.viewAllFollowers(username);
        request.setAttribute("FOLLOWERSLIST", followers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/followers.jsp");
        dispatcher.forward(request, response);
    }

    private void viewBloggerPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
        followAction dao = new followAction();
        String username = request.getParameter("username");
        List<blog> posts = dao.getAllBloggerPosts(username);
        request.setAttribute("POST_LIST", posts);
        viewUserProfile(request, response);
    }

    private void viewUserProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        followAction dao = new followAction(database.getConnection());
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("username");
        String username = request.getParameter("username");
        List<blogger> posts = dao.getAllUserDetails(username);
        request.setAttribute("USER_LIST", posts);
        request.setAttribute("user", user);
        if (posts.isEmpty()) {
            RequestDispatcher rs = request.getRequestDispatcher("BloggerProfileViewNull.jsp");
            rs.forward(request, response);
        } else {
            RequestDispatcher rs = request.getRequestDispatcher("BloggerProfileView.jsp");
            rs.forward(request, response);
        }
    }

    public String getServletInfo() {
        return "Short description";
    }
}
