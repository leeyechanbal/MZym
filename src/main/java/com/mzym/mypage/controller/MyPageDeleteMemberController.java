package com.mzym.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageDeleteMemberController
 */
@WebServlet("/delete.me")
public class MyPageDeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result= new MyPageService().deleteMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		if(result> 0 ) {
			
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "회원탈퇴가 완료되었습니다.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			session.setAttribute("alertMsg", "회원탈퇴 실패");
			request.getRequestDispatcher("/views/mypage/deleteMember.jsp").forward(request, response);
			
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
