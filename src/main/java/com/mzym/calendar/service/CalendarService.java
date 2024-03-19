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
	
	
	public List<Calendar> selectCalendarList(int userNo){
		
		Connection conn = getConnection();
		List<Calendar> clist = cDao.selectCalendarList(conn, userNo);
		close(conn);
		return clist;
		
	}
	
	
	/*
	// 사용 x
	public List<Member> selelctMemberList(String userId){
		Connection conn = getConnection();
		List<Member> mlist = cDao.selelctMemberList(conn, userId);
		close(conn);
		return mlist;
	}
	
	
	
	
	
	public int calInsert(Calendar cal, String userName, String phone) {
		
		Connection conn = getConnection();
		
		int result = cDao.calInsert(conn, cal, userName, phone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	*/

}
