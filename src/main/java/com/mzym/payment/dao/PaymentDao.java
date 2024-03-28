package com.mzym.payment.dao;
import static com.mzym.common.template.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.mzym.payment.model.vo.Payment;


public class PaymentDao {

Properties prop = new Properties();
	
	public PaymentDao(){
		try {
			prop.loadFromXML(new FileInputStream(PaymentDao.class.getResource("/db/mappers/payment-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
		
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public int insertPayment(Connection conn, Payment pay) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayment"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pay.getProductNo());
			pstmt.setInt(2, pay.getPaymentUser());
			pstmt.setInt(3, pay.getPaymentPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { 
			close(pstmt);
		}
		
	
		return result;
	}
	
	
}
