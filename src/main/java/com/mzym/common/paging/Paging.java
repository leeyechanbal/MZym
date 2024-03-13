package com.mzym.common.paging;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.trainer.board.service.BoardService;

/**
 * Servlet implementation class Paging
 */
@WebServlet("/paging.trainer")
public class Paging extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paging() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; //  게시물종류에 따라 총 게시글의 수
		int currentPage = Integer.parseInt(request.getParameter("page"));// 사용자가 요청한 페이지
		int pagingLimit = 10; // 페이지바의 최대 길이
		int boardLimit = 10; // 보여줄 게시물의 총 갯수
		int maxPage; // 가장 마지막 페이지수
		int startPage; // 페이징바의 시작수
		int endPage; // 페이징바의 끝수
		
		String board = request.getParameter("board");
		
		if (board.equals("notice")) {
			listCount = new BoardService().selectNoticeCount();
			System.out.println(listCount);
		} else {
			listCount = 0;
		}
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		// 1000 /10 => 100 , 
		System.out.println(maxPage);
		
		startPage = (currentPage - 1) / pagingLimit * pagingLimit + 1;
		
		endPage = startPage + pagingLimit - 1;
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
