package com.mzym.member.controller.representative.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.member.model.service.RepreService;
import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;

/**
 * Servlet implementation class AjaxMemberUpdateController
 */
@WebServlet("/updateMember.re")
public class AjaxMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      	
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		String userName = request.getParameter("name");
		String phone = request.getParameter("phone");
		String rRN = request.getParameter("rrn");
		String email = request.getParameter("email");
		String address = request.getParameter("addreess");
		
		Member m = new Member(userId, userPwd, userName, phone, rRN, email, address);
		m.setUserNo(userNo);
		
		int result = new RepreService().updateMember(m);
		
		System.out.println("실행했나?");
		if(result > 0) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failure");
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
