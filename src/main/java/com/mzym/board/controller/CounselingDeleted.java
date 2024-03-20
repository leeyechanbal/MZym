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
 * Servlet implementation class CounselingDeleted
 */
@WebServlet("/deleteAdvice.trainer")
public class CounselingDeleted extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselingDeleted() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String num = request.getParameter("adviceNo");
		
		if(num != null) {
			int adviceNo = Integer.parseInt(num);
			
			int result = new BoardService().deletedAdvice(adviceNo);
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("alert", "성공적으로 삭제 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/counseling.trainer?pageY=1&pageN=1");
			}
			
		}else {
			/*에러 페이지*/
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
