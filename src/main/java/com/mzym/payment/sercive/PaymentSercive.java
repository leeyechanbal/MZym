package com.mzym.payment.sercive;
import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;


import com.mzym.payment.dao.PaymentDao;
import com.mzym.payment.model.vo.Payment;

public class PaymentSercive {
	
	private PaymentDao payDao = new PaymentDao();

	public int insertPayment(Payment pay) {
		Connection conn = getConnection();
		int result = payDao.insertPayment(conn,pay);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}
