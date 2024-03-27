package com.mzym.inbody.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mzym.inbody.service.InbodyService;
import com.mzym.mypage.model.vo.Inbody;

/**
 * Servlet implementation class AjaxInbodyController
 */
@WebServlet("/inbody.trainar")
public class AjaxInbodyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInbodyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userPhone = request.getParameter("userPhone");
		
		Inbody ib = new InbodyService().selectInbody(userPhone);
		response.setContentType("application/json; charset=utf-8");
		
		
		new Gson().toJson(ib, response.getWriter());
		
		/*
		 * if(ib != null) { new Gson().toJson(ib, response.getWriter()); }else {
		 * response.getWriter().println("회원의 정보가 존재하지 않습니다."); }
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
