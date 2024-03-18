package com.mzym.serviceBoard.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mzym.board.vo.Attachment;
import com.mzym.common.file.RenameFile;
import com.mzym.member.model.vo.Member;
import com.mzym.serviceBoard.service.ServiceBoardService;
import com.mzym.serviceBoard.vo.ServiceBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ServiceBoardInsertController
 */
@WebServlet("/insert.service")
public class ServiceBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 *1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfile/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new RenameFile());
			
			ServiceBoard sb = new ServiceBoard();
			sb.setCategoryNo(multiRequest.getParameter("ServiceCategory"));
			sb.setServiceTitle(multiRequest.getParameter("title"));
			sb.setServiceContent(multiRequest.getParameter("content"));
			
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			sb.setServiceUser(String.valueOf(userNo));
			
			Attachment at = null;
			
			String origin = multiRequest.getOriginalFileName("upfile");
			
			if(origin != null) {
				at = new Attachment(origin, multiRequest.getFilesystemName("upfile"), "/resources/upfile/");
			}
			int result = new ServiceBoardService().insertServiceBoard(sb,at);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "글등록에 성공했습니다!");
				response.sendRedirect(request.getContextPath() + "/list.service?page=1");
			}
			
			
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
