package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Advice;
import com.mzym.common.paging.PageHandler;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class CounselingManigment
 */
@WebServlet("/counseling.trainer")
public class CounselingManigment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselingManigment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currantPageY = Integer.parseInt(request.getParameter("pageY"));
		int currantPageN = Integer.parseInt(request.getParameter("pageN"));
		
		String checkY = "Y";
		String checkN = "N";
		
		int listCountY = new BoardService().selectCounselingCount(checkY);
		int listCountN = new BoardService().selectCounselingCount(checkN);
		
		PageInfo infoY = new PageHandler().getPaging(listCountY, currantPageY, 10, 10);
		PageInfo infoN = new PageHandler().getPaging(listCountN, currantPageN, 10, 10);
		
		if(infoY != null && infoN != null) {
			List<Advice> listY = new BoardService().selectAdvice(infoY, checkY);
			List<Advice> listN = new BoardService().selectAdvice(infoN, checkN);
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
