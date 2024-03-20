package com.mzym.serviceBoard.service;



import static com.mzym.common.template.JDBCTemplate.*;

import static com.mzym.common.template.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.mzym.board.vo.Attachment;
import com.mzym.common.paging.PageInfo;
import com.mzym.serviceBoard.dao.ServiceBoardDao;
import com.mzym.serviceBoard.vo.ServiceBoard;
import com.mzym.serviceBoard.vo.ServiceCategory;

public class ServiceBoardService {
	private ServiceBoardDao sDao = new ServiceBoardDao();

	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = sDao.selectListCount(conn);
		close(conn);
		
		return listCount;
	}

	public List<ServiceBoard> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		List<ServiceBoard> list = sDao.selectList(conn, pi);
		
		close(conn);
		return list;
		
	}

	public List<ServiceCategory> selectListCategory() {
		Connection conn = getConnection();
		List<ServiceCategory> list = sDao.selectListCategory(conn);
		close(conn);
		
		
		return list;
	}

	public int insertServiceBoard(ServiceBoard sb, Attachment at) {
		Connection conn = getConnection();
		int result1 =sDao.insertBoard(conn, sb);
		
		int result2 =1; 
		if(at !=null) {
			result2 = sDao.insertAttachment(conn,at);
		}
		if(result1>0 && result2> 0) {
			commit(conn);
		} else { 
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}

	public int deleteBoard(int serviceNo) {
		
		Connection conn = getConnection();
		int result = sDao.deleteBoard(conn, serviceNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateServiceBoard(ServiceBoard sb, Attachment at) {
		Connection conn = getConnection();
		int result1 = sDao.updateServiceBoard(conn, sb);
		int result2 = 1;
		
		if(at != null) {
			if(at.getFileNO()!=0) {
				result2 = sDao.updateAtt(conn, at);
			}else {
				result2 = sDao.updatenewAtt(conn, at);
			}
		}
		if(result1>0&&result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public List<ServiceBoard> selectSerchList(PageInfo pi, String keyword) {
		
		Connection conn = getConnection();
		List<ServiceBoard> list = sDao.selectSerchList(conn, pi,keyword);
		
		close(conn);
		return list;
	}

	public int selectSerchListCount(String keyword) {
		
		Connection conn = getConnection();
		int listCount = sDao.selectSerchListCount(conn ,keyword);
		close(conn);
		
		return listCount;
	}

	
	
	
	
}
