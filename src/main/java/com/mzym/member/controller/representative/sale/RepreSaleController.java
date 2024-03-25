package com.mzym.member.controller.representative.sale;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.member.model.service.RepreService;
import com.mzym.member.model.vo.RepreDate;
import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Product;

/**
 * Servlet implementation class RepreSaleController
 */
@WebServlet("/selectDate.re")
public class RepreSaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepreSaleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<RepreDate> dateList = new RepreService().selectPaymentDate();
		List<Product> pList = new MyPageService().selectProdcut();
		
		request.setAttribute("dateList", dateList);
		request.setAttribute("pList", pList);
		
		request.getRequestDispatcher("/views/representative/repreSales.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
