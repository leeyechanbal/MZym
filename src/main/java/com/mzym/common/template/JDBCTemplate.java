package com.mzym.common.template;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
		
	/**
	 * @author 이예찬
	 * @return Connection conn
	 * properties에 JDBCTemplate.class의 제시된 파일의 리소스를 URL객체로 반환 
	 * 		=> getPath()을 이용해서 실제 경로를 동적으로 가져옴
	 * 
	 * java.net.URL 클래스
	 * URL이 있다면 이를 URL 객체로 나타내어 해당 리소스에 대한 연결을 만들고 데이터를 읽을 수 있습니다.
	 * URL 객체는 네트워크 리소스의 위치를 나타내며 프로토콜, 호스트 이름, 포트 번호, 경로 등과 같은 정보를 포함합니다.
	 */
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		
		try {
//			밑에 꺼안되면 위에 꺼 해보세요. 
		prop.load(new FileInputStream(JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath()));
			//prop.load(JDBCTemplate.class.getResourceAsStream("/db/driver/driver.properties"));
			
			Class.forName(prop.getProperty("driver"));
			
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("id"), prop.getProperty("pass"));
			
			conn.setAutoCommit(false);
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}    
		
		return conn;
	} //getConnection
	
	/**
	 * @author 이예찬
	 * @param conn
	 * Connection 객체가 null아니고 close되어있지 않을때 db의 데이터를 commite하는 매서드
	 */
	public static void commit(Connection conn) {
		
		try {
			if(conn != null & !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}// commit
	
	/**
	 * @author 이예찬
	 * @param conn
	 * Connection 객체가 null아니고 close되어있지 않을때 db의 데이터를 rollback하는 매서드
	 */
	public static void rollback(Connection conn) {
		try {
			if(conn != null & !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	} // rollback
	
	/**
	 * @author 이예찬
	 * @param conn
	 * Connection 객체가 null아니고 close되어있지 않을때 Connection객체의 자원을 반환하는 매서드
	 */
	public static void close(Connection conn) {
		try {
			if(conn != null & !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}// close(Connection)
	
	/**
	 * @author 이예찬
	 * @param conn
	 * PreparedStatement 객체가 null아니고 close되어있지 않을때 PreparedStatement객체의 자원을 반환하는 매서드
	 */
	public static void close(PreparedStatement psmt) {
		try {
			if(psmt != null & !psmt.isClosed()) {
				psmt.close();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}// close(PreparedStatement)
	
	/**
	 * @author 이예찬
	 * @param conn
	 * ResultSet 객체가 null아니고 close되어있지 않을때 ResultSet객체의 자원을 반환하는 매서드
	 */
	public static void close(ResultSet rest) {
		try {
			if(rest != null & !rest.isClosed()) {
				rest.close();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}//close(ResultSet)
}
