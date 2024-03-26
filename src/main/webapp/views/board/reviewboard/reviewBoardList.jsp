<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.board.vo.Board" %>
<%@ page import="com.mzym.common.paging.PageInfo" %>
<%@ page import="java.util.List" %>

<%
	List<Board> list = (List<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
    
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        .wrap, .wrap * {box-sizing: border-box;}

        .wrap{
            margin:auto;
            width:100%;
            max-width:1300px; 
            display:flex;
            flex-direction:column;
        }
        .header{height:250px;}
        .main_content{min-height:500px;}
        .footer{height:250px;}

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

        h2 { 
            text-align: center; 
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
            background:rgb(109, 108, 108);
            color:white;
            text-align:center;
            position:absolute;
            top:175px;
            z-index:10;
        }
        .thumbnail_etc{
            display:flex;
            justify-content: space-between;
        }

        .write{
            margin-right: 70px;
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
        
        .page-item a.page-link {
        color: #1abc9c;
    	}


        hr{
            width: 200px;
            text-align: center;
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

    </style>
</head>
<body>

 <%@ include file="/views/common/Mzym_header.jsp" %>

<!-- Section start -->
       <section class="main_content">	
        <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>PT 헬스장 후기</h2>
            <hr>
            <br><br>

            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->
            <% if(loginUser != null) { %>
            <div class="write" align="right">
                <a href="<%= contextPath %>/enrollForm.re" class="btn btn-secondary">글쓰기</a>
                <br><br>
            </div>
            <% } %>

            <div class="board_list">

                <% for(Board b : list) {%>
                <div class="thumbnail">
                	<input type="hidden" value="<%=b.getBoardNo()%>">
                    <img class="thumbnail_img" src="<%= contextPath + "/" + b.getTitleImgURL() %>">
                    <div class="thumbnail_title"><%= b.getBoardTitle() %></div>
                    <div class="thumbnail_etc">
                        <div>&#9733;<%= b.getReviewRate() %></div>
                        <div>조회수:<%= b.getCount() %></div>
                    </div>
                </div>
                <% } %>
            </div>
            
            <script>
                	$(function(){
                		$(".thumbnail").click(function(){
                			location.href = "<%=contextPath%>/detail.re?no=" + $(this).children().eq(0).val();
                		})
                	})
                </script>
            
            <br><br>

            <div class="search">
                <input type="text" placeholder="검색어를 입력하세요">
                <img class="searchimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>
            <br>

            <!--  페이징바 영역 -->
            <ul class="pagination my justify-content-center">
            
            	<% if(pi.getCurrentPage() == 1) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else { %>
                <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
                <% } %>
                
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                
	                <% if(p == pi.getCurrentPage()) { %>
	                <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                <% }else { %>
	                <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%= p %>"><%= p %></a></li>
                	<% } %>
                <% } %>
                
                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            	<% }else { %>
            	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%=pi.getCurrentPage() + 1%>">Next</a></li>
            	<% } %>
            	
            </ul>
            
        </div>

    </section>
    <!-- Section end -->
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>

</body>
</html>