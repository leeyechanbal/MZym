package com.mzym.calendar.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.commit;
import static com.mzym.common.template.JDBCTemplate.getConnection;
import static com.mzym.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mzym.calendar.dao.CalendarDao;
import com.mzym.calendar.vo.Calendar;
import com.mzym.member.model.vo.Member;

public class CalendarService {
	
	CalendarDao cDao = new CalendarDao();
	
	// 캘린더 일정 조회
	public List<Calendar> selectCalendarList(int trNo){
		
		Connection conn = getConnection();
		List<Calendar> clist = cDao.selectCalendarList(conn, trNo);
		close(conn);
		return clist;
		
	}
	
	
	
	
	// 일정 추가 
	public int ptCalendarInsert(Calendar cal, String userName,String phone) {
		
		Connection conn = getConnection();
		
		int result = cDao.ptCalendarInsert(conn, cal, userName, phone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	// 일정 수정
	public int calendarUpdate(Calendar cal, String calUserName, String calPhone) {
		Connection conn = getConnection();
		
		int result = cDao.calendarUpdate(conn, cal, calUserName, calPhone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	}
	
	
	// 일정 삭제
	public int calendarDelete(int calNo) {
		Connection conn = getConnection();
		int result = cDao.calendarDelete(conn, calNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public List<Calendar> selectSearchList(String phone, String userName, String startDate, String endDate, int trNo){
		Connection conn = getConnection();
		List<Calendar> searchList = cDao.selectSearchList(conn, phone, userName, startDate, endDate, trNo);
		close(conn);
		return searchList;
	}
	
	


}
