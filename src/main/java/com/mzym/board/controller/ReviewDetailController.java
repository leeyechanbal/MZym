package com.mzym.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Board;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int BoardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardService bService = new BoardService();
		
		if(bService.increaseFreeCount(BoardNo) > 0) {
			Board b = bService.selectFreeBoard(BoardNo);
			List<Attachment> list = bService.selectAttachmentReview(BoardNo);
		
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/board/reviewboard/reviewBoardDetail.jsp").forward(request, response);
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
