package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Board;
import com.mzym.board.vo.BoardCategory;

/**
 * Servlet implementation class FreeBoardDeleteController
 */
@WebServlet("/deleteFree.bo")
public class FreeBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	    
	    Board b = new Board();
	    b.setBoardNo(boardNo); // 수정: 파라미터로 전달된 boardNo를 설정
	    
	    int result = new BoardService().deleteFreeBoard(b);
	    
	    response.getWriter().print(result);
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
