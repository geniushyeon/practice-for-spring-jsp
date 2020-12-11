package shop.jamielee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// Data Access Object: 데이터에 접근하는 것을 목적으로 하는 객체 

public class EmpDao {
	public Connection conn;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public EmpDao() {
		conn = new Application().getConn();
		
	}
	
	@SuppressWarnings("finally")
	public List<EmpVo> search(String findString) {
		List<EmpVo> list = new ArrayList<EmpVo>();
		
		try {
			String sql = "SELECT * FROM hr.employees where first_name like ? or email like ? or phone_number like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + findString + "%");
			pstmt.setString(2, "%" + findString + "%");
			pstmt.setString(3, "%" + findString + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpVo empvo = new EmpVo();
				empvo.setEmployee_id(rs.getInt("employee_id"));
				empvo.setFirst_name(rs.getString("first_name"));
				empvo.setEmail(rs.getString("email"));
				empvo.setPhone_number(rs.getString("phone_number"));
				empvo.setSalary(rs.getDouble("salary"));
				
				list.add(empvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
			return list;
		}
		
	}
}
