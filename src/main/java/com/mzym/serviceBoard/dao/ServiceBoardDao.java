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
								   rset.getString("USER_ID"),
								   rset.getString("category_name"),
								   rset.getString("service_title"),
								   rset.getString("service_content"),
								   rset.getString("REGIST_DATE"),
								   rset.getString("SERVICE_TR"),
								   rset.getString("SERVICE_REPEAT"),
								   rset.getString("UPFILEURL"),
								   rset.getInt("file_no"),
								   rset.getString("FILESTATUS")
								 
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
			pstmt.setString(4, sb.getServiceUser());
			
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

	public int deleteBoard(Connection conn, int serviceNo) {
		int result =  0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteServiceBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, serviceNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int updateServiceBoard(Connection conn, ServiceBoard sb) {
		int result =  0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateServiceBoard");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, sb.getServiceContent());
			pstmt.setInt(2, sb.getServiceNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { 
			close(pstmt);
		}
		
		return result;
	}

	public int updateAtt(Connection conn, Attachment at) {
		int result =0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNO());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertNewAtt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getAttNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectSerchListCount(Connection conn, String keyword) {
		int listCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectSerchCount");
	    
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,keyword);
			pstmt.setString(2,keyword);
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

	public List<ServiceBoard> selectSerchList(Connection conn, PageInfo pi, String keyword) {
		List<ServiceBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("selectSerchList");
		
	    try {
	    	int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
	    	int endRow = startRow + pi.getBoardLimit() -1 ;    	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ServiceBoard(rset.getInt("service_no"),
								   rset.getString("USER_ID"),
								   rset.getString("category_name"),
								   rset.getString("service_title"),
								   rset.getString("service_content"),
								   rset.getString("REGIST_DATE"),
								   rset.getString("SERVICE_TR"),
								   rset.getString("SERVICE_REPEAT"),
								   rset.getString("UPFILEURL"),
								   rset.getInt("file_no"),
								   rset.getString("FILESTATUS")
								  
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

	public int deleteImg(Connection conn, int fileNo) {
		int result =  0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteServiceImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fileNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteOldAtt(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOldAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getAttNo());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

		
	/**
	 * @author 김민정
	 */
	public int updateRepeat(Connection conn, int serviceNo, String repeat) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRepeat");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, repeat);
			pstmt.setInt(2, serviceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	/**
	 * @author 김민정
	 */
	public int deleteServiceBoardTR(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteServiceBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
		
	}
	
	
	
	
	
}
