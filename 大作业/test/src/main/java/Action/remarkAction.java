package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class remarkAction {

    Connection con;
    public remarkAction(Connection con) {
        this.con = con;
    }
    public void addRemark(remark r) {
        try {
            PreparedStatement ps = con.prepareStatement("insert into comments(username,blogId,comment,date)" + "values(?,?,?,?)");
            ps.setString(1, r.getUsername());
            ps.setString(2, r.getBlogId());
            ps.setString(3, r.getComment());
            ps.setString(4, r.getDate());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(action.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<remark> getAllRemark(String BlogId) {
        List<remark> comments = new ArrayList<>();
        try {
            PreparedStatement statement = con.prepareStatement("select * from comments where blogId = ?");
            statement.setString(1, BlogId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String Username = rs.getString("username");
                String Comment = rs.getString("comment");
                String Date = rs.getString("date");
                int CommentId = rs.getInt("commentId");
                remark comme = new remark(Username, Comment, Date, CommentId, BlogId);
                comments.add(comme);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }

    public void deleteComment(int commentId, String username) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("delete from comments where commentId=? and username=?");
            preparedStatement.setInt(1, commentId);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
