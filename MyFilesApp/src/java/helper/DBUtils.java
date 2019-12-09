/**
 * @author Georgia Papavgeri
 */
package helper;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtils {
    
    public static Connection getConnection() {
        Connection conn = null;

        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/files_db");
            conn = ds.getConnection();
        } catch (NamingException | SQLException ex) {

        }
        return conn;
    }
    
}
