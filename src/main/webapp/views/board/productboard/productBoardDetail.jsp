<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.mypage.model.vo.Product"%>
     
<!DOCTYPE html>
<%

Product p = (Product)request.getAttribute("p");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center{display:flex; justify-content: center; align-items: center;}

        /* Section 관련 스타일 */
        .board_content{
            border:1px solid #1abc9c;
            width:80%;
            margin:auto;
            margin-top:50px; 
            margin-bottom:50px;
            min-height:500px;
            padding:50px;
            border-radius:10px;
        }

        hr{
            width: 200px;
            text-align: center;
        }

        h2 { 
            text-align: center; 
        }

        .product-container {
            display: flex;
            align-items: center;
        }

        .product-details {
            flex-grow: 1;
        }

        .quantity-container {
            display: flex;
            align-items: center;
        }

        #quantity {
            width: 40px;
            text-align: center;
            margin: 0 10px;
        }

        .total-and-button {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        #totalAmount {
            margin-right: 10px;
        }

        #sellButton {
            margin-left: auto;
            border: solid #1abc9c;
            background-color: #1abc9c;
            color: white;
        }

        h6 {
            font-size: 1.5em;
        }

        p.price {
            text-align: right;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #1abc9c;
            width: 30%;
            height: 200px;
            text-align: center;
            max-width: 30%;
        }

        #closeButton{
            width: 30%; 
            margin-left: 35%; 
            border: solid #1abc9c;
            background-color: #1abc9c;
            color: white;
        }
		

</style>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/Mzym_header.jsp" %>

      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          	<div class="board_content">
            <h2>상품게시판</h2>
            <hr>
            <br><br>
            
            <div class="product-container">
                <div class="product-image">
                    <img src="<%=contextPath + "/" + p.getUpfileUrl() %>" alt="상품 이미지" style="width: 350px; height: 300px; margin: 20px;">
                	
                </div>
                <div class="product-details">
                    <h6><%=p.getProductName() %></h6>
                    <p class="price" style="color: #1abc9c; margin-right: 50px;"><%=p.getPrice() %>원</p>
                    <p><%=p.getProductContent() %></p>
                    <div id="quantity-container">
                        <button onclick="adjustQuantity(-1)">-</button>
                        <input type="text" id="quantity" value="1" oninput="calculateTotalPrice()">
                        <button onclick="adjustQuantity(1)">+</button>
                    </div>
                    <br>
                    <p>총 상품 금액</p>
                    <hr style="width: 650px;">
                    <div class="total-and-button">
                        <p class="total_price"><%=p.getPrice() %>원</p>
                        <%if(loginUser !=null){%>
                        <button id="sellButton" type="button" style="margin-right: 50px;">구매하기</button>
                    	<%}else{ %>
                    		<p>로그인후 구매가 가능합니다.</p>
                    	<%} %>
                    </div>
                </div>
            </div>
            
            <hr style="width: 100%;">
            <div class="product-detail">
                <img src="<%=contextPath %>/resources/img/common/MZYMProduct.png" alt="상세정보 이미지" style="width: 65%; height: 600px; display: block; margin: 0 auto;">
            </div>

            <!-- Modal HTML -->
            <div id="myModal" class="modal">
                <div class="modal-content maincontent">
                    <p>상품이 구매되었습니다.</p>
                    <p>감사합니다.</p>
                    <button id="closeButton" onclick="closeModal()">닫기</button>
                </div>
            </div>
  		</div>
		</section>
        <!-- Section end -->
    	<script>
        function openModal() {
          var modal = document.getElementById('myModal');
          modal.style.display = 'block';
        }
        
        function closeModal() {
	          var modal = document.getElementById('myModal');
	          modal.style.display = 'none';
	        }
	        
	        document.getElementById('sellButton').addEventListener('click', function() {
	          openModal();
	        });
	
	        function adjustQuantity(value) {
	            var quantityInput = document.getElementById('quantity');
	            var currentQuantity = parseInt(quantityInput.value);
	            var newQuantity = Math.max(1, currentQuantity + value);
	            quantityInput.value = newQuantity;
	            calculateTotalPrice();
	        }
	    
	        function calculateTotalPrice() {
	            var quantityInput = document.getElementById('quantity');
	            var priceElement = document.querySelector('.price');
	            var totalPriceElement = document.querySelector('.total_price');
	    
	            var currentQuantity = parseInt(quantityInput.value);
	            var price = parseInt(priceElement.innerText.replace('원', '').replace(',', ''));
	    
	            var total_price = currentQuantity * price;
	            totalPriceElement.innerText = total_price.toLocaleString('ko-KR') + '원';
	        }
	
	        function showModal() {
	            var modal = document.getElementById('myModal');
	            modal.style.display = 'flex';
	        }
	
	        function hideModal() {
	            var modal = document.getElementById('myModal');
	            modal.style.display = 'none';
	        }
	
	        
    	</script>    
	<%@ include file="/views/common/Mzym_footer.jsp" %>

	

	</div>
</body>
</html>