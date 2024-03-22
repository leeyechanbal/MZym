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
		// 해쉬맵에 담을 거기 때문에 뒤에 서 사용할 예정
		String num2 = request.getParameter("categoryNum");
		// 위의 두 파라매터가 null 체크
		if(num != null && num2 != null) {
			int currentPage = Integer.parseInt(num);
			int categoryNum = Integer.parseInt(num2);
			
			String status = request.getParameter("status");
			String type = "board";
			
			HashMap<String, Object> hash = new HashMap<>();
			hash.put("categoryNum", categoryNum);
			hash.put("status", status);
			hash.put("type", type);
			
			// 게시글인 경우에 반환되는 페이징
			int listCount = new BoardService().reportCount(hash);
			PageInfo infoBoard = new PageHandler().getPaging(listCount, currentPage, 10, 10);
			
//			type = "comment";  해쉬 맵에서는 문자열은 기존이 변경되도 바뀌지 않는다.
//			
			hash.replace("type", "comment");
			// 댓글인 경우에 반환 되는 페이징
			listCount = new BoardService().reportCount(hash);
			PageInfo infoComment = new PageHandler().getPaging(listCount, currentPage, 10, 10);
			
			
			
			
			if(listCount > 0 && infoBoard != null && infoComment != null) {
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
