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
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/updateNotice.trainer")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 이예찬
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int max = 10 * 1024 *1024;
			String path = request.getSession().getServletContext().getRealPath("/resources/serviceUpfile/");
			
			MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new RenameFile());
			
			
			// 변경 될 공지사항 데이터와, 추가로 들어온 참부파일 데이터
			int no = Integer.parseInt(multi.getParameter("noticeNo"));
			int writer = 2; // 추후 세션값의 트레이너 맴버 번호 가져옴
			String title = multi.getParameter("noticeTitle");
			String content = multi.getParameter("noticeContent");
			String change = multi.getFilesystemName("file");
			String origin = multi.getOriginalFileName("file");
			
			// 원래 첨부파일이 있는지 구별
			boolean checkedFile = multi.getParameter("wasOriginName") != null;
			String wasChange = multi.getParameter("wasChangeName");
			
			
			Notice n = new Notice(no, writer, title, content, new Attachment(origin, change, "/resoureces/serviceUpfile/", checkedFile));
			
			int outcome = new BoardService().updateNotice(n);
//			int outcome = 0;
			
			HttpSession session = request.getSession();
			
			if (outcome > 0) {
				// 기존의 첨부파일 삭제
				if(wasChange != null) {
					new File(path, wasChange).delete();
				}
				session.setAttribute("alert", "요청에 성공 했습니다.");
				response.sendRedirect(request.getContextPath()+"/listNotice.trainer?page=1");
			} else {
				session.setAttribute("alert", "요청에 실패했습니다.");
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
