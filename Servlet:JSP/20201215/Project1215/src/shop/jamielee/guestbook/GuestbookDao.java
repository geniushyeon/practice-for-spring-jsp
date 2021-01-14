package shop.jamielee.guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.jamielee.Application;

public class GuestbookDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public GuestbookDao() {
		conn = new Application().getConn();
	}
	
	@SuppressWarnings("finally")
	public List<GuestbookVo> select(String findStr) { 
		List<GuestbookVo> list = new ArrayList<>();
		
		try {
			String sql = "SELECT serial, id, mdate, document FROM guestbook WHERE id like ? or document like ? ORDER BY serial DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findStr + "%");
			pstmt.setString(2, "%" + findStr + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestbookVo guestbookVo = new GuestbookVo();
				guestbookVo.setSerial(rs.getInt("serial"));
				guestbookVo.setId(rs.getString("id"));
				guestbookVo.setMdate(rs.getString("mdate"));
				guestbookVo.setDocument(rs.getString("document"));
				
				list.add(guestbookVo);
			
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
		}
	}
	
	public void update() {
		
	}
	
	public void insert() {
		
	}
	
	public void delete() {
		
	}
}
