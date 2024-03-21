package com.mzym.member.model.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.mzym.member.model.dao.RepreDao;
import com.mzym.member.model.vo.RepreDate;

public class RepreService {
	
	private RepreDao rDao = new RepreDao();

	public List<RepreDate> selectPaymentDate() {
		Connection conn = getConnection();
		List<RepreDate> list = rDao.selectPaymentDate(conn);
		close(conn);
		return list;
	}

}
