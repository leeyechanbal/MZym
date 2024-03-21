package com.mzym.calendar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mzym.calendar.service.CalendarService;
import com.mzym.calendar.vo.Calendar;

/**
 * Servlet implementation class AjaxCalendarUpdateController
 */
@WebServlet("/update.cal")
public class AjaxCalendarUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCalendarUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int calNo = Integer.parseInt(request.getParameter("calNo"));
		String calUserName = request.getParameter("calUserName");
		String calColor = request.getParameter("calColor");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String calPhone = request.getParameter("calPhone");
		String title = request.getParameter("title");
		String content = request.getParameter("contnet");
		int trNo = Integer.parseInt(request.getParameter("trNo"));
		
		Calendar cal = new Calendar();
		
		cal.setCalNo(calNo);
		cal.setCalColor(calColor);
		cal.setStartDate(startDate);
		cal.setEndDate(endDate);
		cal.setCalTitle(title);
		cal.setCalContent(content);
		cal.setCalTR(trNo);
		
		int result = new CalendarService().calendarUpdate(cal, calUserName, calPhone);
		response.setContentType("application/json; charset=utf-8");
		
		if(result > 0) {
			new Gson().toJson(result, response.getWriter());
			
		}else {
			// 에러페이지
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
