package com.mzym.member.controller.representative.movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.vo.Video;
import com.mzym.member.model.service.RepreService;

/**
 * Servlet implementation class AjaxInsertMovieController
 */
@WebServlet("/insertVideo.re")
public class AjaxInsertMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("videoTitle");
		String link = request.getParameter("videoLink");
		int level = Integer.parseInt(request.getParameter("videoCategory"));
		
		Video v = new Video();
		v.setVideoTitle(title);
		v.setLink(link);
		v.setVideoLevel(level);
		
		int result = new RepreService().insertVideo(v);
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
