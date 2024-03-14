<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.vo.Member" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!-- 
	작성자 : 이예찬
	부트스트랩의 정보 와 css, js 파일 위치도 가져옴
	현재 로그인 회원과 알림창등에 관한 기능 수행
 -->
<%
	
	Member currentUser = (Member)request.getSession().getAttribute("");
	String currentDate = new SimpleDateFormat("YYYY년 MM월 dd일").format(new Date());
	String mzymPath = request.getContextPath();
	String alertMsg = (String)request.getSession().getAttribute("alertMsg");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
	<link href="<%=mzymPath %>/resources/css/leeyechan/trailnerLee.css" rel="stylesheet" type="text/css">
	<script src="<%=mzymPath %>/resources/js/trailnerLee.js" rel="javascript"></script>

</head>
<body>
	
	<%if(alertMsg != null){%>
		<script>
			alert('<%=alertMsg%>');
			
		</script>
	<% session.removeAttribute("alertMsg");
		} 
	%>
		
	<table id="outTable">
        
        <thead>
            <a class="section1" id="back" onclick="history.back();"><img src="<%=mzymPath %>/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></a>
            <td class="section2" id="logo"><img src="<%=mzymPath %>/resources/img/icon/logo-sm-170x100.png" alt="로고"></td>
            <td class="section3"></td>
        </thead>
				
</body>
</html>