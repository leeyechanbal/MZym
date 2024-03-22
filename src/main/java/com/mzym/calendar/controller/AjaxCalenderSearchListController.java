package com.mzym.calendar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mzym.calendar.service.CalendarService;
import com.mzym.calendar.vo.Calendar;

/**
 * Servlet implementation class AjaxCalenderSearchListController
 */
@WebServlet("/searchList.cal")
public class AjaxCalenderSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCalenderSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchPhone = request.getParameter("searchPhone");
		String searchUserName = request.getParameter("searchUserName");
		String searchStartDate = request.getParameter("searchStartDate");
		String searchEndDate = request.getParameter("searchEndDate");
		int trNo = Integer.parseInt(request.getParameter("trNo"));
		
		List<Calendar> searchList = new CalendarService().selectSearchList(searchPhone, searchUserName, searchStartDate, searchEndDate, trNo );
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(searchList, response.getWriter());
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
