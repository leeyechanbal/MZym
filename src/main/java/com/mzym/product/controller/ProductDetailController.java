package com.mzym.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.mypage.model.vo.Product;
import com.mzym.product.service.ProductService;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/product.detail")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("no"));
		
		ProductService pb = new ProductService();
		
		int result = pb.increaseCount(productNo);
		
		if(result>0) {
			
			Product p = pb.selectProduct(productNo);
			request.setAttribute("p", p);
			request.getRequestDispatcher("/views/board/productboard/productBoardDetail.jsp").forward(request, response);
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
