package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class getPost {
    private final Connection connection;
    public getPost() throws SQLException {
        connection = database.getConnection();
    }
    public List<blog> getAllTrendingPosts() throws SQLException {
        List<blog> Trendingposts = new ArrayList<blog>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from blogs where status=? and likeCount>=? and commentCount>=? ORDER BY date DESC");
        preparedStatement.setString(1, "Accepted");
        preparedStatement.setInt(2, 50);
        preparedStatement.setInt(3, 20);
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
        PreparedStatement statement = connection.prepareStatement("select * from blogs inner join followers where blogs.status=? and blogs.username=followers.followers and followers.username=? ORDER BY date DESC");
        statement.setString(1, "Accepted");
        statement.setString(2, username);
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
}
