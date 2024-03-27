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
 * Servlet implementation class ReportRequest
 */
@WebServlet("/reportRequest.trainer")
public class ReportRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * type이 1이면 신고 철회를 type이 2이면 신고 확인 처리를 하는 서블릿
	 * 신고 번호(reportNo) 와  보고서(text)을 받아옴
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String t = request.getParameter("type");
		String r = request.getParameter("reportNo");
		String c = request.getParameter("typeCheck");
		HttpSession session = request.getSession();
		
//	System.out.println("tlfgod");
		
		if(t != null && r != null && c != null) {
			int type = Integer.parseInt(t); // 1: 철회 2: 신고확인
			int reportNo = Integer.parseInt(r); //	신고 글 번호		
			int check = Integer.parseInt(c); // 게시글, 댓글
			String text = request.getParameter("text"); // 보고서 내용
			String cate = request.getParameter("cate"); // 현재 사용자가 보고 있는 카테고리 위치
			String reporter = request.getParameter("reporter"); // 보고서 작성자
			
			HashMap<String, Object> hash = new HashMap<>();
			hash.put("type", type);
			hash.put("reportNo", reportNo);
			hash.put("text", text);
			hash.put("check", check);
			hash.put("reporter", reporter);
			
			
			int result = new BoardService().reportRequest(hash);
			
//			System.out.println("controller   " + result);
			
			if(result > 0) {
				session.setAttribute("alert", "요청에 성공 했습니다.");
				
				response.sendRedirect(request.getContextPath() + "/report.trainer?pageC=1&pageB=1&cate="+ cate +"&status=N");
			} else {
				session.setAttribute("alert", "요청에 실패 했습니다.");
			}
			
			
		}else {
			session.setAttribute("alert", "보고서를 작성 하셨나요?");
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
