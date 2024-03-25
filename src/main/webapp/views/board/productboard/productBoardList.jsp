<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품구매</title>
<style>
.center{display:flex; justify-content: center; align-items: center;}

        /* Section 관련 스타일 */
        .board_content{
            border:1px solid 1abc9c;
            width:80%;
            margin:auto;
            margin-top:50px; 
            margin-bottom:50px;
            min-height:500px;
            padding:50px;
            border-radius:10px;
        }

        h4 { 
            text-align: center; 
            color: #1abc9c;
        }

        hr{
            width: 200px;
            text-align: center;
        }

        .board_list{
            display:flex;
            flex-wrap:wrap;
        }
        .thumbnail{
            width:200px;
            margin:25px;
            border:1px solid lightgray;
            padding:5px;
            cursor:pointer;
            position:relative;
        }
        .thumbnail:hover>img{
            opacity:0.9;
        }
        .thumbnail_img{
            width:190px;
            height:200px;
        }
        .thumbnail_title{
            width:190px;
            height:30px;
            text-align:center;
            position:absolute;
            top:175px;
            z-index:10;
        }

        .my.pagination > .active > a, 
        .my.pagination > .active > span, 
        .my.pagination > .active > a:hover, 
        .my.pagination > .active > span:hover, 
        .my.pagination > .active > a:focus, 
        .my.pagination > .active > span:focus {
            background: #1abc9c;
            border-color: #1abc9c;
        }

        .page-link {
            color: #000; 
            background-color: #fff;
            border: 1px solid #ccc; 
        }

        .page-item.active .page-link {
            z-index: 1;
            font-weight:bold;
            background-color: #f1f1f1;
            border-color: #ccc;
        }

        .search {
            position: relative;
            width: 300px;
            margin: 0 auto;
        }

        input {
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 14px;
        }

        .searchimg {
            position : absolute;
            width: 17px;
            top: 10px;
            right: 12px;
            margin: 0;
        }

        .price{
            margin: 10px;
            font-size: 15px;
        }

        .product_detail{
            margin: 10px;
            font-size: 12px;
        }

        .board_list{
            display: flex;
            justify-content: center;
            align-items: center;
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
	
	            <h4>추천 상품</h4>
	            <hr>
	            <br>
	
	            <div class="board_list">
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../../resources/img/common/MZYMProduct.png">
	                    <div class="thumbnail_title">MZYM PT 10회권</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">500,000원</div>
	                        <div class="product_detail">프리미엄P.T 10회 + 헬스장 2개월 이용권</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	            </div>
	            
	            <br>
	            <h4>전체 상품</h4>
	            <hr>
	            <br>
	
	            <div class="board_list">
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	                <div class="thumbnail">
	                    <img class="thumbnail_img" src="../../resources/images/.jpg">
	                    <div class="thumbnail_title">상품이름</div>
	                    <div class="thumbnail_etc">
	                        <div class="price">가격</div>
	                        <div class="product_detail">설명</div>
	                    </div>
	                </div>
	
	            </div>
	            <br><br>
	
	            <div class="search">
	                <input type="text" placeholder="검색어를 입력하세요">
	                <img class="searchimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	            </div>
	            <br>
	
	            <ul class="pagination my justify-content-center">
	                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                <li class="page-item"><a class="page-link" href="#">4</a></li>
	                <li class="page-item"><a class="page-link" href="#">5</a></li>
	                <li class="page-item"><a class="page-link" href="#">Next</a></li>
	            </ul>
	            
	        </div>
	
	    
		</section>
        <!-- Section end -->
        
	<%@ include file="/views/common/Mzym_footer.jsp" %>



	</div>
</body>
</html>