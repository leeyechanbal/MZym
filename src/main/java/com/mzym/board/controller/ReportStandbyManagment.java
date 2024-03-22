package com.mzym.board.controller;

import java.io.IOException;
import java.util.HashMap;
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
			
			String categoryNum = request.getParameter("categoryNum");
			String status = "Y";
			String type = "board";
			
			HashMap<String, String> hash = new HashMap<>();
			hash.put("categoryNum", categoryNum);
			hash.put("status", status);
			hash.put("type", type);
			
			int listCount = new BoardService().reportCount(hash);
			PageInfo infoBoard = new PageHandler().getPaging(listCount, currentPage, 10, 10);
			
//			type = "comment";  해쉬 맵에서는 바뀌지 않는다.
			listCount = new BoardService().reportCount(hash);
			PageInfo infoComment = new PageHandler().getPaging(listCount, currentPage, 10, 10);
			
			
			
			
			if(listCount > 0 && info != null) {
				List<Report> list = new BoardService().selectedBoard(infoComment, hash);
				
				request.setAttribute("info", infoComment);
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("/views/trainer/Leeyechane/reportStandBy.jsp").forward(request, response);
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
