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
 * Servlet implementation class AjaxUpdateVideoController
 */
@WebServlet("/updateVideo.re")
public class AjaxUpdateVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateVideoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int userNo = Integer.parseInt(request.getParameter("videoNo"));
		String title = request.getParameter("title");
		String link = request.getParameter("link");
		int level = Integer.parseInt(request.getParameter("category"));
		
		Video v = new Video();
		v.setVideoNo(userNo);
		v.setVideoTitle(title);
		v.setLink(link);
		v.setVideoLevel(level);
		
		int result = new RepreService().updateVideo(v);
		
		if(result > 0) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failure");
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
