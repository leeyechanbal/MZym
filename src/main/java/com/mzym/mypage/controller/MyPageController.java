package com.mzym.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.member.model.vo.Member;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request,  HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 Member loginUser = (Member)session.getAttribute("loginUser");
		 
		 String RRN = loginUser.getRRN();
		 String strB = RRN.substring(0,6);
		 String strG = RRN.substring(7,8);
		 
		 
		 String frontYear = strB.substring(0,2);
		 String year = null;
		 
		 if(Integer.parseInt(frontYear) >= 23) {
			 year = "19" + frontYear;
		 }else {
			 year = "20" + frontYear;
		 }
		 String month = strB.substring(2,4);
		 String day = strB.substring(4,6);
		 
		 String birth = year + "년 " + month + "월 " + day + "일";
		 
		 int gNum = Integer.parseInt(strG);
		 
		 String gender = null;
		 if(gNum % 2 == 0) {
			 gender = "여성";
		 }else {
			 gender = "남성";
		 }
		 
		 request.setAttribute("birth", birth);
		 request.setAttribute("gender", gender);
		 
		 
		 
		 
		
		request.getRequestDispatcher("/views/mypage/myPageInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
