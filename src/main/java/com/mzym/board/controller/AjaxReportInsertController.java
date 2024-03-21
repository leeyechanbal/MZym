package com.mzym.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Report;

/**
 * Servlet implementation class AjaxReportInsertController
 */
@WebServlet("/report.bo")
public class AjaxReportInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("postId"));
		int reportUser = Integer.parseInt(request.getParameter("reporterId"));
		int CategoryNo = Integer.parseInt(request.getParameter("reportReason"));
		
		Report r = new Report();
		r.setBoardNo(boardNo);
		r.setReportUser(reportUser);
		r.setCategoryNo(CategoryNo);
		
		int result = new BoardService().insertReport(r);
		
		response.getWriter().print(result);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
