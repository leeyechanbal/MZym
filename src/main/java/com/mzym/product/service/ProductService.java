package com.mzym.product.service;

import static com.mzym.common.template.JDBCTemplate.close;
import static com.mzym.common.template.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.mzym.common.paging.PageInfo;
import com.mzym.mypage.model.vo.Product;
import com.mzym.product.dao.ProductDao;



public class ProductService {
Properties prop = new Properties();
private ProductDao pDao = new ProductDao();
	public ProductService(){
		try {
			prop.loadFromXML(new FileInputStream(ProductService.class.getResource("/db/mappers/product-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
		
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public List<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Product> list = pDao.selectList(conn, pi);
		
		close(conn);
		return list;
	}
	public int selectListCount() {

		Connection conn = getConnection();
		int listCount = pDao.selectListCount(conn);
		close(conn);
		
		return listCount;
	}
	public List<Product> selectBestList() {
		Connection conn = getConnection();
		List<Product> list = pDao.selectBestList(conn);
		
		close(conn);
		return list;
	}
	
	
	
	
}	
