package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Report;
import com.mzym.common.paging.PageHandler;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class ReportStandby
 */
@WebServlet("/reportStandby.trainer")
public class ReportStandbyManagment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportStandbyManagment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 페이징 처리, 글 첨부파일 확인, PageInfo랑 List객체 생성 후 전달
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("page");
		if(num != null) {
		
			int currentPage = Integer.parseInt(num);
			
			String status = "Y"; // 신고가 된 개시글 갯수만 조회
			
			int listCount = new BoardService().reportCount(status);
			
			PageInfo info = new PageHandler().getPaging(listCount, currentPage, 10, 10);
			
			if(listCount > 0 && info != null) {
				List<Report> list = new BoardService().selectedBoard(info, status);
			}
			
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
