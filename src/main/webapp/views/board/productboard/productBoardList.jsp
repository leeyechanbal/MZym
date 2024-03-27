<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.mypage.model.vo.Product"%>
<%@ page import="java.util.List"%>    
<%
PageInfo pi = (PageInfo)request.getAttribute("pi");
List<Product> list = (List<Product>)request.getAttribute("list");
List<Product> bestList = (List<Product>)request.getAttribute("bestList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품구매</title>
<style>

.center{display:flex; justify-content: center; align-items: center;}

        /* Section 관련 스타일 */
       .board_content {
	   	
	    width: 90%;
	    height: 100%;
	    margin: auto;
	    margin-top: 50px;
	    min-height: 1200px;
	    padding: 50px;
	    border-radius: 10px;
		}
		
		.board_content > div {
		    flex: 1;
		    margin: 20px;
		  
		}

        h4 { 
            text-align: center; 
            color: black;
        }

        hr{
            width: 200px;
            text-align: center;
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
		
		.itenTitle{
		    display: flex;
            justify-content: center;
            align-items: center;
            margin: 50px;
		    padding: 20px;
		    border-bottom: 2px solid #1ABC9C;
		}
		
.bestItem > .board_list, .normalItem > .board_list {
    display: flex;
    flex-wrap: wrap; 
    justify-content: space-between; 
}


.bestItem > .board_list > div, .normalItem > .board_list > div {
    
    margin-bottom: 20px;
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
				<div class="bestItem">
				<div class="itenTitle">
	            <h4>추천 상품</h4>
	            </div>
	
		            <div class="board_list">
						<% for(int i = 0; i < bestList.size(); i++) { %> 
		                <div class="thumbnail">
		                	<input type = hidden value ="<%=bestList.get(i).getProductNo() %>">
		                    <div class="thumbnail_img"><img class="thumbnail_img" src="<%= contextPath + "/" + list.get(i).getUpfileUrl() %>"></div>
		                    <div class="thumbnail_title"><%=list.get(i).getProductName()%></div>
		                    <div class="thumbnail_etc">
		                        <div class="price"><%=list.get(i).getPrice() %>원</div>
		                        
		                    </div>
		                </div>
			            <%} %>                  
		            </div>
	        	</div>
	            
	            <div class="normalItem">
	            
	            <div class="itenTitle">
	            <h4>전체 상품</h4>
	           	</div>
				
				
	            <div class="board_list">
	            <% for(int i = 0; i < list.size(); i++) { %>
	           	
	                <div class="thumbnail">
	                	<input type = hidden value ="<%=list.get(i).getProductNo() %>">
	                    <img class="thumbnail_img" src="<%= contextPath + "/" + list.get(i).getUpfileUrl() %>">
	                    <div class="thumbnail_title"><%=list.get(i).getProductName()%></div>
	                    <div class="thumbnail_etc">
	                        <div class="price"><%=list.get(i).getPrice() %>원</div>
	                       
	                    </div>
	                </div>
	                <%} %>
				</div>
	         	
	            <br>
				</div>
				 	<script>
                    	$(function(){
                    		$(".thumbnail").click(function(){
                    			location.href = "<%=contextPath%>/product.detail?no=" + $(this).children().eq(0).val();
                    		})
                    	})
                    </script>
				
				
				
	            <!--  페이징바 영역 -->
				<ul class="pagination justify-content-center">
					<%if(pi.getCurrentPage()==1){ %>
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					<%}else{ %>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>/product.list?page=<%=pi.getCurrentPage()-1 %>">Previous</a></li>
					<%} %>
					<%for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
					<%if(p==pi.getCurrentPage()){ %>
					<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
					<%}else{%>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>//product.list?page=<%=p%>"><%=p %></a></li>
					<%} %>
					<%} %>
	

					<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>
					<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					<%}else{ %>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>//product.list?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
					<%} %>
				</ul>
	            
	        </div>
	
	    
		</section>
        <!-- Section end -->
        
	<%@ include file="/views/common/Mzym_footer.jsp" %>



	</div>
</body>
</html>