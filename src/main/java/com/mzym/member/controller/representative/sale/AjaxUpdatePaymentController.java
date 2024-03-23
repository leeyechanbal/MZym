package com.mzym.member.controller.representative.sale;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.mypage.model.service.MyPageService;
import com.mzym.mypage.model.vo.Payment;

/**
 * Servlet implementation class AjaxSelectProductForSaleController
 */
@WebServlet("/updatePayment.re")
public class AjaxUpdatePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdatePaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
		int productNo = Integer.parseInt(request.getParameter("category"));
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		
//		System.out.println(paymentNo);
//		System.out.println(category);
//		System.out.println(price);
//		System.out.println(date);
		
		Payment updatePayment =  new Payment();
		updatePayment.setPaymentNo(paymentNo);
		updatePayment.setProductNo(productNo);
		updatePayment.setPaymentPrice(price);
		updatePayment.setPaymentDate(date);
		
		int result = new MyPageService().updatePaymentMethod(updatePayment);
		
		if(result > 0) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failure");
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
