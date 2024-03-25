package com.mzym.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.board.service.BoardService;

/**
 * Servlet implementation class BoardMoving
 */
@WebServlet("/moveBoard.trainer")
public class BoardMoving extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMoving() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 부적절한 게시판이 신고 되었을때 신고를 처리하는 서블릿
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 이동 => 
		 * 		1. 신고 테이블 N 변경하기 
		 * 		2. 게시글 번호의 카테고리 번호 변경
		 * 		3. 보고서의 기록을 넣기
		 */
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String a = request.getParameter("reportNo"); // 신고 번호
		String b = request.getParameter("selectNo"); // 변경될 카테고리 번호
		
		if(a != null && b != null ) {
			
			int reportNo = Integer.parseInt(a);
			int selectNo = Integer.parseInt(b);
			
			String cate = request.getParameter("nowCate"); // 현재 사용자가 보고 있는 카테고리 위치
			String text = request.getParameter("text"); // 보고서의 내용

			HashMap<String, Object> hash = new HashMap<>();
			
			hash.put("reportNo", reportNo);
			hash.put("selectNo", selectNo);
			hash.put("text", text);
			
			int result = new BoardService().boardMoving(hash);
		
			
			if(result > 0) {
			
				session.setAttribute("alert", "이동이 완료 되었습니다.");
				
				response.sendRedirect(request.getContextPath() + "/report.trainer?pageC=1&pageB=1&cate="+ cate +"&status=N");
				
			} else {
				session.setAttribute("alert", "다시 시도해 주세요.");
			}
			
		} else {
			session.setAttribute("alert", "실행이 원활하지 않습니다. 관리자를 호출해 주세요.");
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
