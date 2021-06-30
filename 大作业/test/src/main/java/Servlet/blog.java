package Servlet;

import Action.*;
import Action.blogger;
import Action.remark;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import static java.lang.System.out;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class blog extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String command = request.getParameter("command");
            if (command == null) {
                command = "HomePage";
            }
            switch (command) {
                case "VIEW":
                    viewBlog(request, response);
                    break;
                case "ONEBLOG":
                    viewSingleBlog(request, response);
                    break;
                case "HomePage":
                    viewHomePage(request, response);
                    break;
                case "PERSONALPROFILE":
                    personalProfile(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(blog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String command = request.getParameter("command");
            if (command == null) {
                command = "ADD";
            }
            if ("ADD".equals(command)) {
                createBlog(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(blog.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void createBlog(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            action action = new action();
            String category = request.getParameter("Category");
            String title = request.getParameter("Title");
            String body = request.getParameter("Body");
            Date submittedDate = new Date(System.currentTimeMillis());
            String date = submittedDate.toString();
            String status = "pending";
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            Part part = request.getPart("fileToUpload");
            String fileName = randomIdentifier() + ".jpg";
            String savePath = "BlogImages" + File.separator + fileName;
            File fileSaveDir = new File(savePath);
            part.write(this.getClass().getClassLoader().getResource("").getPath() + "../../pictures" +fileName);
            Action.blog blog = new Action.blog(username, title, body, savePath, category, date, status);
            if (action.createBlog(blog)) {
                System.out.println("error");
            } else {
                PrintWriter writer = response.getWriter();
                writer.print("<script type=\"text/javascript\">");
                writer.print("alert('博文发布成功！');");
                writer.print("location='blog';");
                writer.print("</script>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(blog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void viewBlog(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        action action = new action();
        List<Action.blog> blogs = action.viewBlog(username);
        request.setAttribute("BLOGLIST", blogs);
        int size = blogs.size();
        if (size == 0) {
            out.print("Empty list");
        }
        Action.blog likeBlog = action.mostLikedPost(username);
        Action.blog commentBlog = action.mostCommentedPost(username);
        request.setAttribute("likeBlog", likeBlog);
        request.setAttribute("commentBlog", commentBlog);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewBlogs.jsp");
        dispatcher.forward(request, response);
    }

    final String lexicon = "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345674890";
    final java.util.Random rand = new java.util.Random();
    final Set<String> identifiers = new HashSet<String>();

    public String randomIdentifier() {
        StringBuilder builder = new StringBuilder();
        while (builder.toString().length() == 0) {
            int length = rand.nextInt(5) + 5;
            for (int i = 0; i < length; i++) {
                builder.append(lexicon.charAt(rand.nextInt(lexicon.length())));
            }
            if (identifiers.contains(builder.toString())) {
                builder = new StringBuilder();
            }
        }
        return builder.toString();
    }

    static void viewSingleBlog(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String BlogId = request.getParameter("blogId");
        HttpSession session = request.getSession();
        if (BlogId.equals("")) {
            BlogId = (String) session.getAttribute("blogId");
        }
        String username = (String) session.getAttribute("username");
        action doa = new action();
        List<Action.blog> blogs = doa.singleBlog(BlogId);
        request.setAttribute("BLOGLIST", blogs);
        request.setAttribute("user", username);
        viewAllComments(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/singleBlogView.jsp");
        dispatcher.forward(request, response);
    }

    private static void viewAllComments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("Text/html");
        remarkAction dao = new remarkAction(database.getConnection());
        HttpSession session = request.getSession();
        String BlogId = request.getParameter("blogId");
        if (BlogId.equals("")) {
            BlogId = (String) session.getAttribute("blogId");
        }
        List<remark> comments = dao.getAllRemark(BlogId);
        request.setAttribute("COM_LIST", comments);

        RequestDispatcher rs = request.getRequestDispatcher("/singleBlogView.jsp");
        rs.forward(request, response);

    }

    private void viewHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        blogAction dao = new blogAction();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        List<Action.blog> tendingPosts = dao.getAllTrendingPosts();
        List<Action.blog> followingPosts = dao.getAllFollowerPosts(username);
        request.setAttribute("TRENDING", tendingPosts);
        request.setAttribute("FOLLOWPOSTS", followingPosts);
        RequestDispatcher rs = request.getRequestDispatcher("/BloggerHomePage.jsp");
        rs.forward(request, response);

    }

    private void personalProfile(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        blogAction dao = new blogAction();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        List<blogger> userInfo = dao.getUserInfo(username);
        List<Action.blog> postsInfo = dao.getPostInfo(username);
        request.setAttribute("USER_LIST", userInfo);
        request.setAttribute("POST_LIST", postsInfo);
        RequestDispatcher rs = request.getRequestDispatcher("PersonalProfile.jsp");
        rs.forward(request, response);

    }

}
