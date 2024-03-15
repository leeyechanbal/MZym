package com.mzym.calendar.service;

import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.mzym.calendar.dao.CalendarDao;
import com.mzym.calendar.vo.Calendar;

public class CalendarService {
	
	CalendarDao cDao = new CalendarDao();
	
	
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
	

}
