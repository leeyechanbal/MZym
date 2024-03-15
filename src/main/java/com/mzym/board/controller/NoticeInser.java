package com.mzym.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Notice;
import com.mzym.common.file.RenameFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertNotice
 */
@WebServlet("/insertNotice.trainer")
public class NoticeInser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
//		String filePath = request.getSession().getServletContext().getRealPath("/resources/upfile/");
//		System.out.println(filePath);
//		
		
		// 주어진 HTTP 요청이 멀티파트(form-based file upload) 요청인지 여부를 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxFileSize = 10 * 1024 * 1024;
			
			// 물리적인 파일 경로
			String filePath = request.getSession().getServletContext().getRealPath("/resources/upfile/");
//			System.out.println(filePath);
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxFileSize, "UTF-8", new RenameFile());  
			
			/*
			관리자 로그인 세션완료시 구현 회원번호 필요
			int memberNo = request.getSession().getAttribute("loginuser").get();
			*/
			Notice n = new Notice( 1 ,multiRequest.getParameter("title"), multiRequest.getParameter("content")); 
			
			Attachment att = null;
			// 문자열로 전달된 이름의 파일의 원본명을 반환
			String origin = multiRequest.getOriginalFileName("file");
			
			if(origin != null) {
				att = new Attachment(origin, multiRequest.getFilesystemName("file"), "/resources/upfile/");
			}
			
			int num = new BoardService().insertBoard(n, att);
			System.out.println("num " + num);
			
			HttpSession session = request.getSession();
			
			if(num > 0) {
				session.setAttribute("alert", "성공적으로 추가 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/listNotice.trainer?page=1");
			} else {
				// 에러페이지 할까 말까?
				new File(filePath, att.getChangeName()).delete();
				session.setAttribute("alert", "등록에 실패 했습니다.");
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
