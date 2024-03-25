package com.mzym.mainpage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.board.service.BoardService;
import com.mzym.board.vo.Board;
import com.mzym.member.model.service.MemberService;
import com.mzym.member.model.vo.Member;



/**
 * Servlet implementation class InfoTRController
 */
@WebServlet("/main.do")
public class MainpageInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainpageInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> trList = null;
		List<Board> List1 = null;
		List<Board> List2 = null;
		
		MemberService memberService = new MemberService();
		
		BoardService  BoardService = new BoardService();
		
		trList = memberService.infoTr();
		List1 = BoardService.latestpostFreeBoard();
		List2 = BoardService.latestpostFreeBoard2();
		
		  
		request.setAttribute("trList", trList);
		request.setAttribute("List1", List1);
		request.setAttribute("List2", List2);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		}	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
