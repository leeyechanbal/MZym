package com.mzym.board.service;

import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.mzym.board.dao.BoardDao;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Board;
import com.mzym.board.vo.Notice;
import com.mzym.common.paging.PageInfo;

public class BoardService {
	
	BoardDao dao = new BoardDao();

	/*
	 * selectNotice()은 
	 * 페이징 처리가 된 후에 게시물을 보이게 되서
	 * 사용할 일이 없어 졌습니다.
	*/

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
		
		Attachment att = n.getAtt();
		
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
	 * @author 황수림
	 * @return 페이징 처리된 List<Board> 반환
	 * 자유게시판 리스트 반환하는 메소드
	 */
	public List<Board> selectFreeList(PageInfo pi) {
		Connection conn = getConnection();
		List<Board> list = dao.selectFreeList(conn, pi);
		close(conn);
		return list;
		
	}
	
	/**
	 * @author 황수림
	 * @return int 조회된 공지사항의 총 갯수
	 * 페이징 처리를 위한 자유게시 총 갯수를 요청하는 매서드
	 */
	public int selectFreeListCount() {
		Connection conn = getConnection();
		int listCount = dao.selectFreeListCount(conn);
		close(conn);
		return listCount;
		
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
		int result = 0;
		
		/*
		 *	원래 파일이 있고 첨부파일 수정 하면 => update
		 *	원래 파일이 없어 첨부파일 추가 => insert
		 *	원래 파일이 없어 첨부파일 수정 x => x 
		 */
		
		if(n.getAtt().isCheckedFile()) {
			if (n.getAtt().getOriginName() != null) {
				dao.updateAttachment(conn, n);
			} else {
				dao.insertAttachment(conn, n);
			}
		} 		
		
		return result;
	}

}
