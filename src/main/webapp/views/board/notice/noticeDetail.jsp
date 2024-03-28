<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.board.vo.*" %>
    
<%
	Notice n = (Notice)request.getAttribute("n");  // 글번호, 제목, 내용, 작성자이름
	Attachment at = (Attachment)request.getAttribute("at"); // 파일번호, 원본명, 수정파일명, 저장경로
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

	<style>
        .wrap, .wrap * {box-sizing: border-box;}

        .wrap{
            margin:auto;
            width:100%;
            max-width:1300px; 
            display:flex;
            flex-direction:column;
        }
        
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

        .btn-secondary{
            text-align: bottom;
        }

        .btn1{
            border: 1px solid #eee;
            color: #000;
            text-align: center;
            border: none;
        }

        .btn2{
            border: 1px solid #eee;
            color: #000;
            float: right;
            margin-right: 100px;
        } 
        .btn3{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        .btn4{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        .btn5{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            width: 50px;
        }
        
        .btnlist{
        	border: 1px solid #eee;
            color: #000;
        }

        .modal-content{
            border: 1px solid #1abc9c;
        }

    </style>

</head>

<body>

 <!-- Section start -->
    <section class="main_content">
    
    <%@ include file="/views/common/Mzym_header.jsp" %>
      
       <!-- Section start -->
       <section class="main_content">
       <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>게시글조회</h2>
            <hr>

            <table class="table">
            	<thead>
                <tr>
                    <td><h3><%= n.getTitle() %></h3></td>
                </tr>
                <tr>
                    <td><div style="min-height:200px; white-space:pre"><%= n.getContent() %></div></td>
                </tr>
                <tr>
                    <td>
                       <% if(at == null){ %>
                       <!-- case1. 해당 게시글에 첨부파일이 없을 경우 -->
                       현재 첨부파일이 없습니다. 
						<% }else { %>
                       <!-- case2. 해당 게시글에 첨부파일이 있을 경우 -->
                       <a download="<%= at.getOriginName() %>" href='<%= contextPath + "/" + at.getFilePath() + at.getChangeName() %>' style="color:black"><%= at.getOriginName() %></a>
                       <% } %>
                    </td>
                </tr>
            </table>

            <br><br>

            <div class="btn1">
                <button type="button" class="btnlist btn-outline-secondary btn-sm" onclick="history.back();">목록</button>
            </div>
        </div>

    </section>
    <!-- Section end -->

    <%@ include file="/views/common/Mzym_footer.jsp" %>

</body>
</html>