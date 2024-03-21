package com.mzym.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mzym.member.model.vo.Member;
import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Food;

/**
 * Servlet implementation class AjaxMyPageDeleteMenuController
 */
@WebServlet("/deletemenu.me")
public class AjaxMyPageDeleteMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMyPageDeleteMenuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int foodUser = loginUser.getUserNo();
		
		int foodNo = Integer.parseInt(request.getParameter("foodNo"));
		
		List<Food> list = new MyPageService().deleteFood(foodUser, foodNo);
		
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
