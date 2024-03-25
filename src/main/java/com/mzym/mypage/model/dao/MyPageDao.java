package com.mzym.mypage.model.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.vo.Member;
import com.mzym.member.model.vo.ReprePayment;
import com.mzym.mypage.model.vo.Food;
import com.mzym.mypage.model.vo.Inbody;
import com.mzym.mypage.model.vo.Payment;
import com.mzym.mypage.model.vo.Product;

public class MyPageDao {
	
	private Properties prop = new Properties();
	
	public MyPageDao() {
		try {
			prop.loadFromXML(new FileInputStream(MyPageDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updateMyPage(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMyPage");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getPhone());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMyPage(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no")
							 , rset.getString("user_id")
							 , rset.getString("user_pwd")
							 , rset.getString("user_name")
							 , rset.getString("phone")
							 , rset.getString("RRN")
							 , rset.getString("email")
							 , rset.getString("address")
							 , rset.getDate("enroll_date")
							 , rset.getDate("modify_date")
							 , rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int updatePwdMember(Connection conn, String userId, String userPwd, String newPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMember(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectListCount(Connection conn, int paymentUser) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paymentUser);
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
	
	public List<Payment> selectList(Connection conn, PageInfo pi, int paymentUser){
		
		List<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, paymentUser);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Payment(rset.getString("PAYMENT_DATE"),
							         rset.getString("PRODUCT_NAME"),
							         rset.getInt("PAYMENT_PRICE")));
							         
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 관리자 페이지 매출조회 페이지 - 구성모
	public List<ReprePayment> selectList(Connection conn, PageInfo pi, String paymentDate){
		
		List<ReprePayment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("repreSaleSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, paymentDate);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				if(rset.getString("user_name") == null) {
					list.add(new ReprePayment(
							 rset.getInt("payment_no"),
							 rset.getString("payment_name"),
					         rset.getString("product_name"),
					         rset.getInt("payment_price"),
					         rset.getString("payment_date")
					         ));
				}else {
					list.add(new ReprePayment(
							 rset.getInt("payment_no"),
							 rset.getString("user_name"),
					         rset.getString("product_name"),
					         rset.getInt("payment_price"),
					         rset.getString("payment_date")
					         ));
				}		         
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Inbody selectInbody(Connection conn, int userNo) {
		Inbody body  = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPageInbody");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				body = new Inbody(rset.getInt("body_height"),
								  rset.getInt("body_weight"),
								  rset.getInt("body_fat"),
								  rset.getDate("regist_date"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return body;
	}
	
	public Payment selectPayment(Connection conn, int userNo) {
		Payment pay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pay = new Payment(rset.getInt("payment_no")
								, rset.getString("product_name")
							    , rset.getInt("payment_price")
							    , rset.getString("payment_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pay;
	}

	
	// 결제내역 전체 조회 - 구성모
	public int selectListCount(Connection conn ,String paymentDate) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("repreSelectPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paymentDate);
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
	
	public List<Food> selectListFood(Connection conn, int foodUser) {
		
		List<Food> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListFood");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodUser);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Food(rset.getInt("food_no"),
						          rset.getInt("food_user"),
						          rset.getString("food_date"),
						          rset.getString("food_category"),
						          rset.getString("food_name"),
						          rset.getInt("food_cal"),
						          rset.getString("regist_date")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Food selectFood(Connection conn, int foodUser) {
		Food o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListFood");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodUser);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Food(rset.getInt("food_no")
						   , rset.getInt("food_user")
						   , rset.getString("food_date")
						   , rset.getString("food_category")
						   , rset.getString("food_name")
						   , rset.getInt("food_cal")
						   , rset.getString("regist_date"));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;	
	}
	
	public int insertFood(Connection conn, int foodUser, String category, String menu, int kcal) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFood");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodUser);
			pstmt.setString(2, category);
			pstmt.setString(3, menu);
			pstmt.setInt(4, kcal);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteFood(Connection conn, int foodUser, int foodNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFood");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodUser);
			pstmt.setInt(2, foodNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Product> selectProduct(Connection conn) {
		
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_No"));
				p.setProductName(rset.getString("product_name"));
				p.setPrice(rset.getInt("product_price"));
				list.add(p);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertPayment(Connection conn, Payment p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRepreSale");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getProductNo());
			pstmt.setInt(2, p.getPaymentPrice());
			pstmt.setString(3, p.getPaymentDate());
			pstmt.setString(4, p.getPaymentName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 관리자페이지 금액 총합 조회
	public String selectTotalPrice(Connection conn, String paymentDate) {
		
		String totalPrice = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalPrice");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paymentDate);	
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalPrice = convertToKoreanWon(rset.getInt("TOTAL_PAYMENT_PRICE"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalPrice;
	}
	// 원단위로 변경
	public String convertToKoreanWon(int amount) {
        if (amount < 1000) {
            return amount + "원";
        } else {
            DecimalFormat decimalFormat = new DecimalFormat("#,###");
            return decimalFormat.format(amount) + "원";
        }
    }

	
	// 구성모 결제내역 업데이트
	public int updatePaymentMethod(Connection conn, Payment payment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payment.getProductNo());
			pstmt.setInt(2, payment.getPaymentPrice());
			pstmt.setString(3, payment.getPaymentDate());
			pstmt.setInt(4, payment.getPaymentNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 구성모 결제내역 삭제
	public int deletePayment(Connection conn, int paymentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paymentNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
