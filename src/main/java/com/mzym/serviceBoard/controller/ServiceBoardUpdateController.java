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
import com.mzym.serviceBoard.service.ServiceBoardService;
import com.mzym.serviceBoard.vo.ServiceBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ServiceBoardUpdateController
 */
@WebServlet("/update.sev")
public class ServiceBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/serviceUpfile/"); 
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8", new RenameFile());
			
			
			int serviceNo = Integer.parseInt(multiRequest.getParameter("serviceNo"));
			String boardContent = multiRequest.getParameter("newcontent");
		
			ServiceBoard sb = new ServiceBoard();
			sb.setServiceNo(serviceNo);
			sb.setServiceContent(boardContent);
			
			// 새로 넘어온 첨부파일이 있을 경우 => 새로운 첨부파일에 대한 정보를 db에 기록 
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile")!=null) {
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("/resources/serviceUpfile/");
				
				if(multiRequest.getParameter("originFileNo") !=null) {
					System.out.println(multiRequest.getParameter("originFileNo"));
				at.setFileNO((Integer.parseInt(multiRequest.getParameter("originFileNo"))));
				}else {	
				
				at.setAttNo(serviceNo);
				}
				
			}
			int result = new ServiceBoardService().updateServiceBoard(sb, at);
			
			if (result > 0) {
				request.getSession().setAttribute("alertMsg", "글 수정이 완료되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.service");
				
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
