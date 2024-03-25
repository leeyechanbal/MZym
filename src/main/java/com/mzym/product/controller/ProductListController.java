package com.mzym.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.common.paging.PageInfo;
import com.mzym.mypage.model.vo.Product;
import com.mzym.product.service.ProductService;

/**
 * Servlet implementation class ProductListController
 */
@WebServlet("/product.list")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		//------------------------- 페이징 처리 -------------------------------
		int listCount; 	
		int currentPage; 
		int pagingLimit; 
		int boardLimit; 
		int maxPage; 
		int startPage;
		int endPage; 

		
		listCount = new ProductService().selectListCount();
		
		
		try {
		    currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
		    
		    currentPage = 1;
		}
		
		pagingLimit = 5;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage-1) / pagingLimit * pagingLimit +1 ;
		
		
		endPage = startPage + pagingLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		
		
		PageInfo pi =  new PageInfo(listCount,currentPage,pagingLimit,boardLimit,maxPage,startPage,endPage);
		
		List<Product> list = new ProductService().selectList(pi);
		List<Product> bestList = new ProductService().selectList(pi);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("bestList", bestList);
		
		request.getRequestDispatcher("/views/board/productboard/productBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
