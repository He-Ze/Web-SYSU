package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class action {

    private final Connection connection;
    public action() throws SQLException {
        connection = database.getConnection();
    }
    public boolean createBlog(blog blog) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into blogs(title,body,imageUrl,username,category,date,status,likeCount,commentCount)" + "values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getBody());
            ps.setString(3, blog.getImageURL());
            ps.setString(4, blog.getCategory());
            ps.setString(5, blog.getAuthor());
            ps.setString(6, blog.getDate());
            ps.setString(7, blog.getStatus());
            ps.setInt(8, 2);
            ps.setInt(9, 2);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(action.class.getName()).log(Level.SEVERE, null, ex);
            return true;
        }
        return false;
    }

    public blog mostLikedPost(String username) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM blogs where username=? ORDER BY likeCount DESC ;");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int blogId = rs.getInt("blogId");
        String title = rs.getString("title");
        String body = rs.getString("body");
        String imageUrl = rs.getString("imageUrl");
        String category = rs.getString("category");
        String author = rs.getString("username");
        String date = rs.getString("date");
        return new blog(blogId, category, title, body, imageUrl, author, date);
    }

    public blog mostCommentedPost(String username) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM blogs where username=? ORDER BY commentCount DESC ;");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int blogId = rs.getInt("blogId");
        String title = rs.getString("title");
        String body = rs.getString("body");
        String imageUrl = rs.getString("imageUrl");
        String category = rs.getString("category");
        String author = rs.getString("username");
        String date = rs.getString("date");
        return new blog(blogId, category, title, body, imageUrl, author, date);
    }

    public List<blog> viewBlog(String username) throws SQLException {
        List<blog> blogs = new ArrayList<blog>();
        PreparedStatement ps = connection.prepareStatement("select * from blogs where username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int blogId = rs.getInt("blogId");
            String title = rs.getString("title");
            String body = rs.getString("body");
            String imageUrl = rs.getString("imageUrl");
            String category = rs.getString("category");
            String author = rs.getString("username");
            String date = rs.getString("date");
            blog myBlog = new blog(blogId, category, title, body, imageUrl, author, date);
            blogs.add(myBlog);
        }
        return blogs;
    }

    public List<blog> singleBlog(String blogId) throws SQLException {
        List<blog> blogs = new ArrayList<blog>();
        PreparedStatement ps = connection.prepareStatement("select * from blogs where blogId=?");
        ps.setString(1, blogId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String title = rs.getString("title");
            String body = rs.getString("body");
            String imageUrl = rs.getString("imageUrl");
            String category = rs.getString("category");
            String author = rs.getString("username");
            String date = rs.getString("date");
            blog myBlog = new blog(Integer.parseInt(blogId), category, title, body, imageUrl, author, date);
            blogs.add(myBlog);
        }
        return blogs;
    }

    public List<getProfile> SearchResult(String searchKey) throws SQLException {
        List<getProfile> userInfo = new ArrayList<getProfile>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from users inner join followers where follower.username!=users.username users.roles=? and users.firstName=? or users.lastname=? or users.username=?");
        preparedStatement.setString(1, "blogger");
        preparedStatement.setString(2, searchKey);
        preparedStatement.setString(3, searchKey);
        preparedStatement.setString(4, searchKey);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            String Username = rs.getString("username");
            String LastName = rs.getString("lastName");
            String PhotoUrl = rs.getString("photoUrl");
            String firstName = rs.getString("firstName");
            getProfile theuserInfo = new getProfile(Username, firstName, PhotoUrl, LastName);
            userInfo.add(theuserInfo);
        }
        return userInfo;

    }

    public List<blog> getAllBlogPosts(String searchKey) throws SQLException {
        List<blog> posts = new ArrayList<blog>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from blogs where status=? and title=? or body=?");
        preparedStatement.setString(1, "Accepted");
        preparedStatement.setString(2, searchKey);
        preparedStatement.setString(3, searchKey);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int BlogId = rs.getInt("blogId");
            String Title = rs.getString("title");
            String imageURL = rs.getString("imageUrl");
            String userName = rs.getString("username");
            String Category = rs.getString("category");
            String Body = rs.getString("body");
            String date = rs.getString("date");
            int likeCount = rs.getInt("likeCount");
            int commentCount = rs.getInt("commentCount");
            blog postsList = new blog(Category, Title, Body, imageURL, userName, BlogId, date, likeCount, commentCount);
            posts.add(postsList);
        }
        return posts;
    }
}
