package com.mzym.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Board;

/**
 * Servlet implementation class FreeBoardDetailController
 */
@WebServlet("/freedetail.bo")
public class FreeBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardService bService = new BoardService();
		
		int result = bService.increaseFreeCount(boardNo);
		
		if(result > 0) {
			Board b = bService.selectFreeBoard(boardNo);
			Attachment at = bService.selectFreeAttachment(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("/views/board/freeboard/freeBoardDetail.jsp").forward(request, response);		
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
