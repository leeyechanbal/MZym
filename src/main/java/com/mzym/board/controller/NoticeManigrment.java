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
import com.mzym.board.vo.Notice;
import com.mzym.common.paging.PageHandler;
import com.mzym.common.paging.PageInfo;

/**
 * Servlet implementation class NoticeManigrment
 */
@WebServlet("/listNotice.trainer")
public class NoticeManigrment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeManigrment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 공지사항에 대한 페이징 처리를 위한 서블릿 
	 * PageHandler을 이용해서 페이징수 처리 후 PageInfo 객체 와 
	 * 페이징 처리된 공지사항등을 가져와 화면단에 전달
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currantPage =   Integer.parseInt(request.getParameter("page"));
		
		int listCount = new BoardService().selectNoticeCount();
		
		PageInfo info = new PageHandler().getPaging(listCount, currantPage, 10, 10);
			
		if (info != null) {
			List<Notice> list = new BoardService().selectNotice(info);

			request.setAttribute("info", info);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/views/trainer/Leeyechan/boardNotice.jsp").forward(request, response);
			
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
