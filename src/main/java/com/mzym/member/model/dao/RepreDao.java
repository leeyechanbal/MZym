package com.mzym.member.model.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mzym.board.vo.Video;
import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.vo.Member;
import com.mzym.member.model.vo.RepreDate;
import com.mzym.member.model.vo.ReprePayment;

public class RepreDao {

	private Properties prop = new Properties();
	
	public RepreDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/repre-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String formatDate(String inputDate) {
        // 입력된 문자열에서 연도와 월을 추출합니다.
        String year = inputDate.substring(2, 4); // 년도의 뒤 두 자리 추출
        String month = inputDate.substring(5, 7); // 월 추출
        
        // 년도와 월을 조합하여 원하는 형식으로 변환합니다.
        String formattedDate = year + "년 " + month + "월";
        
        return formattedDate;
    }
	
	public List<RepreDate> selectPaymentDate(Connection conn) {
		List<RepreDate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPaymentDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new RepreDate(formatDate(rset.getString("year_month")),
												  rset.getString("year_month")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectlistMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public int selectMovieCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectlistVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}


	public List<Member> selectMember(Connection conn, PageInfo pi) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {	
					list.add(new Member(
							 rset.getInt("user_no"),
							 rset.getString("user_id"),
					         rset.getString("user_name"),
					         rset.getString("phone"),
					         rset.getString("rrn"),
					         rset.getString("email"),
					         rset.getString("address"),
					         rset.getInt("assign_tr"),
					         rset.getString("assign_name")
					         ));		         
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getRRN());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			pstmt.setInt(7, m.getUserNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Video> selectVideo(Connection conn, PageInfo pi) {
		List<Video> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {	
					list.add(new Video(
							 rset.getInt("video_no"),
							 rset.getString("video_title"),
					         rset.getString("link"),
					         rset.getInt("video_level")
					         ));		         
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertVideo(Connection conn, Video v) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, v.getVideoTitle());
			pstmt.setString(2, v.getLink());
			pstmt.setInt(3, v.getVideoLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateVideo(Connection conn, Video v) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v.getVideoLevel());
			pstmt.setString(2, v.getVideoTitle());
			pstmt.setString(3, v.getLink());
			pstmt.setInt(4, v.getVideoNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteVideo(Connection conn, int videoNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteVideo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, videoNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
