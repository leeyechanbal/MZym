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
 * Servlet implementation class RepreInsertSaleController
 */
@WebServlet("/insertSale.re")
public class RepreInsertSaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepreInsertSaleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String saleName = request.getParameter("insert_name");
		int productNo = Integer.parseInt(request.getParameter("insert_category"));
		int price = Integer.parseInt(request.getParameter("insert_price"));
		String date = request.getParameter("insert_date");
		
		Payment p = new Payment();
		p.setPaymentName(saleName);
		p.setProductNo(productNo);
		p.setPaymentPrice(price);
		p.setPaymentDate(date);
		
		int result = new MyPageService().insertPayment(p);
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "매출추가 완료했습니다");
			response.sendRedirect(request.getContextPath() + "/selectDate.re");
		}else {
			request.getSession().setAttribute("alertMsg", "매출추가가 실패했습니다 다시 시도해주세요");
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
