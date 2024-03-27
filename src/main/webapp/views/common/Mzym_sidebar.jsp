<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <!--sidebar start-->
     <div class="sidebar" id="quickmenu">
      <nav class="col-sm-7 sidenav">
        
          <ul class="nav nav-pills nav-justified">
            <li><a><img src="<%=contextPath %>/resources/img/common/스크롤 업.png" style="width: 50px; height: 50px;" onclick="scrollToTop();"></a></li>
            <li><a href="<%= contextPath%>/list.no" class="btn btn-secondary btn-sm horizontal-btn">공지사항</a></li>
            <li><a href="<%= contextPath%>/freelist.bo?type=1" class="btn btn-secondary btn-sm horizontal-btn">자유게시판</a></li>
            <li><a href="<%= contextPath%>/freelist.bo?type=2" class="btn btn-secondary btn-sm horizontal-btn">질문게시판</a></li>
            <li><a href="https://www.facebook.com" target="_blank"><img src="<%=contextPath %>/resources/img/common/facebook.png" style="width: 50px; height: 50px"></a></li>
            <li><a href="https://www.instagram.com" target="_blank"><img src="<%=contextPath %>/resources/img/common/instagram.png" style="width: 50px; height: 50px"></a></li>
            <li><a><img src="<%=contextPath %>/resources/img/common/스크롤 다운.png" style="width: 50px; height: 50px;" onclick="scrollToBottom();"></a></li>
          </ul>
        </nav>
     </div>
    <!--sidebar end-->
</body>
</html>