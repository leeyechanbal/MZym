<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.common.paging.PageInfo" %>
<%@ page import="com.mzym.board.vo.Notice" %>
<%@ page import="java.util.List" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
        
        .board_content table>tbody>tr{
 		cursor:pointer
 		}
		
		input {
             width: 100%;
             border: 1px solid #bbb;
             border-radius: 8px;
             padding: 10px 12px;
             font-size: 14px;
        }

       

        h2 { 
            text-align: center; 
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

    </style>

</head>
<body>
	<div class="wrap">
	
		<%@ include file="/views/common/Mzym_header.jsp" %>
      
       <!-- Section start -->
       <section class="main_content">
       <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
           
            <h2>공지사항</h2>
            
            <hr>

            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->
			<% if(loginUser != null) { %>
            <div class="sea">
					<form action="<%=contextPath %>/search.me" method="get" onsubmit="return enterForm();">
					</form>
			</div>
            <% } %>

            <br>
            <table class="table" id="board_list">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()) {%>
                    <!-- case1. 조회된 게시글이 없을 경우 -->
                    <tr>
                        <td colspan="6" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                    </tr>
                <% }else {%>
                    <!-- case2. 조회된 게시글이 있을 경우 -->
                <% for(Notice n : list) {%>
                    <tr>
                        <td><%= n.getNoticeNo() %></td>
                        <td><%= n.getTitle() %></td>
                        <td><%= n.getWriterName() %></td>
                        <td><%= n.getRegistDate() %></td>
                    </tr>
                    <% } %>
                <% } %>
                </tbody>
            </table>
            
            <script>
            $(function(){
                $("#board_list>tbody>tr").click(function(){
                	location.href = "<%=contextPath%>/detail.no?no=" + $(this).children().eq(0).text();
                })
            })
            </script>
            
				
            <br>
            
            <!--  페이징바 영역 -->
            <ul class="pagination my justify-content-center">
            
            	<% if(pi.getCurrentPage() == 1) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else { %>
                <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
                <% } %>
                
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                
	                <% if(p == pi.getCurrentPage()) { %>
	                <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                <% }else { %>
	                <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a></li>
                	<% } %>
                <% } %>
                
                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            	<% }else { %>
            	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?page=<%=pi.getCurrentPage() + 1%>">Next</a></li>
            	<% } %>
            	
            </ul>

        </div>
		
		
    </section>
    <!-- Section end -->
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>
    
    
    </div>

</body>
</html>