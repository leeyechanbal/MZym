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
 * Servlet implementation class MyPageUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MyPageUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		HttpSession session = request.getSession();
	    Member loginUser = (Member)session.getAttribute("loginUser");
	    String userId = loginUser.getUserId();
		
	    Member updateMem = new MyPageService().updatePwdMember(userId, userPwd, newPwd);
	    
	    if(updateMem == null) {
	    	session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
	    }else {

    	  session.setAttribute("loginUser", updateMem);
    	  session.setAttribute("alertMsg", "성공적으로 비밀번호 변경되었습니다.");
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
