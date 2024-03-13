<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.vo.Member" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!--  
	작성자 : 이예찬
	로그인 이후 일정 관리 와 게시물 관리 페이지를 결정하는 화면
	로그아웃 시 세션에서 객체를 만료시키고 로그인 화면으로 돌아가기
-->    
<%
	Member currentUser = (Member)request.getSession().getAttribute("");
	String currentDate = new SimpleDateFormat("YYYY년 MM월 dd일").format(new Date());
	String mzymPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        body{
            display: flex;
            justify-content: center;
            box-sizing: border-box;
        }
        #background{
            background-color: #e0e0e0;
            width: 1500px;
            padding: 5%;
        }
        #home{
            background-color: rgb(94, 94, 94);
            padding: 5%;
        }
        #head{
            display: flex;
            justify-content: center;
        }
        #foot{
            display: flex;
            justify-content: flex-end;
        }
        #center{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        .font{
            text-align: center;
            color: aliceblue;
        }
        #logOut{
            margin-right: 200px;
            display: flex;
            flex-direction: column;
        }
        #head,#foot,#center{
            margin: 10px;
        }
        #react #info:hover,
        #react #boradManagment:hover,
        #react #dateManagment:hover,
        #react #logOut:hover{
            background-color: rgba(26, 188, 156, 0.2);
        }
    </style>

</head>
<body>

	 <div id="background">
        <div id="home">
            <div id="head"><img src="<%=mzymPath%>/resources/img/icon/logo-lg-300x150.png" alt="Myzm logo"></div>

            <div id="react">

                <div id="center">
                    <div id="info">
                        <img src="" alt="adminWho">
                        <p class="font"><%=currentDate%><br>안녕하세요. 관리자님</p>
                    </div>

                    <a id="boradManagment" href="<%=mzymPath%>/board.trainer">
                        <img src="<%=mzymPath%>/resources/img/icon/Board-icon-100x100.png" alt="boardPage">
                        <div class="font">게시물</div>
                    </a>

                    <a id="dateManagment" href="">
                        <img src="<%=mzymPath%>/resources/img/icon/galender-100x100.png" alt="clanderPage">
                        <div class="font">PT일정</div>
                    </a>
                </div>

                <div id="foot">
                    <a id="logOut" href="">
                        <img src="<%=mzymPath%>/resources/img/icon/logout-icon-50x50.png" alt="logout">
                        <div class="font">로그 아웃</div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>