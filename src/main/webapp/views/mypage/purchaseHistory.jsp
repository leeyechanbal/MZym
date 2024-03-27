<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.mypage.model.vo.Payment"%>
<%@ page import="java.util.List"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Payment> list = (List<Payment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<style>
 /*마이페이지 style*/

.mypage_content{
    margin: auto;
    width: 80%;
}

.payment_content{
border: 2px solid #1ABC9C;
width: calc(90% - 270px);
margin: auto;
margin-top: 15px;
margin-right: 150px;
min-height: 300px;
padding: 40px;
border-radius: 10px;
}

.main_content>h4{  
padding-top: 50px;
margin-left: 280px;
margin-top: 60px;
}

/*페이징 style*/ 


.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
   background: #1abc9c;
   border-color: #1abc9c;
}
        
.page-item a.page-link {
   color: #1abc9c;
}

</style>
</head>
<body>
        <%@ include file="/views/common/Mzym_header.jsp"%>
        
        
 <div class="wrap">
    <!--section start-->    
    <section class="main_content">
    
		<%@ include file="/views/common/Mzym_sidebar.jsp"%>
        
        <%@ include file="/views/common/mypage_sidemenu.jsp"%>
          
        <h4>구매내역<i class="far fa-credit-card"></i></h4>
        <div class="payment_content">
                <table class="table">
                    <thead>
                        <tr style="text-align: center;">
                            <th width="150px">결제일</th>
                            <th width="300px">결제상품</th>
                            <th width="150px">결제금액</th>
                        </tr>
                     </thead>
                     <tbody style="text-align: center;">
                        <% if(list.isEmpty()) { %>
                        <!-- case1. 조회된 게시글이 없을 경우 -->
                        
                        <tr>
                            <td colspan="3" style="text-align: center;">구매내역이 없습니다.</td>
                        </tr>
                        
                        <% } else { %>

                        <!-- case2. 구매내역이 있을 경우 -->
                        
	                        <% for(Payment p : list) { %>
	                        <tr>
	                            <td><%= p.getPaymentDate()%></td>
	                            <td><%= p.getProductName()%></td>
	                            <td><%=p.getPaymentPrice() %></td>
	                        </tr>
	                        <% } %>
	                   <% } %>
                     </tbody>
                </table>
                
                <!-- 페이징바 영역 -->

                <ul class="pagination justify-content-center">
                
                	<% if(pi.getCurrentPage() == 1) { %>
                    <li class="page-item disabled"><a class="page-link" href="#">&lsaquo;</a></li>
                    <% }else { %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/purchase.me?page=<%=pi.getCurrentPage()-1%>">&lsaquo;</a></li>
                    <% } %>
                    
                    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    
	                    <% if(p == pi.getCurrentPage()) { %>
	                    <li class="page-item active"><a class="page-link" style="background-color: #1abc9c; border: 2px solid #1abc9c;" href="#"><%= p %></a></li>     
	                    <% }else{ %>
	                    <li class="page-item" ><a class="page-link" href="<%=contextPath%>/purchase.me?page=<%= p %>"><%= p %></a></li>
                        <% } %>  
                        
                   <% } %>
                   
                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                    <li class="page-item disabled"><a class="page-link" href="#">&rsaquo;</a></li>
                    <% }else { %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/purchase.me?page=<%=pi.getCurrentPage() + 1%>">&rsaquo;</a></li>
                    <% } %>
                </ul>

        </div>
       

    </section>
    <!--section end-->
	
	<%@ include file="/views/common/Mzym_footer.jsp"%>
   
</div>
</body>
</html>