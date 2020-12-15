package shop.jamielee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutoComplete {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public AutoComplete() {
		conn = new Application().getConn();
	
	}
	
	@SuppressWarnings("finally")
	public String getData() {
		StringBuffer stringBuffer = new StringBuffer();
		// String보다 처리 속도가 빠름 
		try {
			String sql = "SELECT first_name FROM hr.employees";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // CRUD
			// insert, update, delete = executeUpdate();
			stringBuffer.append("[");
			rs.next();
			stringBuffer.append("'" + rs.getString("first_name") + "'");
			while(rs.next()) {
				stringBuffer.append(", '" + rs.getString("first_name") + "'");
			}
			stringBuffer.append("]");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			String temp = stringBuffer.toString();
			temp = temp.replace("'", "\"");
			return temp;
		}
		
		
	}
}
