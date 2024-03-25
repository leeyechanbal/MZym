package com.mzym.board.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.commit;
import static com.mzym.common.template.JDBCTemplate.getConnection;
import static com.mzym.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.mzym.board.dao.BoardDao;
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

public class BoardService {
	
	BoardDao dao = new BoardDao();

	/**
	 * @author 이예찬
	 * @return int 조회된 공지사항의 총 갯수
	 * 페이징 처리를 위한 공지사항의 총 갯수를 요청하는 매서드
	 */
	public int selectNoticeCount() {
		
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		
		close(conn);
		return result;
	}

	/**
	 * @author 이예찬
	 * @param info
	 * @return 페이징 처리된 List<Notice> 반환
	 * 페이지의 정보를 가지고 공지사항을 요청하는 매서드
	 */
	public List<Notice> selectNotice(PageInfo info) {
		
		Connection conn = getConnection();
		List<Notice> list  = dao.selectNotice(conn, info);
		close(conn);
		
		return list;
	}

	/**
	 * @author 이예찬
	 * @param n Notice
	 * @param att Attachment
	 * @return int result db 정장 이후 결과
	 * 반드시 게시글이 실행되고 첨부파일이 실행되어야함 => nextval 과 currval
	 */
	public int insertNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int resultNotice = dao.insertNotice(conn, n);
		
		int resultAttachment = 1;
		
		
		if(n.getAtt() != null) {
			resultAttachment = dao.insertAttachment(conn, n); 
		} 
		
		if(resultNotice > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return resultNotice * resultAttachment;
	}
	
	/**
	 * @author 이예찬
	 * @param n
	 * @return 업데이트된 후 결과
	 * CheckedFile (수정전에 첨부파일이 있었는지 확인하는 데이터) 
	 * true: 첨부파일이 있었다면 => 기존 데이터를 update쿼리 요청
	 * false: 첨부파일이 없었다면 => 새로운 데이터로 insert쿼리 요청
	 * 
	 * outcome은 공지사항에 대한 수행 결과
	 * result은 첨부파일에 대한 수행 결과
	 */
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int outcome = dao.updateNotice(conn, n);
		System.out.println("outcome" + outcome);
		int result = 1;
		
		/*
		 *	원래 파일이 있고 첨부파일 수정 하면 => update
		 *	원래 파일이 없어 첨부파일 추가 => insert
		 *	원래 파일이 없어 첨부파일 수정 x => x 
		 */
		
		
		if (n.getAtt().getOriginName() != null) {
			if(n.getAtt().isCheckedFile()) {
				result = dao.updateAttachment(conn, n);
				
			} else {
				result = dao.insertNumAttachment(n, conn);	
				
			}
		}
		
		
		int totalresult =  outcome * result;
		if(totalresult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return totalresult;
	}
	
	/**
	 * @author 이예찬
	 * @param change 첨부파일이 존재하는지 확인하는 매개변수
	 * @param num 글번호
	 * @param type 공지사항인지 구별하기 위한 매개변수
	 * @return update된 결과값
	 * 공지사항의 상태(status = N)을 변경하기 위한 요청
	 */
	public int deletedNotice(int num, String change, String type) {
		Connection conn = getConnection();
		
		int outcome = dao.deletedNotice(conn, num);
		int result = 1;
		
		if(change != "") {
			result = dao.deletedAttachment(conn, num, type);
		}
		
		int total = outcome * result;
		
		if( total > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return total;
	}
	/**
	 * @author 이예찬
	 * @return 상담예약 게시판 갯수 반환
	 */
	public int selectCounselingCount(String check) {
		Connection conn = getConnection();
		int result = dao.selectCounselingCount(conn, check);
		
		close(conn);
		
		return result;
	}
	

	/**
	 * @author 이예찬
	 * @param info
	 * @param check
	 * @return
	 */
	public List<Advice> selectAdvice(PageInfo info, String check) {
		Connection conn = getConnection();
		List<Advice> list  = dao.selectAdvice(conn, info, check);
		close(conn);
		
		return list;
	}
	
	/**
	 * @author 이예찬
	 * @param ad
	 * @return 상담을 상태 변경 후 결과값 반환
	 * 
	 */
	public int adviceTuring(Advice ad) {
		Connection conn = getConnection();
		int result = dao.adviceTuring(conn, ad);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	

	/**
	 * @author 이예찬
	 * @param adviceNo
	 * @return 데이터의 상태를 변경후 결과값
	 * 
	 */
	public int deletedAdvice(int adviceNo) {
		Connection conn = getConnection();
		int result = dao.deletedAdcie(conn, adviceNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author 이예찬
	 * @return 신고 대기 중인 게시글 총 갯수 반환
	 * 신고글을 N, Y에 따라 총 갯수 요청 매서드
	 */
	public int reportCount(HashMap<String, Object> hash) {
		Connection conn = getConnection();
		
		int count = dao.reportCount(conn, hash);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 *	status을 이용해서 페이징 처리된 신고 게시글을 가져오는 매서드
	 * @author 이예찬
	 * @param info 페이징 처리된 숫자을 담고 있는 객체
	 * @param status 현재 글이 신고 완료인지 대기인지 구분
	 * @return 원하는 게시글 갯수만큼의 신고리스트 반환
	 */
	public List<Report> selectedBoard(PageInfo info, HashMap<String, Object> hash) {
		Connection conn = getConnection();
		List<Report> list = dao.selectedBoard(conn, info, hash);
		
		close(conn);
		
		return list;
	}
	
	
	
	/**
	 * 신고 번호와 대응 되는 게시글의 카테고리 이동 및 신고 상태 = N 변경
	 * @author 이예찬
	 * @param hash 신고 번호(reportNo), 이동할 카테고리 번호(selectNo) , 보고서 작성내용(text)
	 * @return update완료된 결과값 반환
	 */
	public int boardMoving(HashMap<String, Object> hash) {
		Connection conn = getConnection();
		
		int result = dao.boardMoving(conn, hash);
	
		int outcome = dao.reportStatusN(conn, hash);
		
		int total = result*outcome;
		
		if(total > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return total;
	}
	
	/**
	 * 게시판의 카테고리를 반환하는 매서드
	 * @author 이예찬
	 * @return 게시판 테이블에 모든 카테고리 정보
	 */
	public List<BoardCategory> selectBoardCategory() {
		Connection conn = getConnection();
		List<BoardCategory> list = dao.selectBoardCategory(conn);
		close(conn);
		
		return list;
	}
	
	/**
	 * @author 이예차
	 * @return 신고 테이블에 모든 카테고리 정보
	 */
	public List<ReportCategory> selectReportCategory() {
		Connection conn = getConnection();
		List<ReportCategory> list = dao.selectReportCategory(conn);
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 받아온 type에 따라 신고 확인과 신고 처리를 구분하여 처리
	 * @author 이예찬
	 * @param hash
	 * @return 결과값 반환
	 */
	public int reportRequest(HashMap<String, Object> hash) {
		/*
		 	신고 철회 type 1 => 신고 테이블의 상태 완료로 변경(신고번호, 보고서) => 게시불 상태 = Y변경(화면에 다시 보이게)
		 	신고 확인 type 2 => 신고 테이블의 상태 완료로 변경(신고번호, 보고서)
		 	check = 1 => 게시물 쿼리
		 	check = 2 => 댓글 쿼리
		 	
		 */
		
		Connection conn = getConnection();
		
		// 신고 테이블의 상태 완료로 변경
		int result = dao.reportStatusN(conn, hash);
		int outcome = 1;
		
		System.out.println((int)hash.get("check"));
		System.out.println(result);
		
		if((int)hash.get("check") == 1) {
			
			if((int)hash.get("type") == 1) { // 신고철회
				//게시물 상태 = Y변경
				outcome = dao.boardStatusY(conn, hash);
			}
		} else {
			// 댓글인 경우
			if((int)hash.get("type") == 1) { // 신고철회
				//댓글 상태 = Y변경
				outcome = dao.commentStatusY(conn, hash);
				System.out.println("이거 되?");
			}
		}
		
		
		int total = result * outcome;
		
		close(conn);
		
		return total;
	}
	
	/**
	 * 삭제 요청된 신고 테이블을 화면에 안보이게 처리
	 * @author 이예찬
	 * @param reportNo
	 * @return 결과값 반환
	 */
	public int deleteReport(int reportNo) {
		Connection conn = getConnection();
		
		int result  = dao.deleteReport(conn, reportNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	
	=================================  이예찬 leeyechan ==================================
*/
	
	/**
	 * @author 황수림
	 * @return 페이징 처리된 List<Board> 반환
	 * 자유게시판 리스트 반환하는 메소드
	 */
	public List<Board> selectFreeList(PageInfo pi, int type) {
		Connection conn = getConnection();
		List<Board> list = dao.selectFreeList(conn, pi, type);
		close(conn);
		return list;
		
	}
	
	/**
	 * @author 황수림
	 * @return int 조회된 자유게시판의 총 갯수
	 * 페이징 처리를 위한 자유게시판 총 갯수를 요청하는 매서드
	 */
	public int selectFreeListCount(int type) {
		Connection conn = getConnection();
		int listCount = dao.selectFreeListCount(conn, type);
		close(conn);
		return listCount;
		
	}

	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글을 DB에 insert하는 메소드
	 */
	public int insertFreeBoard(Board b, Attachment at, int type) {
		Connection conn = getConnection();
		
		int result1 = dao.insertFreeBoard(conn, b, type);
		
		int result2 = 1;
		if(at != null) {
			result2 = dao.insertFreeAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}

	/**
	 * @author 황수림
	 * 자유게시판 게시글 조회시 조회수 count 하는 메소드
	 */
	public int increaseFreeCount (int boardNo) {
		Connection conn = getConnection();
		
		int result = dao.increaseFreeCount(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글 조회하는 메소드
	 */
	public Board selectFreeBoard(int boardNo) {
		Connection conn = getConnection();
		
		Board b = dao.selectFreeBoard(conn, boardNo);
		close(conn);
		return b;
		
	}
	
	/**
	 * @author 황수림
	 * 자유게시판의 게시글의 첨부파일을 조회하는 메소드
	 */
	public Attachment selectFreeAttachment(int boardNo) {
		Connection conn = getConnection();
		
		Attachment at = dao.selectFreeAttachment(conn, boardNo);
		close(conn);
		return at;
	}

	/**
	 * @author 황수림
	 * @return 자유게시판 수정 갯수 반환
	 */
	public int updateFreeBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = dao.updateFreeBoard(conn, b);
		
		int result2 = 1;
		
		if(at != null) {
			if(at.getFileNO() != 0) {
				result2 = dao.updateFreeAttachment(conn, at);	
			}else {
				result2 = dao.insertNewFreeAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public List<Comment> selectCommentList(int boardNo){
		Connection conn = getConnection();
		List<Comment> list  = dao.selectCommentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		int result = dao.insertComment(conn, c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertReport(Report r) {
		Connection conn = getConnection();
		int result = dao.insertReport(conn, r);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertCommentReport(Report r) {
		Connection conn = getConnection();
		int result = dao.insertCommentReport(conn, r);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteFreeBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.deleteFreeBoard(conn, b);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public BoardCategory selectBoardName(int type) {
		Connection conn = getConnection();
		BoardCategory bc = dao.selectBoardName(conn, type);
		close(conn);
		return bc;
	}
		
		
	/*	
	=================================  황수림 ==================================
*/
	
	/**
	 * @author 구성모
	 * @return dao.insert결과값 반환
	 */
	public int insertAdvice(Advice a) {
		Connection conn = getConnection();
		int result = dao.insertAdvice(conn, a);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author 손수현
	 * @return 비디오게시판
	 */
	
	
	public int selectVideoListCount() {
		Connection conn = getConnection();
		int listCount = dao.selectVideoListCount(conn);
		close(conn);
		return listCount;
	}
	
	public List<Video>  selectBeginnerVideoList(){
		Connection conn = getConnection();
		List<Video> list = dao. selectBeginnerVideoList(conn);
		close(conn);
		return list;
	}
	
	public List<Video>  selectVideoList(PageInfo pi){
		Connection conn = getConnection();
		List<Video> list = dao. selectVideoList(conn, pi);
		close(conn);
		return list;
	}
	
/*	
	================================= 엄희강 ==================================
*/	
//작성자 엄희강 , 홈페이지에 자유게시판 최신글 10개를 조회 하는 서비스 
	public List<Board> latestpostFreeBoard() {
		Connection conn = getConnection();
		List<Board> list  = dao.latestpostFreeBoard(conn);
		close(conn);
		
		return list;
	}

	public List<Board> latestpostFreeBoard2() {
		Connection conn = getConnection();
		List<Board> list  = dao.latestpostFreeBoard2(conn);
		close(conn);
		
		return list;
	}


	public int ProdoctBoardselectListConut() {
		
		Connection conn = getConnection();
		int result = dao.selectProductCount(conn);
		
		close(conn);
		return result;
	}





	
	
	
	


}// class END
