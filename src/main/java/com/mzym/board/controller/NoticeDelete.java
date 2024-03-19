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
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/deletedNotice.traniner")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("boardNum") != null) {
			
			int  boardNum= Integer.parseInt(request.getParameter("boardNum"));
			String change = request.getParameter("fileName");
			String type = "N";
	
			int result = new BoardService().deletedNotice(boardNum, change, type);
			
			if(result > 0) {
				session.setAttribute("alert", "삭제 되었습니다.");
				response.sendRedirect(request.getContextPath()+"/listNotice.trainer?page=1");
			}else {
				session.setAttribute("alert", "요청에 실패 했습니다.");
			}
		} else {
			session.setAttribute("alert", "요청에 실패 했습니다.");
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
