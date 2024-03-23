package com.mzym.inbody.service;

import static com.mzym.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.mzym.inbody.dao.InbodyDao;
import com.mzym.mypage.model.vo.Inbody;

public class InbodyService {
	
	InbodyDao iDao = new InbodyDao();
	
	public Inbody selectInbody(String userPhone) {
		Connection conn = getConnection();
		Inbody ib = iDao.selectInbody(conn, userPhone);
		close(conn);
		return ib;
	}

}
