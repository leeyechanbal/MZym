package com.mzym.calendar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mzym.calendar.service.CalendarService;
import com.mzym.calendar.vo.Calendar;

/**
 * Servlet implementation class CalendarInsertController
 */
@WebServlet("/insert.cal")
public class CalendarInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("ptUserName");
		String calColor = request.getParameter("calColor");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String phone = request.getParameter("userPhone");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int trNo = Integer.parseInt(request.getParameter("trNo"));
		
		Calendar cal = new Calendar();
		
		cal.setCalColor(calColor);
		cal.setStartDate(startDate);
		cal.setEndDate(endDate);
		cal.setCalTR(writer);
		cal.setCalTitle(title);
		cal.setCalContent(content);
		cal.setCalUserNo(trNo);
		
		int result = new CalendarService().ptCalendarInsert(cal, phone);
		
		response.setContentType("application/json; charset=UTF-8");
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alert", "일정 등록에 성공하였습니다.");
			new Gson().toJson(result, response.getWriter());
		}else {
			//에러페이지
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
