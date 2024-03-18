package com.mzym.serviceBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.serviceBoard.service.ServiceBoardService;
import com.mzym.serviceBoard.vo.ServiceCategory;

/**
 * Servlet implementation class ServiceBoardEnrollformController
 */
@WebServlet("/enroll.service")
public class ServiceBoardEnrollformController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceBoardEnrollformController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		List<ServiceCategory> list = new ServiceBoardService().selectListCategory();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/board/serviceboard/serviceBoardEnrollForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
