package com.mzym.calendar.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.mzym.calendar.vo.Calendar;
import com.mzym.member.model.vo.Member;
import static com.mzym.common.template.JDBCTemplate.*;

public class CalendarDao {

	Properties prop = new Properties();
	
	public CalendarDao() {
		
		try {
			prop.loadFromXML(CalendarDao.class.getResourceAsStream("/db/mappers/calendar-mapper.xml"));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 캘린더 일정 조회
	public List<Calendar> selectCalendarList(Connection conn, int userNo){
		List<Calendar> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCalendarList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				clist.add(new Calendar(rset.getString("CAL_TR"),
									   rset.getString("START_DATE"),
									   rset.getString("END_DATE"),
									   rset.getString("CAL_TITLE"),
									   rset.getString("CAL_CONTENT"),
									   rset.getString("CAL_COLOR")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return clist;
		
	}
	
	
	// 일정 추가
	public int ptCalendarInsert(Connection conn, Calendar cal, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("ptCalendarInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cal.getCalUserNo());
			pstmt.setString(2, cal.getCalTR());
			pstmt.setString(3, cal.getStartDate());
			pstmt.setString(4, cal.getEndDate());
			pstmt.setString(5, cal.getCalTitle());
			pstmt.setString(6, cal.getCalContent());
			pstmt.setString(7, cal.getCalColor());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		 return result;
	
		
	}
	

	
	
	
	
	
	
	
	
	
}
