package com.mzym.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.mzym.common.template.JDBCTemplate.close;
import com.mzym.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd, String userStatus) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userStatus);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member( rset.getInt("user_no")
							  , rset.getString("user_id")
							  , rset.getString("user_pwd")
							  , rset.getString("user_name")
							  , rset.getString("phone")
							  , rset.getString("rrn")
							  , rset.getString("email")
							  , rset.getString("address")
							  , rset.getDate("enroll_date")
							  , rset.getDate("modify_date")
							  , rset.getInt("assign_tr")
							  , rset.getString("status") );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
}