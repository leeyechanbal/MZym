package com.mzym.mypage.model.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.commit;
import static com.mzym.common.template.JDBCTemplate.getConnection;
import static com.mzym.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.vo.Member;
import com.mzym.member.model.vo.ReprePayment;
import com.mzym.mypage.model.dao.MyPageDao;
import com.mzym.mypage.model.vo.Food;
import com.mzym.mypage.model.vo.Inbody;
import com.mzym.mypage.model.vo.Payment;
import com.mzym.mypage.model.vo.Product;

public class MyPageService {

	private MyPageDao myDao = new MyPageDao();
	
	
	public Member updateMyPage(Member m) {

		Connection conn = getConnection();
		int result = myDao.updateMyPage(conn, m);
		
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = myDao.selectMyPage(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public Member selectMyPage(String userId) {
		
		Connection conn = getConnection();
		Member m = myDao.selectMyPage(conn, userId);
		close(conn);
		return m;
	}
	
	public Member updatePwdMember(String userId, String userPwd, String newPwd) {
		
		Connection conn = getConnection();
		int result = myDao.updatePwdMember(conn, userId, userPwd, newPwd);

		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = myDao.selectMyPage(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		int result = myDao.deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int selectListCount(int paymentUser) {
		Connection conn = getConnection();
		int listCount = myDao.selectListCount(conn, paymentUser);
		close(conn);
		return listCount;
	}
	
	public List<Payment> selectList(PageInfo pi, int paymentUser){
		Connection conn = getConnection();
		List<Payment> list = myDao.selectList(conn, pi, paymentUser);
		close(conn);
		return list;
	}
	// 관리자페이지 매출조회 - 구성모
	public List<ReprePayment> selectList(PageInfo pi, String paymentDate){
		Connection conn = getConnection();
		List<ReprePayment> list = myDao.selectList(conn, pi, paymentDate);
		close(conn);
		return list;
	}
	
	public Inbody selectInbody(int userNo) {
		Connection conn = getConnection();
		Inbody body = myDao.selectInbody(conn, userNo);
		close(conn);
		return body;
	}
	
	public Payment selectPayment(int userNo) {
		Connection conn = getConnection();
		Payment pay = myDao.selectPayment(conn, userNo);
		close(conn);
		return pay;
	}
	
	public List<Food> selectListFood(int foodUser){
		Connection conn = getConnection();
		List<Food> list = myDao.selectListFood(conn, foodUser);
		close(conn);
		return list;
	}
	
	public Food selectFood(int foodUser) {
		Connection conn = getConnection();
		Food o = myDao.selectFood(conn, foodUser);
		close(conn);
		return o;
	}
	
	public int insertFood(int foodUser, String category, String menu, int kcal) {
		Connection conn = getConnection();
		int result = myDao.insertFood(conn, foodUser, category, menu, kcal);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public List<Food> deleteFood(int foodUser, int foodNo) {
		Connection conn = getConnection();
		int result = myDao.deleteFood(conn, foodUser, foodNo);
		
		List<Food> list = new ArrayList<>();
		if(result > 0 ) {
			commit(conn);
			list = myDao.selectListFood(conn, foodUser);
		}else {
			rollback(conn);
		}
		close(conn);
		return list;
	}
	
	
	// 구성모 결제내역 전체 조회
	public int selectListCount(String paymentDate) {
		Connection conn = /*JDBCTemplate.*/getConnection();
		int listCount = myDao.selectListCount(conn, paymentDate);
		close(conn);
		return listCount;
	}

	public List<Product> selectProdcut() {
		Connection conn = getConnection();
		List<Product> list = myDao.selectProduct(conn);
		close(conn);
		return list;
	}

	public int insertPayment(Payment p) {
		Connection conn = getConnection();
		int result = myDao.insertPayment(conn, p);
	
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public String selectTotalPrice(String paymentDate) {
		Connection conn = getConnection();
		String totalPrice = myDao.selectTotalPrice(conn, paymentDate);
		close(conn);
		return totalPrice;
	}

	public int updatePaymentMethod(Payment payment) {
		Connection conn = getConnection();
		int result = myDao.updatePaymentMethod(conn, payment);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deletePayment(int paymentNo) {
		Connection conn = getConnection();
		int result = myDao.deletePayment(conn, paymentNo);
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
