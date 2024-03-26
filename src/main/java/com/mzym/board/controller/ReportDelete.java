package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.board.service.BoardService;

/**
 * Servlet implementation class ReportDelete
 */
@WebServlet("/reportDelete.trainer")
public class ReportDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 선택된 요소에 해당하는 데이터의 상태값을 k로 변경요청하는 서블릿
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String a = request.getParameter("reportNo");
		String cate = request.getParameter("cate");
		
		HttpSession session = request.getSession();
		if(a != null) {
			int reportNo = Integer.parseInt(a);
			
			int result = new BoardService().deleteReport(reportNo);
			
			if(result > 0) {
				session.setAttribute("alert", "삭제 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/report.trainer?pageC=1&pageB=1&cate="+ cate +"&status=N");
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
