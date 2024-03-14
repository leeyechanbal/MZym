package com.mzym.board.service;

import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.mzym.board.dao.BoardDao;
import com.mzym.board.vo.Notice;
import com.mzym.common.paging.PageInfo;

public class BoardService {
	
	BoardDao dao = new BoardDao();

	/**
	 * @author 이예찬
	 * @return List<Notice>
	 * 공지사항에 대한 조회 요청을 처리 및 처지된 데이터를 전달하는 매서드
	 */
	public List<Notice> selectNotice() {
		
		Connection conn = getConnection();
		List<Notice> list  = dao.selectNotice(conn);
		
		close(conn);
		
		return list;
	}

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

}
