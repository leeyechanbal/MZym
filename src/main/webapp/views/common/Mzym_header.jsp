<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>    
<% String contextPath = request.getContextPath(); 
   String alertMsg = (String)session.getAttribute("alertMsg");
   Member loginUser = (Member)session.getAttribute("loginUser");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
	<link rel="icon" href="images/favicon.png">
     <!--부트 스트랩 및 제이쿼리-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <!--이미지 스크립트 링크-->
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/common/MYZM.css">
    <script src="<%=contextPath %>/resources/js/MYZM.js"></script>
    <script src="<%=contextPath %>/resources/js/summernote/summernote-lite.js"></script>
 <script src="<%=contextPath %>/resources/js/summernote/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="<%=contextPath %>/resources/css/summernote/summernote-lite.css">
</head>
<body>
	<% if(alertMsg != null) { %>
	<script>
		alert('<%=alertMsg%>');
	</script>
	<% 
		session.removeAttribute("alertMsg");
	   } 
	%>
	<!--header start-->   
    <header class="header-top-section">
        <div>
            <div>
                <div class="header_roop">
                    <div class="etc_Section">
                        <table class="Login_section">
                         <%if(loginUser==null){ %>
                         <!-- 로그인 이전 보여질 화면  -->
                            <tr>
                                <td><a href="#" class="btn btn-secondary btn-sm icon">로그인</a></td>
                                <td><a href="#" class="btn btn-secondary btn-sm icon">회원가입</a></td>
                            </tr>
                           
                         <%}else{ %>
                           <!-- 로그인 이후 보여질 화면  -->
                            <tr>
                              <td><img src="<%=contextPath %>/resources/img/common/profile_icon_512x512.png" style="width: 50px;"></td>
                              <td><div class="afterLogin">사용자 님 환영합니다~</div></td>
                              <td><a href="#" class="btn btn-secondary btn-sm icon">로그아웃</a></td>
                              <td><a href="<%=contextPath %>/myPage.me" class="btn btn-secondary btn-sm icon">마이페이지</a></td>
                          </tr>
                        <%}%>
                        </table>
                    </div>
                    <div class="Search_section">
                        <div class="Search_area">
                            <img src="<%=contextPath %>/resources/img/common/검색 아이콘.PNG" style="height: 20px; margin-right: 5px;">
                            <input type="search" placeholder="검색어를 입력하세요">
                            
                        </div>
                    </div>
                    <div class="SearchText_section">
                        
                        <div class="Search_area2"><span style="font-size: 15px; color: gray; font-weight: bold;">인기 검색어 :</span>
                        <span style="font-size: 18px;">오운완 | 운동 루틴 | 헬스 후기</span>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
           
                
        <nav class="header_nav">
           
            <div class="menu_logo" id="homelogo">
                <a href="<%=contextPath%>"><img src="<%=contextPath %>/resources/img/common/캡처.jpg" style="width: 100px;"></a>
                
              </div>
              
            <div class="menu_item" onmouseover="showTable();" onmouseout="hideTable();">
            <a href="" class="community" >커뮤니티</a>
                
                  <div class="sub_menu" id="menu1">
                    <ul class="sub">
                      <li><a>공지사항</a></li>
                      <li><a>자유게시판</a></li>
                      <li><a>질문게시판</a></li>
                      <li><a>헬스장후기</a></li>
                      <li><a>운동모임</a></li>
                    </ul>
                  </div>
                
            </div> 
   
            <div class="menu_item">
              <a href="" class="community">상품구매</a>
            </div>
            <div class="menu_item" onmouseover="showTable1();" onmouseout="hideTable1();">
              <a href="" class="community">헬스장 안내</a>
              
                <div class="sub_menu" id="menu2">
                  <ul class="sub">
                    <li><a href="<%=contextPath %>/location.me">헬스장위치</a></li>
                    <li><a href="<%=contextPath %>/facility.me">시설 안내</a></li>
                  </ul>   
                </div>   
              
            </div>
            <div class="menu_item">
              <a href="" class="community">추천운동영상</a>
            </div>
            <div class="menu_item">
              <a href="<%=contextPath %>/list.service" class="community">고객센터</a>
            </div>
            <div class="menu_item">
              <a href="" class="community">상담예약</a>
            </div>     
        </nav>
        <span class="main_text"><h1>MZYM</h1></span>
    </header>

    <!--header end-->
	
</body>
</html>