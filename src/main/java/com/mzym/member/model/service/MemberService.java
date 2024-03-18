package com.mzym.member.model.service;

import java.sql.Connection;

import static com.mzym.common.template.JDBCTemplate.*;
import com.mzym.member.model.dao.MemberDao;
import com.mzym.member.model.vo.Member;

public class MemberService {
	
	private MemberDao mDao = new MemberDao();

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, userId, userPwd);
		close(conn);
		return loginUser;
	}
}
