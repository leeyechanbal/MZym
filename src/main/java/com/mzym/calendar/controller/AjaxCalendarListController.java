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
 * Servlet implementation class CalendarListController
 */
@WebServlet("/list.cal")
public class AjaxCalendarListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCalendarListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int trNo = Integer.parseInt(request.getParameter("trNo"));
		
			
		/*	clist와 mlist
		// cal_tr, start_date, end_date, cal_title, cal_content, cal_color
		List<Calendar> clist = new CalendarService().selectCalendarList(userId);
		// [{}, {}]
		//  user_name, phone
		List<Member> mlist = new CalendarService().selelctMemberList(userId);
		// [{}, {}]
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("clist", clist);
		map.put("mlist", mlist);
		// {clist:[{}, {}], mlist:[{}, {}]}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
		*/
		List<Calendar> clist = new CalendarService().selectCalendarList(trNo);
		
		request.setAttribute("clist", clist);
		// 일정번호, 회원번호, 시작일, 종료일, 회원폰번호 작성자, 제목, 내용, 일정색상
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(clist, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
