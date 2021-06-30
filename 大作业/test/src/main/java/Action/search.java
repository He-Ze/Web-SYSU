package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class search {
    private final Connection connection;
    public search() throws SQLException {
        connection = database.getConnection();
    }
    public List<getProfile> SearchResult(String searchKey) throws SQLException {
        List<getProfile> userInfo = new ArrayList<getProfile>();
        PreparedStatement preparedStatement = connection.prepareStatement("select username,firstName,lastName,photoUrl from users where roles like ? and firstName like ? or lastname  like ?  or username like ?");
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

    public List<blog> searchBlogs(String searchKey) throws SQLException {
        List<blog> posts = new ArrayList<blog>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from blogs where status=? and title like ? or category like ?");
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
            blog postsList = new blog(BlogId, Category, Title, Body, imageURL, userName, date, likeCount, commentCount);
            posts.add(postsList);
        }
        return posts;
    }
}
