package com.mzym.mypage.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Payment;
import com.mzym.mypage.model.vo.Product;

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
		 //------------------------나의 이용권 조회--------------------------
		 
		 int userNo = loginUser.getUserNo();
		 Payment pay = new MyPageService().selectPayment(userNo);
		 
		 String proName = null;
		 if(pay != null) {
			 proName = pay.getProductName();
			 String ptStr = proName.substring(3,5);
			 
			 
			 LocalDate currentDate = LocalDate.now();
			 LocalDate expiryDate;
			 int ptNum = 0;
			 int PT = 0;
			 
			 if(ptStr.equals("이용")) {
				 switch(proName) {
				 case "헬스장이용 1개월": expiryDate = currentDate.plusMonths(1); break;
				 case "헬스장이용 3개월": expiryDate = currentDate.plusMonths(3); break;
				 case "헬스장이용 6개월": expiryDate = currentDate.plusMonths(6); break;
				 case "헬스장이용 12개월": expiryDate = currentDate.plusYears(1); break;
				 default:
				 return;
				 }
				 
			 }else {
				 ptNum = Integer.parseInt(ptStr);
				 PT = (int)(Math.random() * ptNum);
				 
				 switch(proName) {
				 case "PT 10회권": expiryDate = currentDate.plusMonths(1); break;
				 case "PT 20회권": expiryDate = currentDate.plusMonths(2); break;
				 case "PT 30회권": expiryDate = currentDate.plusMonths(3); break;
				 case "PT 40회권": expiryDate = currentDate.plusMonths(4); break;
				 default:
				 return;
				 }
				
			 }
			 
			 String health = expiryDate.toString();
			 
			 request.setAttribute("health", health);
			 request.setAttribute("PT", PT);
			 request.setAttribute("ptNum", ptNum);
			 
		 }else {
			 String health = "";
			 int PT = 0;
			 int ptNum = 0;
			 
			 request.setAttribute("health", health);
			 request.setAttribute("PT", PT);
			 request.setAttribute("ptNum", ptNum);
		 }
		
		 
		 
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
