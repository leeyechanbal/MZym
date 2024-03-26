package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Report;
import com.mzym.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReportCommentInsertController
 */
@WebServlet("/report.co")
public class AjaxReportCommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportCommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commentNo = Integer.parseInt(request.getParameter("reportCommentNo"));
		
		int boardType = Integer.parseInt(request.getParameter("boardType"));
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int reportUser = loginUser.getUserNo();
		
		int CategoryNo = Integer.parseInt(request.getParameter("reportReasonComment"));
		
		Report r = new Report();
		r.setCommentNo(commentNo);
		r.setReportUser(reportUser);
		r.setCategoryNo(CategoryNo);
		
		int result = new BoardService().insertCommentReport(r);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "신고 성공.");
			response.sendRedirect(request.getContextPath() + "/freelist.bo?type=" + boardType);
		}else {
			session.setAttribute("alertMsg", "신고 실패.");
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
