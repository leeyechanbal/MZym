package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Advice;

/**
 * Servlet implementation class ConsultingInsertController
 */
@WebServlet("/insertConsulting.bo")
public class ConsultingInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultingInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		int category = Integer.parseInt(request.getParameter("category"));
		String adviceDate = request.getParameter("adviceDate");
		String adviceContent = request.getParameter("adviceContent");
		
		Advice a = new Advice(category,userName, phone, adviceDate, adviceContent);
		
		
		int result = new BoardService().insertAdvice(a);
		
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "상담신청완료했습니다! MZYM 회원가입도 해보세요!");
			response.sendRedirect(request.getContextPath() + "/signupForm.me");
		}else {
			request.getSession().setAttribute("alertMsg", "상담신청이 실패했습니다 다시 시도해주세요");
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
