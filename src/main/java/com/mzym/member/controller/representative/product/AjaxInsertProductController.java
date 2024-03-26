package com.mzym.member.controller.representative.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mzym.common.template.MyFileRenamePolicy;
import com.mzym.member.model.service.RepreService;
import com.mzym.mypage.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxInsertProductController
 */
@WebServlet("/insertProduct.re")
public class AjaxInsertProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/serviceUpfile/ProductUpfile/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			//System.out.println("저장된 파일의 경로: " + "/resources/serviceUpfile/ProductUpfile/" + multiRequest.getFilesystemName("productIMG"));
			
			String productName = multiRequest.getParameter("productName");
			String priceImgURL = "/resources/serviceUpfile/ProductUpfile/" + multiRequest.getFilesystemName("productIMG");
			int price = Integer.parseInt(multiRequest.getParameter("productPrice"));
			
			
			Product p = new Product();
			p.setProductName(productName);;
			p.setPrice(price);
			p.setImageURL(priceImgURL);;
			
			int result = new RepreService().insertProduct(p);	
			response.getWriter().print(result);
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
