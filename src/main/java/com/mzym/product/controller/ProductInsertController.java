package com.mzym.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mzym.member.model.vo.Member;
import com.mzym.payment.model.vo.Payment;
import com.mzym.payment.sercive.PaymentSercive;


/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/insert.product")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proNo = Integer.parseInt(request.getParameter("productNo"));
		HttpSession session =request.getSession();
		int payUser = ((Member)session.getAttribute("loginUser")).getUserNo();
		int price = Integer.parseInt(request.getParameter("totalPrice"));
		
		
		Payment pay = new Payment();
		pay.setProductNo(proNo);
		pay.setPaymentUser(payUser);
		pay.setPaymentPrice(price);
		int result = new PaymentSercive().insertPayment(pay);
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
