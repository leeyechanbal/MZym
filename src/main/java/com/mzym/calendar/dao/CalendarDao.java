package com.mzym.calendar.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.mzym.calendar.vo.Calendar;
import static com.mzym.common.template.JDBCTemplate.*;

public class CalendarDao {

	Properties prop = new Properties();
	
	public CalendarDao() {
		
		try {
			prop.loadFromXML(CalendarDao.class.getResourceAsStream("/db/mappers/calendar-maper.xml"));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public int calInsert(Connection conn, Calendar cal, String userName, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("calInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			pstmt.setString(3, cal.getCalTR());
			pstmt.setString(4, cal.getStartDate());
			pstmt.setString(5, cal.getEndDate());
			pstmt.setString(6, cal.getCalTitle());
			pstmt.setString(7, cal.getCalContent());
			pstmt.setString(8, cal.getCalColor());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 return result;
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
