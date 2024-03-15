package com.mzym.mypage.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.commit;
import static com.mzym.common.template.JDBCTemplate.getConnection;
import static com.mzym.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mzym.common.paging.PageInfo;
import com.mzym.member.vo.Member;
import com.mzym.mypage.dao.MyPageDao;
import com.mzym.mypage.vo.Payment;

public class MyPageService {

	private MyPageDao myDao = new MyPageDao();
	
	
	public Member updateMyPage(Member m) {

		Connection conn = getConnection();
		int result = myDao.updateMyPage(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = myDao.selectMyPage(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public Member selectMyPage(String userId) {
		
		Connection conn = getConnection();
		Member m = myDao.selectMyPage(conn, userId);
		close(conn);
		return m;
	}
	
	public Member updatePwdMember(String userId, String userPwd, String newPwd) {
		
		Connection conn = getConnection();
		int result = myDao.updatePwdMember(conn, userId, userPwd, newPwd);

		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = myDao.selectMyPage(conn, userId);
		}else {
			rollback(conn);
		}
		return updateMem;
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		int result = myDao.deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = myDao.selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public List<Payment> selectList(PageInfo pi){
		Connection conn = getConnection();
		List<Payment> list = myDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
	
	
}
