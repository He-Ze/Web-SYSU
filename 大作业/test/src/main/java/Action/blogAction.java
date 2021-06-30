package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class blogAction {
    private final Connection connection;

    public blogAction() throws SQLException {
        connection = database.getConnection();
    }

    public List<blog> getAllTrendingPosts() throws SQLException {
        List<blog> Trendingposts = new ArrayList<blog>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from blogs where likeCount>=? and commentCount>=? ORDER BY date DESC");
        preparedStatement.setInt(1, 50);
        preparedStatement.setInt(2, 20);
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
            Trendingposts.add(postsList);
        }
        return Trendingposts;
    }

    public List<blog> getAllFollowerPosts(String username) throws SQLException {
        List<blog> blogs = new ArrayList<>();
        PreparedStatement statement = connection.prepareStatement("select * from blogs inner join followers where blogs.username=followers.followers and followers.username=?");
        statement.setString(1, username);
        ResultSet rs = statement.executeQuery();
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
            blogs.add(postsList);
        }
        return blogs;
    }

    public List<blogger> getUserInfo(String username) throws SQLException {
        List<blogger> userInfo = new ArrayList<blogger>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username=?");
        preparedStatement.setString(1, username);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            String Username = rs.getString("username");
            String LastName = rs.getString("lastName");
            String PhotoUrl = rs.getString("photoUrl");
            String firstName = rs.getString("firstName");
            String role = rs.getString("roles");
            blogger theuserInfo = new blogger(Username, firstName, PhotoUrl, LastName, role);
            userInfo.add(theuserInfo);
        }
        return userInfo;
    }

    public List<blog> getPostInfo(String username) throws SQLException {
        List<blog> postInfo = new ArrayList<blog>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from blogs where username=?");
        preparedStatement.setString(1, username);
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
            blog thepostInfo = new blog(BlogId, Category, Title, Body, imageURL, userName, date, likeCount, commentCount);
            postInfo.add(thepostInfo);
        }
        return postInfo;
    }
}
