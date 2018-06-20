package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookManage {
    //得到所有图书
    public List<Book> findAll() throws SQLException {
        String sql = "select * from book";
        List<Book> booksList = new ArrayList<>();
        ConMysql.prepareConnection();
        ResultSet rs = null;
        try {
            ConMysql.ps = ConMysql.con.prepareStatement(sql);
            rs = ConMysql.ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        booksList = getList(rs);
        return booksList;
    }
    //得到购物车图书
    public List<Book> getCartlist(String cartlist) throws SQLException {
        List<Book> booksList = new ArrayList<>();
        if(cartlist.equals("")||cartlist==null)
        {
            return booksList;
        }
        String sql = "select * from book where id = ?";
        ConMysql.prepareConnection();
        String[] bookIds = cartlist.split(",");
        for(String id:bookIds)
        {
            ResultSet rs = null;
            try {
                ConMysql.ps = ConMysql.con.prepareStatement(sql);
                ConMysql.ps.setString(1,id);
                rs = ConMysql.ps.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            booksList.addAll(getList(rs));
        }
        return  booksList;
    }
    private List<Book> getList(ResultSet rs) throws SQLException {
        List<Book> booksList = new ArrayList<>();
        while(rs!=null&&rs.next())
        {
            Book b = new Book();
            b.setAuthor(rs.getString("author"));
            b.setBookId(Integer.valueOf(rs.getString("id")));
            b.setBookName(rs.getString("name"));
            b.setDetail(rs.getString("detail"));
            b.setPicSource(rs.getString("url"));
            b.setPrice(Float.valueOf(rs.getString("price")));
            booksList.add(b);
        }
        return booksList;
    }
}
