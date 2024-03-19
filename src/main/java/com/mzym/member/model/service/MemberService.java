package com.mzym.member.model.service;

import java.sql.Connection;

import static com.mzym.common.template.JDBCTemplate.*;
import com.mzym.member.model.dao.MemberDao;
import com.mzym.member.model.vo.Member;

public class MemberService {
	
	private MemberDao mDao = new MemberDao();

	public Member loginMember(String userId, String userPwd, String userStatus) {
		
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, userId, userPwd, userStatus);
		close(conn);
		return loginUser;
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int result = mDao.idCheck(conn, checkId);
		close(conn);
		return result;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public String findId(Member m) {
		Connection conn = getConnection();
		String id ="";
		id= mDao.findId(conn, m);
		close(conn);
		return id;
	}

}
