<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/trainer/Leeyechan/trainerFilter.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="outTable">
	
	<thead>
          <td class="section1" id="back" onclick="history.back();"><img src="<%=mzymPath %>/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></td>
          <td class="section2" id="logo"><img src="<%=mzymPath %>/resources/img/icon/logo-sm-170x100.png" alt="로고"></td>
          <td class="section3"></td>
     </thead>
      
      <tr style="height: 30px;"></tr>
		
        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br>xxx</div>
                <div class="board-out">
                    <div id="board">게시판</div>

                    <div class="boardNav" style="margin-top: 0px;">
                        <div class="boardNotice"><a href="<%=mzymPath%>/listNotice.trainer?page=1">공지사항</a></div>
                        <div class="boardFree"><a href="">자유게시판</a></div>
                        <div class="boardQuestion"><a href="">질문게시판</a></div>
                        <div class="boardReview"><a href="">PT 및 헬스장 후기</a></div>
                        <div class="boardClass"><a href="">운동 모임</a></div>
                    </div>

                    <div id="counseling"><a href="<%=mzymPath%>/counseling.trainer?pageY=1&pageN=1">상담예약</a></div>
                    <div id="customer"><a href="">고객센터</a></div>
                    <div id="accusation"><a href="">신고</a></div>
                    <div class="suteOption" style="margin-top: 0;">
                        <div class="suteBoard"><a href="">게시글</a></div>
                        <div class="suteRrepeat"><a href="">답글</a></div>
                    </div>

                    <div id="calory"><a href="">칼로리</a></div>

                </div>
                
            </td>
</body>
</html>