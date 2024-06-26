<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); // "/web"

	//Member loginUser = (Member)session.getAttribute("loginUser");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MZYM 로그인</title>

<!-- 스타일 -->
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
          background-color: gray; /* 나머지 영역의 배경색 회색으로 설정 */
      }   

      a { color :black; }

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
          background-color: white;
      }
      .main_content * {
          background-color: white;
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
          height:900px; 
          display: flex;
          flex-direction: column;
      }
      .login_header{
          height: 20%;
          display: flex;
          flex-direction: column;
      }

      .login_title{ 
          height: 60%;
          display: flex;
      }
      
      .login_title_left, .login_title_right{ width: 10%; }
      .login_title_center { width: 80%; }

      .login_select{
          height: 40%;
          display: flex;
      }

      .login_select_user, .login_select_trainer {  width: 50%; margin: auto; margin-top: 3%; }
      
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
      }

      .login_input_id, .login_input_pwd { 
          height: 35%;
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

      .btn {
          background-color: #1ABC9C;
          border: solid #1ABC9C;
          color: white;
      }

      .btn:hover{
          background: #19b192;
          border: solid #19b192;
          color: white;
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

      

  </style>

</head>


<body>
	<%
        String alertMsg = (String) request.getAttribute("alertMsg");
        if (alertMsg != null) {
            out.println("<script>alert('" + alertMsg + "');</script>");
        }
    %>

	<div class="wrap">

        <!-- section start -->
        <section class="main_content">

            <div class="login_content">
                
                <!-- 로그인 헤더 -->
                <div class="login_header">

                    <div class="login_title">

                        <div class="login_title_left">
                            <a href="<%=contextPath %>"  type="button" style="border: none;"><img src="<%=contextPath %>/resources/img/btn/backward-arrow_50x50.png"></a>
                        </div>

                        <div class="login_title_center">
                            <h2 style="text-align: center;">로그인</h2>
                        </div>

                        <div class="login_title_right"></div>
                    </div>

                    <div class="login_select">

                        <div class="login_select_user">
                          <h5 id="selectUser">회원 로그인</h5>
                        </div>

                        <div class="login_select_trainer">
                          <h5 id="selectTrainer">트레이너 로그인</h5>
                        </div>
                    </div>
                    <hr>
                </div>
                <!-- 로그인 헤더 끝-->


                <!-- 로그인 바디-->
                <div class="login_body">
                    <div class="login_input">
                    
                            <form action='<%= contextPath %>/login.me' method="post" style="height: 100%;" id="login_form">
                               
                               <input type="hidden" name="status" id="select_user">
                               
                                <div class="login_input_id">
                                    <input type="text" class="form-control" placeholder="아이디를 입력해주세요" required name="userId">
                                </div>

                                <div class="login_input_pwd">
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" required name="userPwd" id="passwordInput">
                                    <button style="border: none;" id="showPasswordBtn"><img src="<%=contextPath %>/resources/img/icon/show_password_icon_50x50.png"></button>
                                </div>

                                <div class="login_input_btn">
                                    <button type="submit" class="btn" style="font-size: larger;">로그인</button>
                                </div>
                                
                            </form>

                    </div>

                    <div class="login_search">
                        
                        <div class="login_search_id" style="margin: auto; margin-top: 5%; font-size: larger">
                            <a href="<%=contextPath %>/findIdForm.me">아이디 찾기</a>
                        </div>
                        <div class="login_search_center" style="margin: auto; margin-top: 5%; font-size: larger;">
                            |
                        </div>
                        <div class="login_search_pwd" style="margin: auto; margin-top: 5%; font-size: larger">
                            <a href="<%=contextPath %>/findPwdForm.me">비밀번호 찾기</a>
                        </div>
                    </div>
                    <hr>

                </div> 

                <!-- 로그인 바디 끝-->

                <!-- 로그인 풋터 -->
                <div class="login_footer" style="font-size: larger;">
                    아직 MZym회원이 아니시라면, 지금 가입해 이용해 보세요!
                    <br><br>
                    <a href="<%=contextPath %>/signupForm.me" type="button" class="btn">회원가입</a>
                </div>
                <!-- 로그인 풋터 끝-->
            </div>
        </section>

        <script>
            
            // 회원 트레이너 구별 스크립트 - 구성모
            $(document).ready(function() {
                // 초기 상태 설정
                $('.login_select_user h5').css({'color':'black', 'font-weight':'bold'});
                $('.login_select_trainer h5').css({'color':'gray', 'font-weight':'normal'});
                $('#select_user').val("Y")
                // 회원 로그인 클릭 시
                $('#selectUser').click(function() {
                    $('.login_select_user h5').css({'color':'black', 'font-weight':'bold'});
                    $('.login_select_trainer h5').css({'color':'gray', 'font-weight':'normal'});
                    $('#select_user').val("Y")
                   // $('form').attr('action', ); // 회원 로그인 form의 action 변경
                });
        
                // 트레이너 로그인 클릭 시
                $('#selectTrainer').click(function() {
                    $('.login_select_user h5').css({'color':'gray', 'font-weight':'normal'});
                    $('.login_select_trainer h5').css({'color':'black', 'font-weight':'bold'});
                    $('#select_user').val("T")
                });
            });
            // input 비밀번호 text 토글 스크립트 - 구성모
            // 이미지 버튼을 클릭했을 때 실행되는 함수
            document.getElementById('showPasswordBtn').addEventListener('click', function(event) {
		        event.preventDefault();
		        var passwordInput = document.getElementById('passwordInput');
		        var currentType = passwordInput.getAttribute('type');
		        passwordInput.setAttribute('type', currentType === 'password' ? 'text' : 'password');
		    });
		
		    document.getElementById('passwordInput').addEventListener('keypress', function(event) {
		        if (event.keyCode === 13) {
		            event.preventDefault();
		            document.getElementById('login_form').submit();
		        }
		    });
        </script>
    </div>

</body>
</html>