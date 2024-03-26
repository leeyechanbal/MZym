package com.mzym.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Attachment;
import com.mzym.board.vo.Board;
import com.mzym.common.template.MyFileRenamePolicy;
import com.mzym.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfile/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			int star = Integer.parseInt(multiRequest.getParameter("star"));
			int userNo = ((Member)(request.getSession().getAttribute("loginUser"))).getUserNo();

			Board b = new Board();
			
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setReviewRate(star);
			b.setBoardWriter(userNo);
			
			List<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "upfile" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/thumbnail_upfile/");
					at.setFileLevel(i == 1 ? 1 : 2);
					
					list.add(at);
				}
			}
			
			int result = new BoardService().insertReviewBoard(b, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re");
				
			}else {
				request.getSession().setAttribute("alertMsg", "게시글 등록에 실패했습니다.");
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
