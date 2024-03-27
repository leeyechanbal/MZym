<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대표로그인</title>
<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- --------------------------------------- -->

    <style>
        /* div{ border: 1px solid red;} */

        *{
            user-select: none;
        }

        body {
            background-color: lightgrey; /* 나머지 영역의 배경색 회색으로 설정 */
        }
        
        a{
            color: white;
            font-size: larger;
        }

        .wrap,
        .wrap * {
            box-sizing: border-box;
        }

        .wrap {
            margin: auto;
            width: 80%;
            max-width: 1300px;
            text-align: center;
        }

        /* Section 관련 스타일*/
        .main_content {
            width: 70%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            min-height: 500px;
            padding: 50px;
            /* border-radius: 20px; */
            background-color: gray;
        }
        .main_content * {
            background-color: gray;
        }

        .main_content input {
            background-color: white;
        }

        .main_content button {
            background-color: lightgrey;
        }

        .login_header hr {
            border: none;
            width: 100%;
            height: 1px;
            background: black; /* 배경색을 검은색으로 설정 */
            margin: 0; /* 가장자리에 빈 공간 없도록 설정 */
            user-select: none;
        }

        .login_content{
            height:800px; 
            display: flex;
            flex-direction: column;
        }
        .login_header{
            height: 20%;
            display: flex;
            flex-direction: column;
        }

        .login_title{ 
            align-items: center;
        }

        .login_select{
            height: 100%;
            padding-top: 5%;
        }

        
        .login_body{
            height: 70%;
            margin: auto;
            width: 100%;
            display: flex;
            flex-direction: column;
            margin-bottom: 5%;
        }

        .login_body hr {
            border: none;
            width: 100%;
            height: 1px;
            background: black; /* 배경색을 검은색으로 설정 */
            margin: 0; /* 가장자리에 빈 공간 없도록 설정 */
            user-select: none;
        }

        .login_input{
            height: 85%;
            display: flex;
            flex-direction: column;
            padding-top: 5%;
        }

        .login_input_id, .login_input_pwd { 
            height: 45%;
            margin: auto;
            padding: 3%;
        }

        .login_input_pwd {
            position: relative;
        }

        .login_input_pwd button {
            position: absolute;
            right: 5%;
            top: 45%;
            transform: translateY(-50%);
        }
        
        .login_input_btn { 
            height: 30%;
            padding: 3%;
        }

        .login_input_id > input{
            height: 80%;
            width: 100%;
        }

        .login_input_pwd > input{
            height: 80%;
            width: 100%;
        }

        .login_input_btn > button{
            width: 70%;
            height: 80%;
        }

        .login_search{
            height: 15%;
            display: flex;
        }

        .login_search_id, .login_search_pwd { 
            width: 49%;
        }
        .login_search_center {
            width: 2%;
        }

        .login_footer{
            /* border: 1px solid green; */
            height: 20%;
        }

        .login_footer > button {
            width: 65%;
            height: 40%;
            font-size: large;
        }

        /* 기본 커서 설정 */
        .login_select_user h5,
        .login_select_trainer h5 {
            cursor: pointer;
            user-select: none;
        }

        /* 클릭 커서 설정 */
        .login_select_user h5:hover,
        .login_select_trainer h5:hover {
            cursor: pointer;
        }

        .btn{
            color: black;
        }
    </style>
</head>
<body>
	<div class="wrap">
		<%
	        String alertMsg = (String) request.getAttribute("alertMsg");
	        if (alertMsg != null) {
	            out.println("<script>alert('" + alertMsg + "');</script>");
	        }
	    %>

        <!-- section start -->
        <div class="login_title_center">
            <img src="<%=contextPath %>/resources/img/icon/logo-lg-300x150.png" alt="">
        </div>
        <section class="main_content">

            <div class="login_content">
                <!-- 로그인 헤더 -->
                <div class="login_header">
                    <div class="login_select" style="text-align: center;">
                        <h1 style="color: white;">대표로그인</h1>
                    </div>
                </div>
                <!-- 로그인 헤더 끝-->


                <!-- 로그인 바디-->
                <div class="login_body">
                    <div class="login_input">
                            <form action='<%= contextPath %>/login.me' method="post" id="loginForm" style="height: 100%;">
                               
                                <div class="login_input_id">
                                    <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userId">
                                </div>

                                <div class="login_input_pwd">
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPwd" id="passwordInput">
                                	<input type="hidden" name="status" value="A">
                                </div>     
                            </form>

                    </div>

					<!-- 
                    <div class="login_search">
                        
                        <div class="login_search_id" style="margin: auto; margin-top: 5%; font-size: larger">
                            <a href="">아이디 찾기</a>
                        </div>
                        <div class="login_search_center" style="margin: auto; margin-top: 5%; font-size: larger;">
                        </div>
                        <div class="login_search_pwd" style="margin: auto; margin-top: 5%; font-size: larger">
                            <a href="">비밀번호 찾기</a>
                        </div>
                    </div>
                    -->

                </div> 

                <!-- 로그인 바디 끝-->

                <!-- 로그인 풋터 -->
                <div class="login_footer" >
                    <button class="btn btn-secondary" id="submitButton" style="font-size: x-large;">Login</button>
                </div>
                <!-- 로그인 풋터 끝-->
                <script>
				    document.getElementById("submitButton").addEventListener("click", function() {
				        document.getElementById("loginForm").submit();
				    });
				    
				    document.getElementById('passwordInput').addEventListener('keypress', function(event) {
				        if (event.keyCode === 13) {
				            event.preventDefault();
				            document.getElementById('loginForm').submit();
				        }
				    });
				</script>
            </div>
        </section>

    </div>
</body>
</html>