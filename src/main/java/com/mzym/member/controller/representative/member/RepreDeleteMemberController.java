package com.mzym.member.controller.representative.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.member.model.service.RepreService;

/**
 * Servlet implementation class RepreDeleteMemberController
 */
@WebServlet("/deleteMember.re")
public class RepreDeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepreDeleteMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));

		int result = new RepreService().deleteMember(userNo);	
		
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "매출삭제 완료했습니다");
			response.sendRedirect(request.getContextPath() + "/memberForm.re");
		}else {
			request.getSession().setAttribute("alertMsg", "매출삭제가 실패했습니다 다시 시도해주세요");
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
