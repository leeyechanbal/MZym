package com.mzym.member.controller.representative.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mzym.board.vo.Video;
import com.mzym.common.paging.PageInfo;
import com.mzym.member.model.service.RepreService;

/**
 * Servlet implementation class AjaxSelectMovieController
 */
@WebServlet("/selectMovie.re")
public class AjaxSelectMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PageInfo pi = pagingBar(request, response);
		List<Video> vList = new RepreService().selectListVdieo(pi);
		
		HashMap<String, Object> vidoeMap = new HashMap<>();
		vidoeMap.put("pi", pi);
		vidoeMap.put("list", vList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(vidoeMap, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private PageInfo  pagingBar(HttpServletRequest request, HttpServletResponse response) {
		// 메뉴바에 있는 일반게시판 메뉴 클릭시 /list.bo?page=1    => 1번 페이지 요청 
				// 페이징바에 있는 페이지번호 클릭시 /list.bo?page=클릭한번호 => 클릭한페이지 요청
				
				// ------------- 페이징 처리 -------------
				int listCount;		// 현재 게시글 총 갯수
				int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
				int pageLimit;		// 페이징바의 페이지 최대갯수 (몇개 단위씩)
				int boardLimit; 	// 한 페이지에 보여질 게시글 최대갯수 (몇개 단위씩)
				// 위의 4개를 가지고 페이징바의 시작수, 끝수, 가장마지막페이지(총페이지수) 구함
				
				int maxPage; 		// 가장마지막페이지(총페이지수)
				int startPage;		// 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
				int endPage;		//					"				끝수
				
				listCount = new RepreService().selectMovieCount();
				// * currentPage : 사용자가 요청한 페이지수 (현재 띄워줄 페이지)
				currentPage = Integer.parseInt(request.getParameter("pageNo"));
				// * pageLimit : 페이징바의 페이지 최대 갯수 (페이징바의 목록수 단위)
				pageLimit = 5;
				// * boardLimit : 게시글 최대 갯수 (게시글 노출 단위)
				boardLimit = 5;
  
				maxPage = (int)Math.ceil( (double)listCount / boardLimit );
				
				startPage = (currentPage-1) / pageLimit * pageLimit + 1;
				
				endPage = startPage + pageLimit - 1;
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				// * 페이징바를 만들기 위한 데이터 (PageInfo객체)
				// 페이징과 관련된 정보들을 담을 vo 객체 => com.br.common.model.vo.PageInfo
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				return pi;
	}

}
