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
.page-link{
    color: black;
}

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color:#1ABC9C;
    border-color:#1ABC9C;
}

.pagination{
    margin-top: 40px;
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
          
        <h4>구매내역</h4>
        <div class="payment_content">
            <form action="<%=contextPath%>/purchase.me" method="post">
                <table class="table">
                    <thead>
                        <tr style="text-align: center;">
                            <th width="150px">결제일</th>
                            <th width="300px">결제상품</th>
                            <th width="150px">결제금액</th>
                        </tr>
                     </thead>
                     <tbody style="text-align: center;">
                        <!-- case1. 조회된 게시글이 없을 경우 -->
                        <!--
                        <tr>
                            <td colspan="3" style="text-align: center;">구매내역이 없습니다.</td>
                        </tr>
                        -->

                        <!-- case2. 구매내역이 있을 경우 -->
                        <tr>
                            <td>2024-02-11</td>
                            <td>PT10회권</td>
                            <td>450.000원</td>
                        </tr>
                        <tr>
                            <td>2024-01-10</td>
                            <td>헬스장이용권 3개월</td>
                            <td>150.000원</td>
                        </tr>
                        <tr>
                            <td>2024-01-10</td>
                            <td>헬스장이용권 3개월</td>
                            <td>150.000원</td>
                        </tr>
                        <tr>
                            <td>2024-01-10</td>
                            <td>헬스장이용권 3개월</td>
                            <td>150.000원</td>
                        </tr>
                     </tbody>
                </table>

                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">&lsaquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
                </ul>
                

            </form>
            
        </div>
       

    </section>
    <!--section end-->
	
	<%@ include file="/views/common/Mzym_footer.jsp"%>
   
</div>
</body>
</html>