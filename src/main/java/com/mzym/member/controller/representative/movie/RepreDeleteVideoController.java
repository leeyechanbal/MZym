package com.mzym.member.controller.representative.movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.member.model.service.RepreService;

/**
 * Servlet implementation class RepreDeleteVideoController
 */
@WebServlet("/deleteVideo.re")
public class RepreDeleteVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepreDeleteVideoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int videoNo = Integer.parseInt(request.getParameter("videoNo"));

		int result = new RepreService().deleteVideo(videoNo);	
		
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "영상삭제 완료했습니다");
			response.sendRedirect(request.getContextPath() + "/movieForm.re");
		}else {
			request.getSession().setAttribute("alertMsg", "영상삭제가 실패했습니다 다시 시도해주세요");
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
