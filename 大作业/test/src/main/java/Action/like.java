package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class like {

    Connection con;
    public like(Connection con) {
        this.con = con;
    }
    public void insertLike(int blogId, String userId) {
        try {
            String q = "insert into likes(blogId,userId)values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, blogId);
            p.setString(2, userId);
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int countLikeOnPost(int blogId) {
        int count = 0;
        String q = "select count(*) from likes where blogId=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, blogId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int blogId, String userId) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("select * from likes where blogId=? and userId=?");
            p.setInt(1, blogId);
            p.setString(2, userId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception ignored) {
        }
        return f;
    }

    public void deleteLike(int blogId, String userId) {
        try {
            PreparedStatement p = this.con.prepareStatement("delete from likes where blogId=? and userId=? ");
            p.setInt(1, blogId);
            p.setString(2, userId);
            p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
