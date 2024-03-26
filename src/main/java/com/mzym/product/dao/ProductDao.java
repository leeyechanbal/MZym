package com.mzym.product.dao;


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

import com.mzym.common.paging.PageInfo;
import com.mzym.mypage.model.vo.Product;




public class ProductDao {
	Properties prop = new Properties();
	
	public ProductDao(){
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/product-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
		
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("productListCount");
	    
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

	public List<Product> selectList(Connection conn, PageInfo pi) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("productSelectList");
		
	    try {
	    	int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
	    	int endRow = startRow + pi.getBoardLimit() -1 ;    	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO"),
								 	 rset.getString("PRODUCT_NAME"),
								 	 rset.getString("PRODUCT_CONTENT"),
								 	 rset.getInt("PRODUCT_PRICE"),
								 	 rset.getDate("REGIST_DATE"),
								 	 rset.getInt("COUNT"),
								 	 rset.getString("image_URL")
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

	public List<Product> selectBestList(Connection conn) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("bestProduct");
		
	    try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
					     rset.getInt("PRODUCT_NO"),
					 	 rset.getString("PRODUCT_NAME"),
					 	 rset.getString("PRODUCT_CONTENT"),
					 	 rset.getInt("PRODUCT_PRICE"),
					 	 rset.getDate("REGIST_DATE"),
					 	 rset.getInt("COUNT"),
					 	 rset.getString("IMAGE_URL")
		
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

	public int increaseCount(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	

	public Product selectProduct(Connection conn, int productNo) {
		Product p = null; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset =pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product (rset.getInt("product_no"),
								 rset.getString("PRODUCT_NAME"),
								 rset.getString("PRODUCT_CONTENT"),
								 rset.getInt("PRODUCT_PRICE"),
								 rset.getString("IMAGE_URL")
						);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
}
