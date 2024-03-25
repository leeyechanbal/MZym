package com.mzym.serviceBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.serviceBoard.service.ServiceBoardService;

/**
 * Servlet implementation class TrainerUpdateServiceBoardRepeatController
 */
@WebServlet("/updateServiceBoard.trainer")
public class TrainerUpdateServiceBoardRepeatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerUpdateServiceBoardRepeatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int serviceNo = Integer.parseInt(request.getParameter("no"));
		String repeat = request.getParameter("repeat");
		
		int result = new ServiceBoardService().updateRepeat(serviceNo, repeat);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/serviceBoardList.trainer");
		}else {
			
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
