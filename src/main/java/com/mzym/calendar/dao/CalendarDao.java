package com.mzym.calendar.dao;

import static com.mzym.common.template.JDBCTemplate.close;

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
	public List<Calendar> selectCalendarList(Connection conn, int trNo){
		List<Calendar> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCalendarList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trNo);
			pstmt.setInt(2, trNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				clist.add(new Calendar(rset.getInt("CAL_NO"),
									   rset.getString("USER_NAME"),
									   rset.getString("START_DATE"),
									   rset.getString("END_DATE"),
									   rset.getString("PHONE"),
									   rset.getString("WRITER"),
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
	public int ptCalendarInsert(Connection conn, Calendar cal, String userName, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("ptCalendarInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			pstmt.setInt(3, cal.getCalTR());
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
	

	public int calendarUpdate(Connection conn, Calendar cal, String calUserName, String calPhone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("calendarUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, calUserName);
			pstmt.setString(2, calPhone);
			pstmt.setString(3, cal.getStartDate());
			pstmt.setString(4, cal.getEndDate());
			pstmt.setString(5, cal.getCalTitle());
			pstmt.setString(6, cal.getCalContent());
			pstmt.setString(7, cal.getCalColor());
			pstmt.setInt(8, cal.getCalNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	
	public int calendarDelete(Connection conn, int calNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("calendarDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	
	public List<Calendar> selectSearchList(Connection conn, String phone, String userName, String startDate, String endDate, int trNo){
		List<Calendar> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trNo);
			pstmt.setInt(2, trNo);
			pstmt.setString(3, phone);
			pstmt.setString(4, userName);
			pstmt.setString(5, startDate);
			pstmt.setString(6, endDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Calendar(rset.getInt("CAL_NO"),
									  rset.getString("USER_NAME"),
									  rset.getString("START_DATE"),
									  rset.getString("END_DATE"),
									  rset.getString("PHONE"),
									  rset.getString("WRITER"),
									  rset.getString("CAL_TITLE"),
									  rset.getString("CAL_CONTENT"),
									  rset.getString("CAL_COLOR")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
	
	
}
