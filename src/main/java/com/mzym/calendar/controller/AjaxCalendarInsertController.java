package com.mzym.calendar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.calendar.service.CalendarService;
import com.mzym.calendar.vo.Calendar;

/**
 * Servlet implementation class CalendarInsertController
 */
@WebServlet("/ajaxinsert.cal")
public class AjaxCalendarInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCalendarInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String calColor = request.getParameter("calColor");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String phone = request.getParameter("phone");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Calendar cal = new Calendar();
		
		cal.setCalColor(calColor);
		cal.setStartDate(startDate);
		cal.setEndDate(endDate);
		cal.setCalTR(writer);
		cal.setCalTitle(title);
		cal.setCalContent(content);
		
		int result = new CalendarService().calInsert(cal, userName, phone);
		
		response.setContentType("application/json; charset=UTF-8");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
