package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class authenticateUser {
    private final Connection connection;
    public authenticateUser() throws SQLException {
        connection = database.getConnection();
    }
    public blogger authenticateUser(blogger user) {
        blogger validatedUser;
        try {
            PreparedStatement ps = connection.prepareStatement("select username,firstName, lastName, password, roles from users where username=? and password=?");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String password = rs.getString("password");
                String role = rs.getString("roles");
                if (username.equalsIgnoreCase(user.getUsername()) && password.equalsIgnoreCase(user.getPassword()) && role.equals("blogger")) {
                    validatedUser = new blogger(firstName, lastName, role);
                    return validatedUser;
                }
            }
        } catch (Exception ex) {
            System.out.println("用户认证错误: " + ex);
        }
        return null;
    }
}
