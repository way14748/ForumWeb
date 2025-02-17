package com.example.forum;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class ForumDAO {

    final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";

    public Connection open() {
        Connection conn = null;

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }




    public List<Forum> getAll() throws Exception {
        Connection conn = open();
        List<Forum> forums = new ArrayList<>();

        String sql = "select cid, title, FORMATDATETIME(date, 'MM-dd hh:mm') as ndate, media, content";
        sql = sql + " from forum";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        try (conn; ps; rs) {
            while (rs.next()) {
                Forum f = new Forum();
                f.setCid(rs.getInt("cid"));
                f.setTitle(rs.getString("title"));
                f.setDate(rs.getString("ndate"));
                f.setMedia(rs.getString("media"));
                f.setContent(rs.getString("content"));
                forums.add(f);
            }
            return forums;
        }
    }

    public Forum getForum(int cid) throws SQLException {
        Connection conn = open();

        Forum f = new Forum();
        String sql = "select cid, title, FORMATDATETIME(date, 'MM-dd hh:mm')as ndate, media, content from forum where cid = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cid);
        ResultSet rs = ps.executeQuery();

        rs.next();

        try (conn; ps; rs) {
            f.setCid(rs.getInt("cid"));
            f.setTitle(rs.getString("title"));
            f.setDate(rs.getString("ndate"));
            f.setMedia(rs.getString("media"));
            f.setContent(rs.getString("content"));
            return f;
        }
    }

    public void addForum(Forum f) throws Exception {
        Connection conn = open();

        String sql = "insert into forum(title,date,media,content) values(?,CURRENT_TIMESTAMP(),?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        try (conn; ps) {
            ps.setString(1, f.getTitle());
            ps.setString(2, f.getMedia());
            ps.setString(3, f.getContent());
            ps.executeUpdate();
        }
    }

    public void updateForum(Forum f) throws Exception {
        Connection conn = open();

        String sql = "update forum set title = ?, date = CURRENT_TIMESTAMP(), media = ?, content = ? where cid = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        try (conn; ps) {
            ps.setString(1, f.getTitle());
            ps.setString(2, f.getMedia());
            ps.setString(3, f.getContent());
            ps.setInt(4, f.getCid());
            ps.executeUpdate();
        }
    }

    public void delForum(int cid) throws SQLException {
        Connection conn = open();
        String sql = "delete from forum where cid = ?";
        PreparedStatement ps = conn.prepareStatement(sql);

        try (conn; ps) {
            ps.setInt(1, cid);
            if(ps.executeUpdate() == 0) {
                throw new SQLException("데이터 삭제 에러");
            }
        }
    }
}
