package com.example.demo.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardController {
	JdbcTemplate jdbcTemplate;
	
	public BoardController(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@RequestMapping(value = "board_select", method = RequestMethod.GET)
	public String select() {
		String result = "";
		
		try {
			Connection conn = jdbcTemplate.getDataSource().getConnection();
			PreparedStatement pstmt;
			ResultSet rs;
			
			String sql = "SELECT id FROM board";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result += rs.getString("id") + "<br/>";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return result;
	}
}
