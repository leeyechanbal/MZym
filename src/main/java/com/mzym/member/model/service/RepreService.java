package com.mzym.member.model.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.commit;
import static com.mzym.common.template.JDBCTemplate.getConnection;
import static com.mzym.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mzym.board.vo.Video;
import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.dao.RepreDao;
import com.mzym.member.model.vo.Member;
import com.mzym.member.model.vo.RepreDate;
import com.mzym.member.model.vo.ReprePayment;
import com.mzym.mypage.model.vo.Product;

public class RepreService {
	
	private RepreDao rDao = new RepreDao();

	public List<RepreDate> selectPaymentDate() {
		Connection conn = getConnection();
		List<RepreDate> list = rDao.selectPaymentDate(conn);
		close(conn);
		return list;
	}

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = rDao.selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public int selectMovieCount() {
		Connection conn = getConnection();
		int listCount = rDao.selectMovieCount(conn);
		close(conn);
		return listCount;
	}
	
	public int selectProductCount() {
		Connection conn = getConnection();
		int listCount = rDao.selectProductCount(conn);
		close(conn);
		return listCount;
	}
	
	public int selectTrainerCount() {
		Connection conn = getConnection();
		int listCount = rDao.selectTrainerCount(conn);
		close(conn);
		return listCount;
	}

	public List<Member> selectListMember(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = rDao.selectMember(conn, pi);
		close(conn);
		return list;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = rDao.updateMember(conn, m);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		int result = rDao.deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Video> selectListVdieo(PageInfo pi) {
		Connection conn = getConnection();
		List<Video> list = rDao.selectVideo(conn, pi);
		close(conn);
		return list;
	}

	public int insertVideo(Video v) {
		Connection conn = getConnection();
		int result = rDao.insertVideo(conn, v);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateVideo(Video v) {
		Connection conn = getConnection();
		int result = rDao.updateVideo(conn, v);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteVideo(int videoNo) {
		Connection conn = getConnection();
		int result = rDao.deleteVideo(conn, videoNo);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Product> selectListProduct(PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = rDao.selectProduct(conn, pi);
		close(conn);
		return list;
	}

	public int insertProduct(Product p) {
		Connection conn = getConnection();
		int result = rDao.insertProduct(conn, p);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateProduct(Product p) {
		Connection conn = getConnection();
		int result = rDao.updateProduct(conn, p);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteProduct(int productNo) {
		Connection conn = getConnection();
		int result = rDao.deleteProduct(conn, productNo);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Member> selectListTrainer(PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = rDao.selectTrainer(conn, pi);
		close(conn);
		return list;
	}

	public int insertTr(Member m) {
		Connection conn = getConnection();
		int result = rDao.insertTr(conn, m);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateTr(Member m) {
		Connection conn = getConnection();
		int result = rDao.updateTr(conn, m);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteTr(int trNo) {
		Connection conn = getConnection();
		int result = rDao.deleteTr(conn, trNo);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
