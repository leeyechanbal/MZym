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
	
	/*
	// 사용x
	public List<Member> selelctMemberList(Connection conn, String userId){
		List<Member> mlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCalendarList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mlist.add(new Member(rset.getString("USER_NAME"),
									 rset.getString("PHONE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
		
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
	
	*/
	
	
	
	
	
	
	
	
	
	
}
