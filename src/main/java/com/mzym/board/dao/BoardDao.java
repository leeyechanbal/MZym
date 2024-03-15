package com.mzym.board.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Notice;
import com.mzym.common.paging.PageInfo;

public class BoardDao {
	
	Properties prop = new Properties();
	
	/**
	 * @author 이예찬
	 * 생성자 생성시 바로 xml파일을 Properties에 적용
	 */
	public BoardDao() {
		super();
		try {
			prop.loadFromXML(BoardDao.class.getResourceAsStream("/db/mappers/board-mapper.xml"));
		} catch (InvalidPropertiesFormatException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	/*
	 * selectNotice(Connection conn)은 
	 * 페이징 처리가 된 후에 게시물을 보이게 되서
	 * 사용할 일이 없어 졌습니다.
	*/
	
	/**
	 * @author 이예찬
	 * @param conn db연결을 위한 Connection 객체
	 * @return 공지사항의 총 갯수
	 * 페이징 처리를 위한 공지사항의 총 갯수 요청 
	 */
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectNoticeCount"));
			rset = pst.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pst);
		}
		return result;
	}

	/**
	 * @author 이예찬
	 * @param conn
	 * @param info
	 * @return 페이징 처리된 List<Notice>
	 * 	db에 페이징 처리된 공지사항을 요청
	 */
	public List<Notice> selectNotice(Connection conn, PageInfo info) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		List<Notice> list = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectNotice"));
					
			pst.setInt(1, info.getStartBoard()); 
			pst.setInt(2, info.getEndBoard()); 
			
			rset = pst.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(
							rset.getInt("NOTICE_NO")
							, rset.getString("USER_ID")
							, rset.getString("NOTICE_TITLE")
							, rset.getString("NOTICE_CONTENT")
							, rset.getString("REGIST_DATE")
						));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pst);
		}
		
		return list;
	}

	/**
	 * @author 이예찬
	 * @param conn db연결을 위한 객체
	 * @param n 게시글의 정보를 담겨있는 객체
	 * @return 요청된 공지사항이 등록되었을 때 결과을 int값으로 반환
	 * 반드시, 첨부파일보다 먼저 실행 되어야함
	 */
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("insertNotice"));
			pst.setInt(1, n.getWriter());
			pst.setString(2, n.getTitle());
			pst.setString(3, n.getContent());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}

	/**
	 * @author 이에찬
	 * @param conn db연결을 위한 객체
	 * @param att 첨부파일의 정보를 담은 객체
	 * @return 첨부파일에 결과가 담긴 이후 int 결과 반환
	 * 모든 게시글의 첨부파일 저장시 사용 됩니다.
	 * 쿼리문에 좀더 상세히 기술 되어있습니다.
	 */
	public int insertAttachment(Connection conn, Attachment att) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("insertAttachment"));
			pst.setString(1, "N");
			pst.setString(2, att.getOriginName());
			pst.setString(3, att.getChangeName());
			pst.setString(4, att.getFilePath());
			pst.setNull(5, java.sql.Types.NULL); //자바에서 null값을 쿼리문에 전달하는 방법
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}
}
