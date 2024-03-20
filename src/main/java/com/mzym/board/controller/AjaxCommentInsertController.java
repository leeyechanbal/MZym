package com.mzym.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Comment;
import com.mzym.member.model.vo.Member;

/**
 * Servlet implementation class AjaxCommentInsertController
 */
@WebServlet("/rinsert.bo")
public class AjaxCommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String commentContent = request.getParameter("content");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Comment c = new Comment();
		c.setBoardNo(boardNo);
		c.setCommentContent(commentContent);
		c.setCommentWriter(String.valueOf(userNo));
		
		int result = new BoardService().insertComment(c);
		
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
