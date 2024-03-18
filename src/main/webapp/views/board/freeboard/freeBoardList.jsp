<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .main_content{min-height:500px;}

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

        .search {
            position: relative;
            width: 300px;
            float: left;
        }

        input {
             width: 100%;
             border: 1px solid #bbb;
             border-radius: 8px;
             padding: 10px 12px;
             font-size: 14px;
        }

        img {
             position : absolute;
             width: 17px;
             top: 10px;
             right: 12px;
            margin: 0;
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
            <h2>자유게시판</h2>
            <hr>
            <br><br>

            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->

            <div class="search">
                <input type="text" placeholder="검색어를 입력하세요">
                <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>

            <div align="right">
                <button type="button" class="btn btn-secondary">글쓰기</button>
                <br><br>
            </div>

            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- case1. 조회된 게시글이 없을 경우 -->
                    <!--
                    <tr>
                        <td colspan="6" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                    </tr>
                    -->

                    <!-- case2. 조회된 게시글이 있을 경우 -->
                    <tr>
                        <td>3</td>
                        <td>게임</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>게임</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>게임</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>게임</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>게임</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                </tbody>
            </table>


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