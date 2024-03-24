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

                <!--한 게시글--> 
                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

                <div class="thumbnail">
                    <img class="thumbnail_img" src="../../resources/images/.jpg">
                    <div class="thumbnail_title">PT후기</div>
                    <div class="thumbnail_etc">
                        <div>별점</div>
                        <div>조회수</div>
                    </div>
                </div>

            </div>
            <br><br>

            <div class="search">
                <input type="text" placeholder="검색어를 입력하세요">
                <img class="searchimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>
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

</body>
</html>