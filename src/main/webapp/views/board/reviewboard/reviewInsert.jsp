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
        
        .title_img{
            width:450px;
            height:300px;
        }
        .content_img{
            width:180px;
            height:100px;
        }

        .starnum{
            width: 20px;
        }
        
        .star{
            width: 850px;
            height: 37px;
            padding: 10px; 
            border: 1px solid #ccc;
            border-radius: 5px; 
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); 
            display: flex;
            align-items: center;
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
            <h2>후기글 작성</h2>
            <hr>
            <br><br>
                    
            <form action="<%= contextPath %>/insert.re" method="post" enctype="multipart/form-data">
                <input type="text" class="form-control" required placeholder="제목 입력" name="title">
                <div class="star">
                    <div style="margin-right: 10px;">&#9733;</div>
                    <input type="number" id="star_num" min="1" max="5" name="star">
                </div>
                <table class="table">
                    <tr>
                        <form method="post">
                            <textarea id="summernote" name="content"></textarea>
                        </form>
                    </tr>
                    <tr>
                        <th width="120">대표이미지</th>
                        <td>
                            <img class="img_preview title_img" name="upfile1" onclick="chooseFile(0);" required>
                        </td>
                        <th width="120">상세이미지</th>
                        <td>
                            <img class="img_preview content_img" name="upfile2" onclick="chooseFile(1);">
                            <img class="img_preview content_img" name="upfile3" onclick="chooseFile(2);">
                            <img class="img_preview content_img" name="upfile4" onclick="chooseFile(3);">
                        </td>
                    </tr>
                </table>
                <button type="button" class="btn1 btn-outline-secondary btn-sm" onclick="history.back();">목록</button>
                <button type="reset" class="btn2 btn-outline-danger btn-sm">취소</button>
                <button type="submit" class="btn3 btn-outline-secondary btn-sm">등록</button>  

                <div style="display:none;">
                    <!-- 대표이미지 -->
                    <input type="file" name="upfile1" onchange="loadImg(0);" required>
                    <!-- 상세이미지 -->
                    <input type="file" name="upfile2" onchange="loadImg(1);">
                    <input type="file" name="upfile3" onchange="loadImg(2);">
                    <input type="file" name="upfile4" onchange="loadImg(3);">
                </div>

                <script>
                    function chooseFile(idx){
                        $(":file").eq(idx).click();
                    }

                    function loadImg(idx){
                        const inputFile = window.event.target;

                        if(inputFile.files.length == 1){ 
                            const reader = new FileReader();
                            reader.readAsDataURL(inputFile.files[0]); 

                            reader.onload = function(e){
                                $(".img_preview").eq(idx).attr("src", e.target.result);
                            }

                        }else{
                            $(".img_preview").eq(idx).attr("src", null);
                        }

                    }
                </script>

            </form>

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