package com.mzym.trainer.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.trainer.board.service.BoardService;
import com.mzym.trainer.board.vo.Notice;

/**
 * Servlet implementation class BoardManigement
 */
@WebServlet("/board.trainer")
public class BoardManigement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardManigement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 공지사항 페이지 이동
	 * db에서 공지사항에 대한 정보를 조회한 뒤에 응답페이지에 전달하는 서블릿
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Notice> list = new BoardService().selectNotice();
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/trainer/Leeyechan/boardNotice.jsp").forward(request, response);			
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
