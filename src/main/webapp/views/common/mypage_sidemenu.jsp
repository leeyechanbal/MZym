<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*side메뉴*/
.side_menu{
    float: left;
    flex-direction: column;
    background-color: #e0e0e0; 
    margin-top: 15px;    
    height: 1500px;
    width: 15%;
}

.user_data a{
    width: 140px;
    height: 40px;
    margin-top: 45px;
    margin-left: 15%;
}

.user_data:hover a {
font-weight: bold;
background: #1ABC9C; 
color: white;
}
</style>
</head>
<body>
<!--side menu start-->
     <div class="side_menu">
         <h3 style="height: 40px; padding: 30px" align="center">My page</h3>
         <div class="user_data">
             <a href="<%=contextPath%>/myPage.me" class="btn btn-light" style="font-weight: bold;">회원정보</a>
         </div>
         <div class="user_data">
             <a href="" class="btn btn-light" style="font-weight: bold;">나의 식단 정보</a>
         </div>
         <div class="user_data">
             <a href="<%=contextPath%>/inbody.me" class="btn btn-light" style="font-weight: bold;">나의 인바디</a>
         </div>
         <div class="user_data">
             <a href="<%=contextPath%>/purchase.me?page=1" class="btn btn-light" style="font-weight: bold;">나의 구매내역</a>
         </div>
     </div>
<!--side menu end-->
</body>
</html>