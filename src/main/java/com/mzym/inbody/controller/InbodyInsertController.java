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
		String insertName = request.getParameter("insertName");
		String insertPhone = request.getParameter("insertPhone");
		int insertHeight = Integer.parseInt(request.getParameter("insertHeight"));
		int insertWeight = Integer.parseInt(request.getParameter("insertWeight"));
		int insertMetabolism = Integer.parseInt(request.getParameter("insertMetabolism"));
		int insertFat = Integer.parseInt(request.getParameter("insertFat"));
		
		Inbody ib = new Inbody();
		
		//ib.setUserName(insertName);
		ib.setBodyHeight(insertHeight);
		ib.setBodyWeight(insertWeight);
		ib.setBadyMetabolism(insertMetabolism);
		ib.setBodyFat(insertFat);
		
		int result = new InbodyService().insertInbody(ib,insertName, insertPhone);
		response.setContentType("application/json; charset=utf-8");
		
		Inbody userIb = new InbodyService().selectInbody(insertPhone);
		
		if( userIb.getUserName().equals(insertName)) {
			
			new Gson().toJson(result, response.getWriter());
		}else {
			request.getSession().setAttribute("alertMsg", "회원정보가 일치하지 않습니다.");
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
