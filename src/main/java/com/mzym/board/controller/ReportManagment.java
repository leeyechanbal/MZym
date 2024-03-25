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
import com.mzym.board.vo.BoardCategory;
import com.mzym.board.vo.Report;
import com.mzym.board.vo.ReportCategory;
import com.mzym.common.paging.PageHandler;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class ReportStandby
 */
@WebServlet("/report.trainer")
public class ReportManagment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportManagment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 페이징 처리, 글 첨부파일 확인, PageInfo랑 List객체 생성 후 전달
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String num = request.getParameter("pageB");
		String num2 = request.getParameter("pageC");
		String num3 = request.getParameter("cate");
		
		// 위의 파라매터가 null 체크
		if(num != null && num2 != null && num3 != null) {
			int cpBoard = Integer.parseInt(num);
			int cpComment = Integer.parseInt(num2);
			int categoryNum = Integer.parseInt(num3);
			String status = request.getParameter("status");
			
			String type = "board";
			
			HashMap<String, Object> hash = new HashMap<>();
			hash.put("categoryNum", categoryNum);
			hash.put("status", status);
			hash.put("type", type);
			
			// 게시글인 경우에 반환되는 페이징
			int listCount = new BoardService().reportCount(hash);
			PageInfo infoBoard = new PageHandler().getPaging(listCount, cpBoard, 10, 10);
			
//			type = "comment";  해쉬 맵에서는 문자열은 기존이 변경되도 바뀌지 않는다.
//			
			hash.replace("type", "comment");
			// 댓글인 경우에 반환 되는 페이징
			listCount = new BoardService().reportCount(hash);
			PageInfo infoComment = new PageHandler().getPaging(listCount, cpComment, 10, 10);
			
			List<BoardCategory> bCategory = new BoardService().selectBoardCategory();
			List<ReportCategory> rCategory = new BoardService().selectReportCategory();
			
			
			if(listCount >= 0 && infoBoard != null && infoComment != null) {
				// 게시글인 경우 반호나 대는 신고 리스트
				hash.replace("type", "board");
				List<Report> listBoard = new BoardService().selectedBoard(infoBoard, hash);
				
				// 댓글인 경우 반호나 대는 신고 리스트
				hash.replace("type", "comment");
				List<Report> listComment = new BoardService().selectedBoard(infoComment, hash);
				
				
				request.setAttribute("infoBoard", infoBoard);
				request.setAttribute("listBoard", listBoard);
				request.setAttribute("infoComment", infoComment);
				request.setAttribute("listComment", listComment);
				request.setAttribute("bCategory", bCategory);
				request.setAttribute("rCategory", rCategory);
				request.setAttribute("categoryNum", categoryNum);
				request.setAttribute("status", status);
				
				request.getRequestDispatcher("/views/trainer/Leeyechan/report.jsp").forward(request, response);
			
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
