package com.mzym.inbody.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.mzym.calendar.dao.CalendarDao;
import com.mzym.mypage.model.vo.Inbody;
import static com.mzym.common.template.JDBCTemplate.*;

public class InbodyDao {
	
	Properties prop = new Properties();
	
	public InbodyDao() {
		
		try {
			prop.loadFromXML(CalendarDao.class.getResourceAsStream("/db/mappers/member-mapper.xml"));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public Inbody selectInbody(Connection conn, String userPhone) {
		Inbody ib = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInbody");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPhone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				ib = new Inbody(rset.getString("USER_NAME"),
								rset.getInt("BODY_HEIGHT"),
								rset.getInt("BODY_WEIGHT"),
								rset.getInt("BODY_METABOLISM"),
								rset.getInt("BODY_FAT")
								);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return ib;
		
	}
	
	
	public int updateInbody(Connection conn, Inbody ib, String userPhone) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInbody");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ib.getBodyHeight());
			pstmt.setInt(2, ib.getBodyWeight());
			pstmt.setInt(3, ib.getBadyMetabolism());
			pstmt.setInt(4, ib.getBodyFat());
			pstmt.setString(5, userPhone);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	

}
