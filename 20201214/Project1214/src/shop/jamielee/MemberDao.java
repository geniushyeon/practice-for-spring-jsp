package shop.jamielee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	Connection conn; // database의 연결 정보 
	PreparedStatement pstmt; // 문자열로 되어 있는 sql 문장을 실행 
	ResultSet rs; // select문의 실행 결과 

	public MemberDao() {
		conn = new Application().getConn();

	}

	@SuppressWarnings("finally")
	public boolean signin(String id, String password) {
		boolean b = false; 
		try {
			String sql = "SELECT count(id) cnt FROM members WHERE id=? AND password=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt >= 1) { 
					b = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return b;
		}
	}
}