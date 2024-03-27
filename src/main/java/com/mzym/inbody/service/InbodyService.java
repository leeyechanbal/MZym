package com.mzym.inbody.service;

import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.mzym.inbody.dao.InbodyDao;
import com.mzym.mypage.model.vo.Inbody;

public class InbodyService {
	
	InbodyDao iDao = new InbodyDao();
	
	// 회원 인바디 정보 조회
	public Inbody selectInbody(String userPhone) {
		Connection conn = getConnection();
		Inbody ib = iDao.selectInbody(conn, userPhone);
		close(conn);
		return ib;
	}
	
	
	// 회원 인바디 정보 수정
	public int updateInbody(Inbody ib, String userPhone) {
		Connection conn = getConnection();
		int result = iDao.updateInbody(conn, ib, userPhone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	// 회원 인바디 등록
	public int insertInbody(Inbody ib,String insertName, String insertPhone) {
		Connection conn = getConnection();
		int result = iDao.insertInbody(conn, ib, insertName, insertPhone);
		
		System.out.println(insertName);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
		
		
	}
	
	
	// 회원 인바디 삭제
	public int deleteInbody(String userPhone) {
		Connection conn = getConnection();
		int result = iDao.deleteInbody(conn, userPhone);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
	

}
