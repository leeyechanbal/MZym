<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.common.paging.PageInfo" %>
<%@ page import="com.mzym.board.vo.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.board.vo.BoardCategory" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Board> list = (List<Board>)request.getAttribute("list");
	BoardCategory bc = (BoardCategory)request.getAttribute("bc");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= bc.getCategoryName()%></title>

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
           
            <h2><%= bc.getCategoryName()%></h2>
            
            <hr>
            <br><br>

            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->
			<% if(loginUser != null) { %>
            <div class="sea">
					<form action="<%=contextPath %>/search.me" method="get" onsubmit="return enterForm();">
					</form>
			</div>
	
            <div align="right">
                <a href="<%=contextPath %>/freeEnrollForm.bo?type=<%=bc.getCategoryNo()%>" class="btn btn-secondary">글쓰기</a>
                <br><br>
            </div>
            <% } %>

            <br>
            <table class="table" id="board_list">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
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
                <% for(Board b : list) {%>
                    <tr>
                        <td><%= b.getBoardNo() %></td>
                        <td><%= b.getBoardTitle() %></td>
                        <td><%= b.getBoardMember() %></td>
                        <td><%= b.getCount() %></td>
                        <td><%= b.getRegist_Date() %></td>
                    </tr>
                    <% } %>
                <% } %>
                </tbody>
            </table>
            
            <script>
            $(function(){
                $("#board_list>tbody>tr").click(function(){
                	location.href = "<%=contextPath%>/freedetail.bo?no=" + $(this).children().eq(0).text();
                })
            })
            </script>
            
				
            <br>
            
            <!--  페이징바 영역 -->
            <ul class="pagination my justify-content-center">
            
            	<% if(pi.getCurrentPage() == 1) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else { %>
                <li class="page-item"><a class="page-link" href="<%= contextPath %>/freelist.bo?page=<%=pi.getCurrentPage() - 1%>&type=<%= bc.getCategoryNo() %>">Previous</a></li>
                <% } %>
                
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                
	                <% if(p == pi.getCurrentPage()) { %>
	                <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                <% }else { %>
	                <li class="page-item"><a class="page-link" href="<%= contextPath %>/freelist.bo?page=<%= p %>&type=<%= bc.getCategoryNo() %>"><%= p %></a></li>
                	<% } %>
                <% } %>
                
                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            	<% }else { %>
            	<li class="page-item"><a class="page-link" href="<%= contextPath %>/freelist.bo?page=<%=pi.getCurrentPage() + 1%>&type=<%= bc.getCategoryNo() %>">Next</a></li>
            	<% } %>
            	
            </ul>

        </div>
		
		
    </section>
    <!-- Section end -->
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>
    
    
    </div>

</body>
</html>