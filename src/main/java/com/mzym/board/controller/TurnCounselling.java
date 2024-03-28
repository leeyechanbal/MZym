package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Advice;

/**
 * Servlet implementation class TurnAdvice
 */
@WebServlet("/turnAdvice.trainer")
public class TurnCounselling extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnCounselling() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String a = request.getParameter("adviceNo");
		String status = request.getParameter("status");
		
		if (a != null && status != null) {
			int adviceNo =  Integer.parseInt(a);
			String repeat = request.getParameter("repeat");
			String trainerID = request.getParameter("trainerId");
			
			System.out.println();
			
			Advice ad = new Advice(adviceNo, trainerID, repeat, status);
			
			int result = new BoardService().adviceTuring(ad);
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("alert", "반영되었습니다.");
				response.sendRedirect(request.getContextPath() + "/counseling.trainer?pageY=1&pageN=1");
			}else {
				session.setAttribute("alert", "요청에 실패 되었습니다.");				
			}
			
		}else {
			/*에러페이지 출력*/					
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
