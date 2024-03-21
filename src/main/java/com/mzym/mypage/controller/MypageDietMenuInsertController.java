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
 * Servlet implementation class MypageDietMenuInsertController
 */
@WebServlet("/insertmenu.me")
public class MypageDietMenuInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDietMenuInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//insert 추가-------------------------------
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int foodUser = loginUser.getUserNo();
		
		String menu = request.getParameter("menu");
		String category = request.getParameter("category");
		int kcal = Integer.parseInt(request.getParameter("kcal"));
		
		int result = new MyPageService().insertFood(foodUser, category, menu, kcal);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 추가되었습니다.");
		}else {
			session.setAttribute("alertMsg", "추가하는데 실패하였습니다.");
		}
		//-----------------------------------------
		
		response.sendRedirect(request.getContextPath() + "/dietmenu.me");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
