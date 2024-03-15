<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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

        .sea {
            position: relative;
            width: 300px;
            float: left;
             margin-bottom:30px;
        }

        input {
             width: 100%;
             border: 1px solid #bbb;
             border-radius: 8px;
             padding: 10px 12px;
             font-size: 14px;
        }

        .sea img {
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
        .board-out>#board{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: block;
        }
        .boardNav>.boardFree{
            background-color: rgba(26, 188, 156, 0.2);
        }
        /* 답변 작성 쪽 최소 높이 및 정렬 , 박스모양 */
        .repeat{
            border: 1px solid rgb(224, 224, 224);
            min-height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .repeat > *{
          margin: 0 5px;
        }
        .border{
          min-height:250px; text-align: left; white-space: pre;
          overflow: auto;
        }
        .buttonArea{
          display: flex;
          justify-content: flex-end;
        }
        .buttonArea button{
          margin: 10px;
        }
        .upfileArea{
          min-height: 200px;
          border-top: 2px solid #e0e0e0;
          border-bottom: 2px solid #e0e0e0;
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
            <h2>고객센터</h2>
            <hr>
            <br><br>

            <!-- 현재 로그인된 상태일 경우 보여지는 요소 -->

            <div class="sea">
                <input type="text" placeholder="검색어를 입력하세요">
                <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>
			<%if(loginUser != null){ %>
            <div align="right">
                <button type="button" class="btn btn-secondary">글쓰기</button>
                <br><br>
            </div>
			<%} %>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <th width="100px">글번호</th>
                        <th width="100px">카테고리</th>
                        <th width="400px">글제목</th>
                        <th width="120px">작성자</th>
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
                    <tr data-toggle="collapse" data-target="#context">
                        <td>3</td>
                        <td>이용관련</td>
                        <td style="cursor: pointer;">글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr id="context" class="collapse">
                      <td colspan="6">
                          <p class="border rounded">
                          
                            게시글의 내용입니다

                          </p>
                          
                          <div class="upfileArea "><img src="" alt="미리보기 입니다."></div>
                          <div class="buttonArea"> 
                            <button type="button" class="btn btn-outline-secondary btn-sm">수정</button>
                            <button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
                            
                          </div>   
                         <!--답글 내용이 있을 경우
                          <div class="repeat border mx-auto">
                              <div><b>관리자 xxx </b></div>
                              <div style="width: 80%;"><input type="control" class="form-control" required></div>
                              
                          </div>
                        -->
                      </td>
                  </tr>
                    <tr>
                        <td>3</td>
                        <td>이용관련</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>이용관련</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>이용관련</td>
                        <td>글제목입니다</td>
                        <td>admin</td>
                        <td>200</td>
                        <td>2024-01-12</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>이용관련</td>
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