package com.mzym.inbody.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.inbody.service.InbodyService;
import com.mzym.mypage.model.vo.Inbody;

/**
 * Servlet implementation class InbodyInsertController
 */
@WebServlet("/insertInbody.trainar")
public class InbodyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InbodyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String insertName = request.getParameter("insertName");
		String insertPhone = request.getParameter("insertPhone");
		int insertHeight = Integer.parseInt(request.getParameter("insertHeight"));
		int insertWeight = Integer.parseInt(request.getParameter("insertWeight"));
		int insertMetabolism = Integer.parseInt(request.getParameter("insertMetabolism"));
		int insertFat = Integer.parseInt(request.getParameter("insertFat"));
		
		Inbody ib = new Inbody(insertName, insertHeight, insertWeight, insertMetabolism, insertFat);
		
		int result = new InbodyService().insertInbody(ib, insertName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
