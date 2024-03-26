package com.mzym.member.controller.representative.trainer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mzym.common.template.MyFileRenamePolicy;
import com.mzym.member.model.service.RepreService;
import com.mzym.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxUpdateTrainerCotroller
 */
@WebServlet("/updateTr.re")
public class AjaxUpdateTrainerCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateTrainerCotroller() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/serviceUpfile/TrainerUpfile/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			String trImgURL = "";
			if(multiRequest.getFilesystemName("trIMG") != null) {
				trImgURL = "/resources/serviceUpfile/TrainerUpfile/" + multiRequest.getFilesystemName("trIMG");				
			}else {
				trImgURL = multiRequest.getParameter("checkIMG");
			}
			
			String trId = multiRequest.getParameter("trId");
			String trPwd = multiRequest.getParameter("trPwd");
			String trName = multiRequest.getParameter("trName");
			String trPhone = multiRequest.getParameter("trPhone");
			String trRRN = multiRequest.getParameter("trRRN");
			String trEmail = multiRequest.getParameter("trEmail");
			String trAddress = multiRequest.getParameter("trAddress");
			String trCareer = multiRequest.getParameter("trCareer");
			String trCert = multiRequest.getParameter("trCert");
			Member m = new Member(trId, trPwd, trName, trPhone, trRRN, trEmail, trAddress, trCareer, trCert, trImgURL);
			
			m.setUserNo(Integer.parseInt(multiRequest.getParameter("trNo")));
			
			
			int result = new RepreService().updateTr(m);	
			if(result > 0) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failure");
			}
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
