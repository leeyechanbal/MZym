package com.mzym.serviceBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mzym.serviceBoard.service.ServiceBoardService;

/**
 * Servlet implementation class AjaxTrainerDeleteServiceBoardController
 */
@WebServlet("/deleteServiceBoard.trainer")
public class AjaxTrainerDeleteServiceBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTrainerDeleteServiceBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = new ServiceBoardService().deleteServiceBoardTR(no);
		response.setContentType("application/json; charset=utf-8");
		
		if(result > 0) {
			new Gson().toJson(result, response.getWriter());
		}else {
			request.getSession().setAttribute("alsertMsg", "게시글 삭제 실패");
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
