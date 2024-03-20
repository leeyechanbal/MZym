package com.mzym.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.mzym.common.util.UtilMethod.generateRandomString;
import com.mzym.member.model.service.MemberService;
import com.mzym.member.model.vo.Member;

/**
 * Servlet implementation class AjaxMemberFindPwdController
 */
@WebServlet("/findPwd.me")
public class AjaxMemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		Member m = new Member();
		m.setUserId(userId);
		m.setPhone(phone);
		m.setEmail(email);
		
		int selectResult = new MemberService().findPwd(m);
		String findPwd = "";
		if(selectResult > 0) { // 입력한 정보가 맞을때
			findPwd = generateRandomString();
			int updateResult = new MemberService().resetPwd(userId, findPwd);
			if(updateResult>0) {
				System.out.println("비밀번호 업데이트 성공");
			}else {
				findPwd = "";
				System.out.println("비밀번호 업데이트 실패");
			}
		}

		response.getWriter().print(findPwd);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
