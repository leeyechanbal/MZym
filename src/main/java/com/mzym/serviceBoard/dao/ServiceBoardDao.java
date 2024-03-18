package com.mzym.serviceBoard.dao;

import static com.mzym.common.template.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.mzym.board.vo.Attachment;
import com.mzym.common.paging.PageInfo;
import com.mzym.serviceBoard.vo.ServiceBoard;
import com.mzym.serviceBoard.vo.ServiceCategory;

public class ServiceBoardDao {
	Properties prop = new Properties();
	
	public ServiceBoardDao(){
		try {
			prop.loadFromXML(new FileInputStream(ServiceBoardDao.class.getResource("/db/mappers/serviceBoard-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
		
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	/**
	 *
	 * @param conn
	 * @return listCount
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selctListCount");
	    
		try {
			pstmt = conn.prepareStatement(sql);
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<ServiceBoard> selectList(Connection conn, PageInfo pi) {
		List<ServiceBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectList");
		
	    try {
	    	int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
	    	int endRow = startRow + pi.getBoardLimit() -1 ;    	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ServiceBoard(rset.getInt("service_no"),
								   rset.getString("category_name"),
								   rset.getString("service_title"),
								   rset.getString("USER_ID"), 
								   rset.getString("REGIST_DATE"),
								   rset.getString("service_content")
						)); 
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}

	public List<ServiceCategory> selectListCategory(Connection conn) {
		List<ServiceCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new ServiceCategory(rset.getInt("category_no"),
										     rset.getString("category_name")		
						
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertBoard(Connection conn, ServiceBoard sb) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertServiceBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sb.getCategoryNo());
			pstmt.setString(2, sb.getServiceTitle());
			pstmt.setString(3, sb.getServiceContent());
			//pstmt.setString(4, sb.getServiceUser());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally { 
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
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
