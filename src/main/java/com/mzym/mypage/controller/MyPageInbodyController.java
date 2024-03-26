package com.mzym.mypage.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Inbody;

/**
 * Servlet implementation class MyPageInbodyController
 */
@WebServlet("/inbody.me")
public class MyPageInbodyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInbodyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    Member loginUser = (Member)session.getAttribute("loginUser");
		 
		String RRN = loginUser.getRRN();
		String strA = RRN.substring(7,8);
		int gNum = Integer.parseInt(strA);
		
		
		String frontYear = null;
		if(gNum == 1 || gNum == 2 || gNum == 5 || gNum == 6) {
			frontYear = "19";
		}else {
			frontYear = "20";
		}
		
		String year = frontYear + RRN.substring(0,2);
		int birthYear = Integer.parseInt(year);
		
		Calendar today = Calendar.getInstance();
		int todayYear = today.get(Calendar.YEAR);
		
		int age = todayYear- birthYear;
		
		String gender = null;
		if(gNum % 2 == 0) {
			gender = "여성";
		}else {
			gender = "남성";
		}
		
		int userNo = loginUser.getUserNo();
		
		Inbody body = new MyPageService().selectInbody(userNo);
		
		double height = body.getBodyHeight();
		height /= 100;
		double weight = body.getBodyWeight();
		
		double bmi = weight/(height*height);
		
		bmi = (int)(bmi*100)/100.0;
		
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("body", body);
		request.setAttribute("bmi", bmi);
	
		request.getRequestDispatcher("/views/mypage/inbodyInfo.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
