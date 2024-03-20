package com.mzym.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MyPgeUpdateController
 */
@WebServlet("/update.me")
public class MyPageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String phone = request.getParameter("newPhone");
		String email = request.getParameter("newEmail");
		String address = request.getParameter("newAddress");
		
		HttpSession session = request.getSession();
	    Member loginUser = (Member)session.getAttribute("loginUser");
	    String userId = loginUser.getUserId();

		Member m = new Member(userId, phone, email, address);
		
		Member updateMem = new MyPageService().updateMyPage(m);
		
		if(updateMem == null) {
			session.setAttribute("alertMsg", "회원정보 변경에 실패했습니다.");
			
		}else {
			session.setAttribute("alertMsg", "성공적으로 회원정보 변경되었습니다.");
			session.setAttribute("loginUser", updateMem);
		}
		response.sendRedirect(request.getContextPath() + "/myPage.me");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
