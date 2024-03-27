<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.board.vo.*" %>
    
<%
	Board b = (Board)request.getAttribute("b");  // 글번호, 제목, 내용, 작성자이름
	Attachment at = (Attachment)request.getAttribute("at"); // 파일번호, 원본명, 수정파일명, 저장경로
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<script src="../../../resources/js/summernote/summernote-lite.js"></script>
<script src="../../../resources/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">


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

        .btn1{
            border: 1px solid #eee;
            color: #000;
        }
        .btn2{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
        }
        .btn3{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        input[type=file]::file-selector-button {
        width: 100px;
        height: 30px;
        background: #1abc9c;
        border: none;
        color : white;
        cursor: pointer;
        &:hover {
        background: rgb(77,77,77);
        color: #fff;
            }
        }
        
    </style>
</head>

<body>

    <%@ include file="/views/common/Mzym_header.jsp" %>
      
       <!-- Section start -->
       <section class="main_content">
       <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>게시글 수정</h2>
            <hr>
            <br><br>

            <div class="backgray">             
            <form  action="<%= contextPath %>/freeUpdate.bo" method="post" enctype="multipart/form-data">
            <input type="hidden" name="no" value="<%=b.getBoardNo()%>">
              <input type="text" class="form-control" required name="title" value="<%= b.getBoardTitle() %>">
                <table class="table">
                    <tr>
                        <form method="post">
                            <textarea id="summernote" name="content" style="resize:none;" required><%= b.getBoardContent() %></textarea>
                        </form>
                    </tr>
                    <tr>
                        <td>
                            <!-- 기존에 첨부파일이 있었을 경우 보여지는 기존첨부파일명 -->
                                <% if(at != null){ %>
                                	<%= at.getOriginName() %>
                                	<input type="hidden" name="originFileNo" value="<%= at.getFileNO() %>">
                                <% } %>
                                <!-- 새로운 첨부파일 업로드 가능하기 때문에 그 때의 input type=file -->
                                <input type="file" class="form-control-file" name="upfile">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn1 btn-outline-secondary btn-sm" onclick="history.back();">목록</button>
                            <button type="reset" class="btn2 btn-outline-danger btn-sm">취소</button>
                            <button type="submit" class="btn3 btn-outline-secondary btn-sm">수정</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div> 

    </section>
    <!-- Section end -->

    <script>
        $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            height: 400,
            maxHeight: 400
        });
    });
    </script>    
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>

</body>
</html>