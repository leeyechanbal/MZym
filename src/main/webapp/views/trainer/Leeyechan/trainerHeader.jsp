<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/trainer/Leeyechan/trainerFilter.jsp" %>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String trainerID = loginUser.getUserId();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="outTable">
	
	<thead>
          <td class="section1" id="back" onclick="history.back();"><img style="cursor: pointer;" src="<%=mzymPath %>/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></td>
          <td class="section2" id="logo"><a href="<%=mzymPath%>/login.trainer"><img src="<%=mzymPath %>/resources/img/icon/logo-sm-170x100.png"></a></td>
          <td class="section3"></td>
     </thead>
      
      <tr style="height: 30px;"></tr>
		
        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br><%=trainerID%></div>
                <div class="board-out">
                    <div id="board"><a href="<%=mzymPath%>/listNotice.trainer?page=1">공지사항</a></div>

                    <div id="counseling"><a href="<%=mzymPath%>/counseling.trainer?pageY=1&pageN=1">상담예약</a></div>
                    <div id="accusation">신고</div>
                    <div class="suteOption" style="margin-top: 0;">
                        <div class="suteBoard"><a href="<%=mzymPath%>/report.trainer?pageC=1&pageB=1&cate=1&status=Y">신고대기</a></div>
                        <div class="suteRrepeat"><a href="<%=mzymPath%>/report.trainer?pageC=1&pageB=1&cate=1&status=N">신고완료</a></div>
                    </div>

                    <div id="customer"><a href="<%=mzymPath%>/serviceBoardList.trainer?page=1">고객센터</a></div>
                    <div id="inbody"><a href="<%=mzymPath%>/indobyForm.trainar">인바디</a></div>

                </div>
                
            </td>
</body>
</html>