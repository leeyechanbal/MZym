<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.board.vo.Video"%>
<%@ page import="java.util.List"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Video> list = (List<Video>)request.getAttribute("list");
	List<Video> listBegin = (List<Video>)request.getAttribute("listBegin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

        .video_title{
            margin: 10px;
            font-size: 15px;
        }
        
        .video_title {
		    width: 248px; /* 텍스트가 넘치는 경우의 가로 길이 설정 */
		    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
		    overflow: hidden; /* 넘치는 텍스트를 숨기는 설정 */
		    text-overflow: ellipsis; /* 넘치는 텍스트를 생략 부호(...)로 표시하는 설정 */
		}

        .video_etc{
            margin: 10px;
            font-size: 12px;
        }

        .video{
            margin-right: 35px;
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
	 
	 <%@ include file="/views/common/Mzym_header.jsp"%>
	 
     <%@ include file="/views/common/Mzym_sidebar.jsp"%>
     
       <!-- Section start -->
       <section class="main_content">
		
		
        <div class="board_content">

            <h4>초보 추천 영상</h4>
            <hr>
            <br>

            <div class="board_list">
				<% for(Video v : listBegin) { %>
		                <div class="video">
		                    <iframe width="300px" height="200px" src="<%=v.getLink()%>" title="운동할 시간이 없다는 사람에게 보여주세요... 제발" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		                    <div class="video_title"><%=v.getVideoTitle() %></div>
		                    <div class="video_etc">
		                    </div>
		                </div>
                 <% } %>

                
            </div>
            
            <br>
            <h4>영상</h4>
            <hr>
            <br>

            <div class="board_list">
            	<% for(Video v : list) { %>
                <div class="video">
                    <iframe width="300px" height="200px" src="<%=v.getLink()%>" title="운동할 시간이 없다는 사람에게 보여주세요... 제발" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <div class="video_title"><%=v.getVideoTitle() %></div>
                    <div class="video_etc">
                    </div>
                </div>
                <% } %>

            </div>
            <br><br>

            <ul class="pagination my justify-content-center">
               <% if(pi.getCurrentPage() == 1) { %>
                    <li class="page-item disabled"><a class="page-link" href="#">&lsaquo;</a></li>
                    <% }else { %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/video.bo?page=<%=pi.getCurrentPage()-1%>">&lsaquo;</a></li>
                    <% } %>
                    
                    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    
	                    <% if(p == pi.getCurrentPage()) { %>
	                    <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>     
	                    <% }else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/video.bo?page=<%= p %>"><%= p %></a></li>
                        <% } %>  
                        
                   <% } %>
                   
                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                    <li class="page-item disabled"><a class="page-link" href="#">&rsaquo;</a></li>
                    <% }else { %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/video.bo?page=<%=pi.getCurrentPage() + 1%>">&rsaquo;</a></li>
                    <% } %>
            </ul>
            
        </div>

    </section>
    <!-- Section end -->
    <%@ include file="/views/common/Mzym_footer.jsp"%>
      
    </div>
</body>
</html>