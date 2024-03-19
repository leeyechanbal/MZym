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

	public int idCheck(Connection conn, String checkId) {
		int result = 0;
		PreparedStatement  pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getRRN());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}