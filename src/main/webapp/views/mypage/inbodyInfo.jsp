<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*마이페이지 style*/

.mypage_content{
    margin: auto;
    width: 80%;
}

.inbody_content{
	border: 2px solid #1ABC9C;
	width: calc(70% - 270px);
	margin: auto;
	margin-top: 50px;
	margin-right: 260px;
	min-height: 300px;
	padding: 40px;
	border-radius: 10px;
}

.inbody_content>h4{  
    font-weight: bold;
    font-size: xx-large;
}

.inbody_content>hr{border: 1px solid; color: #bdbcbc;}

.inbody_list{margin-left: 10px;}

.list_etc{margin-left: 300px;}
.list_etc2{margin-left: 240px;}
.list_etc3{margin-left: 245px;}

</style>
</head>
<body>
    <div class="wrap">

     <%@ include file="/views/common/Mzym_header.jsp" %>
        
    <!--section start-->    
    <section class="main_content">
    
    	<%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <%@ include file="/views/common/mypage_sidemenu.jsp" %>

        <div class="inbody_content">
       		 <form action="<%=contextPath%>/inbody.me" method="post">
	            <h4>나의 인바디</h4>
	            <hr>
	            <br>
	
	            <div class="inbody_list">
	                <p>신장<span class="list_etc">170cm</span></p>
	                <p>나이<sppn class="list_etc">24</sppn></p>
	                <p>성별<span class="list_etc">여성</span></p>
	            </div>
	            <br>
	
	            <hr>
	            <br>
	            <div class="inbody_list">
	                <p>체중(kg)<span class="list_etc2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60(kg)</span></p>
	                <p>체지방량(kg)<span class="list_etc2">35.9(kg)</span></p>
	                <p>BMI(kg/m2)<span class="list_etc3">170</span></p>
	            </div>
	            
	         </form>
        </div>
       

    </section>
    <!--section end-->
    
     <%@ include file="/views/common/Mzym_footer.jsp" %>
    
    </div>
    
   

</body>
</html>