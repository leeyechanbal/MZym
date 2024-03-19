package com.mzym.calendar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		int result = new CalendarService().ptCalendarInsert(cal, userName, phone);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alert", "일정 등록에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.cal");
			
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
