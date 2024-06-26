package com.mzym.board.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.mzym.board.vo.Advice;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Board;
import com.mzym.board.vo.BoardCategory;
import com.mzym.board.vo.Comment;
import com.mzym.board.vo.Notice;
import com.mzym.board.vo.Report;
import com.mzym.board.vo.ReportCategory;
import com.mzym.board.vo.Video;
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
	 * 글번호에 따라서 첨부파일이 들어갈 수있도록 만든 매서드
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
	
	
	/**
	 * @author 이예찬
	 * @param conn
	 * @param num
	 * @return 
	 * 공지사항을 삭제시 상태를 변경시켜 화면에 보이지 않도록 하는 매서드
	 */
	public int deletedNotice(Connection conn, int num) {
		int result = 0;
		PreparedStatement pst = null;
		
		try {
		
			pst = conn.prepareStatement(prop.getProperty("deletedNotice"));
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
			pst = conn.prepareStatement(prop.getProperty("deletedAttachment"));
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
	

	/**
	 * @author 이예찬
	 * @param conn
	 * @return 상담게시물 총 갯수 조회
	 */
	public int selectCounselingCount(Connection conn, String check) {
		ResultSet rset = null;
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectCounselingCount"));
			pst.setString(1, check);
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
	 * @param check
	 * @return
	 * check 값이 Y, N인지에 따라서 다른 조회문을 가져옴
	 */
	public List<Advice> selectAdvice(Connection conn, PageInfo info, String check) {
		ResultSet rset = null;
		PreparedStatement pst = null;
		List<Advice> list = new ArrayList<>();
		String str = null;
//		if(check.equals("Y")) {
//			str = " DESC";
//		}else {
//			str = " ASC";
//		}
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectAdvice"));
			pst.setString(1, check);
//			pst.setNString(2, str);
			pst.setInt(2, info.getStartBoard());
			pst.setInt(3, info.getEndBoard());
			rset = pst.executeQuery();
			
			while(rset.next()) {
				list.add(new Advice(
							rset.getInt("ADVICE_NO")
							, rset.getString("ADVICE_USER")
							, rset.getString("PHONE_NO")
							, rset.getString("CATEGORY_NAME")
							, rset.getString("ADVICE_DATE")
							, rset.getString("user_id")
							, rset.getString("ADVICE_CONTENT")
							, rset.getString("ADVICE_REPEAT") // NULL값이 존재함
							, rset.getString("REGIST_DATE")
							, rset.getString("MODIFY_DATE")
							, rset.getString("status")
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
	 * @param conn
	 * @param ad
	 * @return update가 완료된 결과값
	 * 넘어오는 글상태에 따라서 상담글을 변경해주는 매서드
	 * 들옥되어야 하는 쿼리문이 달라서 상태값에따라 실행되게 제작
	 */
	public int adviceTuring(Connection conn, Advice ad) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			if(ad.getStatus().equals("N")) {
				pst = conn.prepareStatement(prop.getProperty("adviceComplete"));
				
				
				pst.setString(1, ad.getTrainerId());
				pst.setString(2, ad.getRepeat());
				pst.setInt(3, ad.getAdviceNo());
				
				result = pst.executeUpdate();
				
			} else  {
				pst = conn.prepareStatement(prop.getProperty("adviceUpdate"));
				pst.setString(1, ad.getRepeat());
				pst.setInt(2, ad.getAdviceNo());
				
				result = pst.executeUpdate();
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
	
	/**
	 * 상담을지 지워질때 상태를 K로 바꾸는 매서드
	 * @author 이예찬
	 * @param conn
	 * @param adviceNo
	 * @return
	 */
	public int deletedAdcie(Connection conn, int adviceNo) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("deletedAdcie"));
			pst.setInt(1, adviceNo);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
	
	/**
	 * 현재 받아온 데이터에 따라 신고 대기인지 신고 완료인지를 반환 하는 매서드
	 * @author 이예찬
	 * @param conn
	 * @param hash 현재 들어온 게시글이 (Y 신고대기, N 신고완료), type(board : 게시글 정보, comment : 댓글 정보)
	 * @return 변수에 따라 게시불이 반환 대는 갯수 반환
	 */
	public int reportCount(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		int count = 0;
		
		try {
			if (hash.get("type").equals("board")) {
				pst = conn.prepareStatement(prop.getProperty("reportBoardCount"));
				pst.setString(1, (String)hash.get("status"));
				rset = pst.executeQuery();				
			} else {
				pst = conn.prepareStatement(prop.getProperty("reportCommentCount"));
				pst.setString(1, (String)hash.get("status"));
				rset = pst.executeQuery();		
			}
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pst);
		}
		
		return count;
	}
	
	/**
	 * @author 이예찬
	 * @param conn db에 연결하기 위한 객체
	 * @param info 현재 페이지와 입력받은 데이터로 페이징처리된 객체
	 * @param status 현재 신고 대기인지 완료인지를 구별
	 * @return 구별된 신고 게시글을 반환
	 */
	public List<Report> selectedBoard(Connection conn ,PageInfo info, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		List<Report> list = new ArrayList<>();
		List<Attachment> atList  = new ArrayList<>();
		int count = 0;

		try {
			// 신고 게시판 불러오기
			if(hash.get("type").equals("board")) {
				
				int categoryNum = (int)hash.get("categoryNum");
				
				pst = conn.prepareStatement(prop.getProperty("selectBoardReport"));
				pst.setString(1,(String)hash.get("status"));
				pst.setInt(2,categoryNum);
				if (categoryNum != 3) {
					pst.setInt(3, info.getStartBoard());
					pst.setInt(4, info.getEndBoard());
				}else {
					pst.setInt(3, 1);
					pst.setInt(4, 100);
				}			
				rset = pst.executeQuery();

				while(rset.next()) {
					
					if (categoryNum != 3) {
					// 카테고리가 pt후기 아닌 경우
					list.add(new Report(
								rset.getInt("REPORT_NO")
								, rset.getInt("CATEGORY_NO")
								, rset.getString("REPORT_DATE")
								, rset.getString("REPORT_CONTENT")
								, rset.getString("reportID")
								, rset.getString("REPORTER")
								, new Board(
										rset.getInt("BOARD_NO")
										, rset.getInt("BOARD_TYPE")
										, rset.getString("boardID")
										, rset.getString("BOARD_TITLE")
										, rset.getString("board_Content")
										, new Attachment(
												rset.getString("ORIGIN_NAME")
												, rset.getString("CHANGE_NAME")
												, rset.getString("FILE_PATH")
												, rset.getInt("FILE_LEVEL")
												)
										)
							));
					
//					System.out.println("------------------------- 게시글 경우 end ----------------------------");
//					System.out.println(list);
//					System.out.println();
					
					} else {
						// 카테고리가 pt 후기인 경우
						// while 문
						
//						System.out.println();
//						System.out.println("count    " + count);
						
						
		
						list.add(new Report(
								rset.getInt("REPORT_NO")
								, rset.getInt("CATEGORY_NO")
								, rset.getString("REPORT_DATE")
								, rset.getString("REPORT_CONTENT")
								, rset.getString("reportID")
								, rset.getString("REPORTER")
								, new Board(
										rset.getInt("BOARD_NO")
										, rset.getInt("BOARD_TYPE")
										, rset.getString("boardID")
										, rset.getString("BOARD_TITLE")
										, rset.getString("board_Content")
										, atList
										)
								));
					
							
						
						boolean ch = (count < 2 ) ? true : (list.get(count-1).getReportNo() ==  list.get(count).getReportNo());
//						System.out.println("결과값  " + ch);
						
						
						if(ch) {
							atList.add(
									new Attachment(
										rset.getString("ORIGIN_NAME")
										, rset.getString("CHANGE_NAME")
										, rset.getString("FILE_PATH")
										, rset.getInt("FILE_LEVEL")
										)
									);
						} else {
							atList = new ArrayList<Attachment>();
							
							list.get(count).getBoard().setAtList(atList);
							
							atList.add(new Attachment(
											rset.getString("ORIGIN_NAME")
											, rset.getString("CHANGE_NAME")
											, rset.getString("FILE_PATH")
											, rset.getInt("FILE_LEVEL")
									));
						}
							
					

//						System.out.println(list);
//						System.out.println("------------------------- pt 후기 end -----------------------------");
//						System.out.println();
						count++;
						
					} // if문 
					
				} // while문
				
			} else {
			// 신고 댓글 불러오기	
				pst = conn.prepareStatement(prop.getProperty("selectCommnetReport"));
				pst.setString(1, (String)hash.get("status"));
				pst.setInt(2, (int)hash.get("categoryNum"));
				pst.setInt(3, info.getStartBoard());
				pst.setInt(4, info.getEndBoard());
				
				rset = pst.executeQuery();
				
				while(rset.next()) {
					list.add(new Report(
								rset.getInt("REPORT_NO")
								, rset.getInt("CATEGORY_NO")
								, rset.getString("REPORT_DATE")
								, rset.getString("REPORT_CONTENT")
								, rset.getString("USER_ID")
								, rset.getString("REPORTER")
								, new Board(
										rset.getInt("board_No")
										, rset.getString("BOARD_TITLE")
										, rset.getInt("board_type")
										)
								, new Comment(
										rset.getInt("comment_no")
										, rset.getString("USER_NAME")
										, rset.getString("comment_content")
										)
							));
				}
//				System.out.println(list);
//				System.out.println("------------------------- 댓글 end -----------------------------");
//				System.out.println();
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pst);
		}
//		System.out.println(list);
		return list;
	}
		
	
	/**
	 * @author 이예찬
	 * @return 조회된 게시물 카테고리를 반환하는 매서드
	 */
	public List<BoardCategory> selectBoardCategory(Connection conn) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		List<BoardCategory> list = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectBoardCategory"));
			rset = pst.executeQuery();
			
			while(rset.next()){
				list.add(new BoardCategory(
							rset.getInt("CATEGORY_NO")
							, rset.getString("CATEGORY_NAME")
						));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pst);
		}
		
		
		return list;
	}
	
	
	/**
	 * @author 이예찬
	 * @return 신고 카테고리를 반환
	 */
	public List<ReportCategory> selectReportCategory(Connection conn) {
		PreparedStatement pst = null;
		ResultSet rset = null;
		List<ReportCategory> list = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement(prop.getProperty("selectReportCategory"));
			rset = pst.executeQuery();
			
			while(rset.next()){
				list.add(new ReportCategory(
							rset.getInt("CATEGORY_NO")
							, rset.getString("CATEGORY_NAME")
						));
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pst);
		}

		return list;
	}
	
	/**
	 * 신고 받은 번호에 게시판의 상태 = "Y", 그리고 게시판을 정달받은 데이터로 이동
	 * 그 뒤에 신고테이블에서 상태를 "N"으로 작성된 보고서를 전달해 주는 쿼리
	 * @author 이예찬
	 * @param conn db에 연결하기 위한 객체
	 * @param hash 신고 번호(reportNo), 이동할 카테고리 번호(selectNo) , 보고서 작성내용(text)
	 * @return update뒤 결과 값 반환
	 */
	public int boardMoving(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("boardMoving"));
			System.out.println((int)hash.get("selectNo"));
			System.out.println((int)hash.get("reportNo"));
			pst.setInt(1, (int)hash.get("selectNo"));
			pst.setInt(2, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
	
	/**
	 * 신고 처리된 게시물의 status을 N으로 바꿔주는 매서드
	 * @author 이예찬
	 * @param conn
	 * @param hash
	 * @return
	 */
	public int reportStatusN(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0;
		
		try {
			pst = conn.prepareStatement(prop.getProperty("reportStatusN"));
			pst.setString(1, (String)hash.get("text"));
			pst.setString(2, (String)hash.get("reporter"));
			pst.setInt(3, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}

	
	/**
	 * 삭제 요청된 데이터의 상태를 K로 바꾼후 결과값 반환
	 * @author 이예찬
	 * @param conn db에 연결을 위한 객체
	 * @param reportNo 신고 게시물 번호
	 * @return 상태 변경 후 결과 값 반환
	 */
	public int deleteReport(Connection conn, int reportNo) {
		PreparedStatement pst = null;
		int result = 0; 
		
		try {
			pst = conn.prepareStatement(prop.getProperty("deleteReport"));
			pst.setInt(1, reportNo);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}
	
	/**
	 * 신고로 보이지 않게된 게시글의 상태를 Y변경하는 쿼리요청
	 * @author 이예찬
	 * @param conn db연결을 위한 객체
	 * @param hash 
	 * @return 결과값
	 */
	public int boardStatusY(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0; 
		
		try {
			pst = conn.prepareStatement(prop.getProperty("boardStatusY"));
			pst.setInt(1, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
	
	/**
	 *	신고 철회된 댓글 상태 Y로 변경
	 * @author 이예찬
	 * @param conn
	 * @param hash
	 * @return
	 */
	public int commentStatusY(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0; 
		
		try {
			pst = conn.prepareStatement(prop.getProperty("commentStatusY"));
			pst.setInt(1, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}

	
	
	
	
	
/*	
	=================================  이예찬 leeyechan ==================================
*/
	/**
	 * @author 황수림
	 * @param conn db연결을 위한 Connection 객체
	 * @return 자유게시판의 총 갯수
	 * 페이징 처리를 위한 자유게시판의 총 갯수 요청 
	 */
	public int selectFreeListCount(Connection conn, int type) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
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
	public List<Board> selectFreeList(Connection conn, PageInfo pi, int type){
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
									rset.getString("board_title"),
									rset.getString("user_id"),
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
	 * @author 황수림
	 * 자유게시판 게시글 조회시 조회수 count 하는 메소드
	 */
	public int increaseFreeCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseFreeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글 조회하는 메소드
	 */
	public Board selectFreeBoard(Connection conn, int boardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getString("user_id")
							  );
				b.setBoardType(rset.getInt("board_type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글의 첨부파일을 조회하는 메소드
	 */
	public Attachment selectFreeAttachment(Connection conn, int boardNo) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNO(rset.getInt("file_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	
	public int insertFreeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
}
	/**
	 * @author 황수림
	 * @return
	 * 자유게시판 게시글 insert
	 */
	public int insertFreeBoard(Connection conn, Board b, int type){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardWriter());
			pstmt.setInt(2, type);
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글 수정하는 메소드
	 * 자유게시판의 첨부파일 수정하는 메소드
	 * 자유게시판의 첨부파일 추가하는 메소드
	 */
	public int updateFreeBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateFreeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNO());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewFreeAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getAttNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public List<Comment> selectCommentList(Connection conn, int boardNo){
		List<Comment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Comment(rset.getInt("comment_No"),
									 rset.getString("user_name"),
									 rset.getString("comment_Content"),
									 rset.getInt("comment_Writer"),
									 rset.getString("comment_Date")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int insertComment(Connection conn, Comment c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, c.getCommentWriter());
			pstmt.setInt(2, c.getBoardNo());
			pstmt.setString(3, c.getCommentContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReport(Connection conn, Report r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, r.getBoardNo());
			pstmt.setInt(2, r.getCategoryNo());
			pstmt.setInt(3, r.getReportUser());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertCommentReport(Connection conn, Report r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommentReport");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, r.getCommentNo());
			pstmt.setInt(2, r.getReportUser());
			pstmt.setInt(3, r.getCategoryNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteFreeBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFreeBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public BoardCategory selectBoardName(Connection conn, int type) {
		BoardCategory bc = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bc = new BoardCategory(rset.getInt("category_no")
									 , rset.getString("category_name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bc;
	}
	
	public int insertReviewBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardWriter());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setInt(3, b.getReviewRate());
			pstmt.setString(4, b.getBoardContent());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReviewAttachment(Connection conn, List<Attachment> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewAttachment");
		
		try {
			
			for(Attachment at : list) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					pstmt.setInt(4, at.getFileLevel());
					
					result = pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		return result;
	}
	
	public List<Board> selectReviewList(Connection conn, PageInfo pi){
		
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setReviewRate(rset.getInt("review_rate"));
				b.setCount(rset.getInt("count"));
				b.setTitleImgURL(rset.getString("titleimg_url"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int selectReviewListCount(Connection conn) {
			
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReviewListCount");
			
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
	
	public List<Attachment> selectAttachmentReview(Connection conn, int BoardNo){
		
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFreeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, BoardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNO(rset.getInt("file_no"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<Notice> selectNoticelist(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Notice> list = new ArrayList<>();
		String sql = prop.getProperty("selectNoticelist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Notice(
						rset.getInt("NOTICE_NO")
						, rset.getString("USER_NAME")
						, rset.getString("NOTICE_TITLE")
						, rset.getString("NOTICE_CONTENT")
						, rset.getString("REGIST_DATE")));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Notice selectNoticeList(Connection conn, int boardNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_No"),
							  rset.getString("notice_Title"),
							  rset.getString("notice_Content"),
							  rset.getInt("notice_Writer")
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
/*	
	=================================  황수림 a yellow forest ==================================
*/

	/**
	 * @author 구성모
	 * @param conn
	 * @param a
	 * @return 상담예약 insert결과값 반환
	 */
	public int insertAdvice(Connection conn, Advice a) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdvice");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getCategoryNo());
			pstmt.setString(2, a.getAdviceName());
			pstmt.setString(3, a.getPhone());
			pstmt.setString(4, a.getAdviceDate());
			pstmt.setString(5, a.getAdviceContent());
			
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 
	 * @author 손수현
	 * @return 비디오게시판 
	 */
	
	public int selectVideoListCount(Connection conn) {
		// select문 => 무조건 한행이면서 한개의 숫자 => int
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideoListCount");
		
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
	
	public List<Video> selectBeginnerVideoList(Connection conn){
		
		List<Video> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBeginnerVideoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Video( rset.getInt("video_no"),
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
	
	
	public List<Video> selectVideoList(Connection conn, PageInfo pi){
		
		List<Video> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVideoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1; 
 			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Video( rset.getInt("video_no"),
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
/*	
	================================= 손수현 videoBoard ==================================
*/

	
	
/*
 * 작성자 엄희강, 홈페이지에 자유, 질문 게시판 최신글 10개만 불러올 쿼리
 * */	
	
	public List<Board> latestpostFreeBoard(Connection conn) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("latestpostFreeBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

	public List<Board> latestpostFreeBoard2(Connection conn) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("latestpostFreeBoard2");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	public int selectProductCount(Connection conn) {
		
		return 0;
	}

	public int boardStatusN(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0; 
		
		try {
			pst = conn.prepareStatement(prop.getProperty("boardStatusN"));
			pst.setInt(1, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}

	public int commentStatusN(Connection conn, HashMap<String, Object> hash) {
		PreparedStatement pst = null;
		int result = 0; 
		
		try {
			pst = conn.prepareStatement(prop.getProperty("commentStatusN"));
			pst.setInt(1, (int)hash.get("reportNo"));
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		
		return result;
	}
	

}// class END
