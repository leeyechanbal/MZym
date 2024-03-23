package com.mzym.member.controller.representative.sale;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mzym.mypage.model.service.MyPageService;

/**
 * Servlet implementation class RepreSaleDeleteController
 */
@WebServlet("/deletePayment.re")
public class RepreSaleDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepreSaleDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int paymentNo = Integer.parseInt(request.getParameter("paymentNo"));
		
		
		int result = new MyPageService().deletePayment(paymentNo);	
		
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "매출삭제 완료했습니다");
			response.sendRedirect(request.getContextPath() + "/selectDate.re");
		}else {
			request.getSession().setAttribute("alertMsg", "매출삭제가 실패했습니다 다시 시도해주세요");
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
