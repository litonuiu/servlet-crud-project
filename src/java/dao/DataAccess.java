/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;

/**
 *
 * @author Liton Miah
 */
public class DataAccess {
    public void addNew(News n){
        try {
//            PreparedStatement ps = DBUtils.getPreparedStatement("insert into News values(?,?,?,?,?,?)");
            PreparedStatement ps = DBUtils.getPreparedStatement("insert into News values("                   
                    + n.getId()+",'"
                    + n.getTitle()+"','"
                    + n.getDate()+"','"
                    + n.getDescription()+"','"
                    + n.getDetail()+"','"
                    + n.getCategory()+"','"
                    + n.getImage()+"')");
            
//            ps.setString(1, n.getTitle());
//            ps.setString(2, n.getDate());
//            ps.setString(3, n.getDescription());
//            ps.setString(4, n.getDetail());
//            ps.setString(5, n.getCategory());
//            ps.setString(6, n.getImage());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<News> getAll(){
        List<News> ls = new LinkedList<>();
        SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        SimpleDateFormat newFormat = new SimpleDateFormat("dd-MM-yyyy"); 
        
        try {
            ResultSet rs = DBUtils.getPreparedStatement("select * from News").executeQuery();
            while(rs.next()){
                News n = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                n.setDate(newFormat.format(oldFormat.parse(n.getDate())));
                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ls;
    }
    
    public static List<News> getNewsById(int id){
        List<News> ls = new LinkedList<>();
        String sql = "select * from News where id = " + id;
        try {
            ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
            while(rs.next()){
                News n = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ls;
    }
    
    public void edit(int id, String title, String description, String detail, String category, String image){
        try {
            String sql = "update News set title = '"
                    + title + "', description = '"
                    + description + "', detail = '"
                    + detail + "', category = '"
                    + category + "', image = '"
                    + image + "'"
                    + " where id = " + id;
            
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id){
        try {
            String sql = "delete from News where id = " + id;
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
