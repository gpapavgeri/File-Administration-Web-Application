/**
 * @author Georgia Papavgeri
 */
package dao;

import helper.DBUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.File;

public class FileDao {

    public FileDao() {
    }

    public void insertFile(Part p) {
        String insertQuery = "INSERT INTO files_db.files VALUES (null, ?, ?)";
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement pstm = con.prepareStatement(insertQuery);
            pstm.setString(1, p.getSubmittedFileName());
            pstm.setBinaryStream(2, p.getInputStream());
            pstm.executeUpdate();

            p.write("C:\\uploads\\" + p.getSubmittedFileName());

        } catch (SQLException | IOException ex) {
            Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<File> getAllFiles() {
        List<File> result = new ArrayList<>();
        Connection con = DBUtils.getConnection();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM files_db.files");
            while (rs.next()) {
                File f = new File();
                f.setFileId(rs.getInt(1));
                f.setFileName(rs.getString(2));
                f.setFileAsBlob(rs.getBlob(3));
                result.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public File getById(int id) {
        File file = new File();
        String selectQuery = "SELECT * FROM files_db.files where id=?";
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement pst = con.prepareStatement(selectQuery);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                file.setFileId(rs.getInt(1));
                file.setFileName(rs.getString(2));
                file.setFileAsBlob(rs.getBlob(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return file;
    }

    public void deleteFile(int id) {
        String deleteQuery = "DELETE FROM files_db.files WHERE ID =?";
        Connection con = DBUtils.getConnection();
        try {
            PreparedStatement pstm = con.prepareStatement(deleteQuery);
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(FileDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
