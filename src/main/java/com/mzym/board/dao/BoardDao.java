package com.mzym.board.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.File;
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
import com.mzym.board.vo.Board;
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
				String originName = rset.getString("origin_name");
				
				
				list.add(new Notice(
						rset.getInt("NOTICE_NO")
						, rset.getString("USER_ID")
						, rset.getString("NOTICE_TITLE")
						, rset.getString("NOTICE_CONTENT")
						, rset.getString("REGIST_DATE")
						, (originName != null) ? 
								new Attachment(originName, rset.getString("change_name"), rset.getString("file_path")) 
								: null
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
	 * Object 타입의 입력 매개변수를 이용해서 각 게시판의 유형에 따라 N,B,P
	 * 개시물의 종류에 따라 시퀀스가 달라 질 수 있기에 xml보다는 직접 쿼리문을 제시함
	 * 
	 */
	public int insertAttachment(Connection conn, Object obj) {
		PreparedStatement pst = null;
		int result = 0;
		
		String type = null;
		String seq = null;
		Attachment att = null;
		
		
		if (obj instanceof Notice) {
			type = "N";
			seq = "SEQ_NOTICENO.currval";
			att = ((Notice) obj).getAtt();
		}
		
		String sql = "insert"
				+ " into attachment"
				+ "("
				+ "    FILE_NO"
				+ "    , ATT_NO"
				+ "    , ATT_CATEGORY"
				+ "    , ORIGIN_NAME"
				+ "    , CHANGE_NAME"
				+ "    , FILE_PATH"
				+ "    , UPLORD_DATE"
				+ "    , FILE_LEVEL"
				+ "    , STATUS"
				+ ") values ("
				+ "    SEQ_ATTACHMENT.nextval"
				+ "    , " + seq
				+ "    , ? "
				+ "    , ? "
				+ "    , ? "
				+ "    , ? "
				+ "    , sysdate"
				+ "    , ? "
				+ "    , DEFAULT"
				+ ")";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, type);
			pst.setString(2, att.getOriginName());
			pst.setString(3, att.getChangeName());
			pst.setString(4, att.getFilePath());
			
			// pt후기에서 바꿀 수 있음
			pst.setNull(5, java.sql.Types.NULL); 
			//자바에서 null값을 쿼리문에 전달하는 방법
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}
	
	/**
	 * @author 황수림
	 * @param conn db연결을 위한 Connection 객체
	 * @return 자유게시판의 총 갯수
	 * 페이징 처리를 위한 자유게시판의 총 갯수 요청 
	 */
	public int selectFreeListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	/**
	 * @author 황수림
	 * @return
	 * 자유게시판 목록 실행 및 결과값 반환
	 */
	public List<Board> selectFreeList(Connection conn, PageInfo pi){
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
									rset.getString("board_title"),
									rset.getString("user_name"),
									rset.getInt("count"),
									rset.getDate("regist_date")
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

	/**
	 * @author 이예찬
	 * @param conn
	 * @param n
	 * @return
	 * 공지사항 수정 쿼리 실행 및 결과 값 반환 매서드
	 */
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("updateNotice"));
			pst.setString(1, n.getTitle());
			pst.setString(2, n.getContent());
			pst.setInt(3, n.getWriter());
			pst.setInt(4, n.getNoticeNo());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pst);
		}
		
		return result;
	}

	/**
	 * @author 이예찬
	 * @param conn
	 * @param n
	 * 첨부파일을 재 설정 하는 매서드
	 */
	public int updateAttachment(Connection conn, Notice n) {
		PreparedStatement pst = null;
		int result = 0;
		Attachment att = n.getAtt();
		try {
			pst = conn.prepareStatement(prop.getProperty("updateAttachment"));
			pst.setString(1, att.getOriginName());
			pst.setString(2, att.getChangeName());
			pst.setInt(3, n.getNoticeNo());

			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pst);
		}
		
		return result;
	}

	/**
	 * @author 이예찬
	 * @param n
	 * @param conn
	 * @return
	 */
	public int insertNumAttachment(Notice n, Connection conn) {
		PreparedStatement pst = null;
		int result = 0;
		Attachment att = n.getAtt();
		
		try {
			pst = conn.prepareStatement(prop.getProperty("insertNumAttachment"));
			pst.setInt(1, n.getNoticeNo());
			pst.setString(2, "N");
			pst.setString(3, att.getOriginName());
			pst.setString(4, att.getChangeName());
			pst.setString(5, att.getFilePath());
			
			// pt후기에서 바꿀 수 있음
			pst.setNull(6, java.sql.Types.NULL); 
			//자바에서 null값을 쿼리문에 전달하는 방법
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}

	public int deletedNotice(Connection conn, int num) {
		int result = 0;
		PreparedStatement pst = null;
		
		try {
			System.out.println(num);
			pst = conn.prepareStatement("deletedNotice");
			pst.setInt(1, num);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}

	/**
	 * @author 이예찬
	 * @param conn
	 * @param num
	 * @return 
	 * 첨부파일의 상태를 'N'으로 변경하는 매서드
	 */
	public int deletedAttachment(Connection conn, int num, String type) {
		int result = 0;
		PreparedStatement pst = null;
		
		try {
			pst = conn.prepareStatement("deletedAttachment");
			pst.setInt(1, num);
			pst.setString(2, type);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
}
