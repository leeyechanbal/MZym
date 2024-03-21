package com.mzym.member.model.dao;

import static com.mzym.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mzym.member.model.vo.RepreDate;

public class RepreDao {

	private Properties prop = new Properties();
	
	public RepreDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/repre-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String formatDate(String inputDate) {
        // 입력된 문자열에서 연도와 월을 추출합니다.
        String year = inputDate.substring(2, 4); // 년도의 뒤 두 자리 추출
        String month = inputDate.substring(5, 7); // 월 추출
        
        // 년도와 월을 조합하여 원하는 형식으로 변환합니다.
        String formattedDate = year + "년" + month + "월";
        
        return formattedDate;
    }
	
	public List<RepreDate> selectPaymentDate(Connection conn) {
		List<RepreDate> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPaymentDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new RepreDate(formatDate(rset.getString("year_month")),
												  rset.getString("year_month")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
