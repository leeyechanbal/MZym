<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
	<div class="wrap">
	
		<%@ include file="/views/common/Mzym_header.jsp" %>

	<!-- Section start -->
       <section class="main_content">
       <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>게시글 등록</h2>
            <hr>
            <br><br>

            <div class="backgray">      
                   
            <form  action="<%= contextPath %>/freeinsert.bo" method="post" enctype="multipart/form-data">
                <input type="text" class="form-control" required placeholder="제목 입력" name="title">
                <table class="table">
                    <tr>
                        <form method="post">
                            <textarea id="summernote" style="resize:none;" required name="content"></textarea>
                        </form>
                    </tr>
                    <tr>
                        <td>
                            <input type="file" class="form-control-file border" name="upfile">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn1 btn-outline-secondary btn-sm" onclick="history.back();">목록</button>
                            <button type="reset" class="btn2 btn-outline-danger btn-sm">취소</button>
                            <button type="submit" class="btn3 btn-outline-secondary btn-sm">등록</button>
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
    
    
    </div>

</body>
</html>