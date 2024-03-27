package com.mzym.inbody.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.inbody.service.InbodyService;
import com.mzym.mypage.model.vo.Inbody;

/**
 * Servlet implementation class InbodyUpdateController
 */
@WebServlet("/updateInbody.trainar")
public class InbodyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InbodyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		System.out.println("업데이트 인바디 실행");
		
		String userPhone = request.getParameter("userPhone");
		int height = Integer.parseInt(request.getParameter("height"));
		int weight = Integer.parseInt(request.getParameter("weight"));
		int metabolism = Integer.parseInt(request.getParameter("metabolism"));
		int fat = Integer.parseInt(request.getParameter("fat"));
		
		Inbody ib = new Inbody();
		ib.setBodyHeight(height);
		ib.setBodyWeight(weight);
		ib.setBadyMetabolism(metabolism);
		ib.setBodyFat(fat);
		
		int result = new InbodyService().updateInbody(ib, userPhone);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/indobyForm.trainar");
			
		}else {
			// 에러페이지.
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
