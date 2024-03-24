<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.member.model.vo.Member" %>    
<% 
	Member loginUser = (Member)session.getAttribute("loginUser"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* div { border: 1px solid red;} */
        hr{
            border: 0;
            width: 100%;
            height: 1px;
            background: black;
        }
        .wrap{
            margin: auto;
            width: 80%;
            display: flex;
            flex-direction: column; 
        }
        .repre_header{height: 100px; background-color: #1ABC9C; text-align: center;}

        .repre_body{min-height: 500px; display: flex;}

        .repre_body_left{min-width: 150px; height: 500px; display: flex; flex-direction: column;}
        .repre_left_top {height: 10%;}
        .repre_left_bottom {
            height: 90%; 
            background-color: lightgray;
        }
        .repre_left_bottom a {
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            color: black;
            display: block;
        }
        .repre_left_bottom a:hover {
            background-color: #1ABC9C;
            color: white;
        }
        .sub-menu {
            display: none;
            background-color: white;
            border:1px solid lightgray;
        }

        .sub-menu a:hover {
            color: white;
        }
        .active {
            display: block;
        }

        .repre_body_right {
            min-height: 554px;
        }
        .repre_body_right{ width: 100%; display: flex; flex-direction: column;}
        .repre_right_top{  height: 85px; display: flex; padding-left: 3%; padding-top: 2%; align-items: center;}
        .right_top_title{ min-width: 200px;}
        .repre_right_top h1 {
            padding-right: 3%;
            padding-left: 3%;
        }

        .form-control {
            width: 100%;
            height: 100%;
        }
        .right_top_button {
            width: 100%;
            text-align: right;
            padding-right: 3%;
        }
        .right_top_button button{
            background-color: #1ABC9C;
            color: white;
            height: 70%;
            width: 120px;
        }

        .right_top_button button:hover{
            background-color: #19b192;
            color: white;
        }

        
        .repre_right_center{height: 100%; display: flex; flex-direction: column;}
        .sale_table {
            height: 100%;
            padding-left: 3%;
        }
        .sale_table th,
        .sale_table td { text-align: center; vertical-align: middle;}

        .sale_table th {
            vertical-align: middle;
            background-color: lightgray;
        }

        .sale_table >table{ height: 95%;}
        .sale_table tr:hover td{
            background-color: #1ABC9C;
            color: white;
        }

        .product_img{ width: auto; height: 120px;}

        .modal-body {
            position: relative; /* 부모 요소를 상대 위치로 설정합니다. */
        }

        .modal-body{
            height: 500px;
        }
        .change_sale {
            width: 95%; /* 테이블 전체 너비 설정 */
        }

        .change_sale tr> th{
            text-align: center;
        }
        .change_sale th,
        .change_sale td {
            padding-left: 0px;
            padding-top : 30px; /* 셀의 padding을 0으로 설정 */
            text-align: center;
        }
        .change_sale input{
            height :40px;
            width: 100%;
        }

        .change_sale input[type="file"] {
            width: auto; /* 파일 입력 요소의 너비를 자동으로 설정 */
        }

        
        .table_btn {
            position: absolute; /* 절대 위치로 설정합니다. */
            bottom: 20px; /* 하단에 고정합니다. */
            right: 20px; /* 우측에 고정합니다. */
            margin: 10px; /* 여백을 설정합니다. 필요에 따라 조절하세요. */
        }

        .change_btn{
            background-color: #1ABC9C;
            color: white;
        }

        .change_btn:hover{ background-color: #19b192; color: white; }
        .close {
            font-size: 50px; /* 원하는 크기로 조정하세요 */
            font-weight: bold; /* 글꼴의 굵기 설정 (선택사항) */
        }

        .modal-title {
            padding-top: 3%;
        }

        .page-item.active .page-link {background-color: #1ABC9C; border:#1ABC9C; }
        .repre_right_bottom {height: 10%;}
        .repre_right_bottom a { color:black;}
        .page-item:not(.disabled):hover .page-link {
            background-color: lightgray; /* 원하는 색상으로 변경해주세요 */
            color: #fff; /* 텍스트 색상을 변경할 수도 있습니다. */
        }


    </style>
</head>
<body>
	<div class="wrap">
		<%
	        String alertMsg = (String) request.getAttribute("alertMsg");
	        if (alertMsg != null) {
	            out.println("<script>alert('" + alertMsg + "');</script>");
	        }
	    %>
        <div class="repre_header"><img src="/resources/img/icon/logo-sm-170x100.png" alt=""></div>
        <div class="repre_body">
            <div class="repre_body_left">
                <!-- 관리자 로그인 화면 -->
                <div class="repre_left_top" style="display: flex; padding: 5%;">
                    <img src="/resources/img/common/profile_icon_512x512.png" alt="" style="width: 50px; height: 50px;">
                    <h4 style="text-align: center; width: 100%; padding-top: 10%;"><%=loginUser.getUserName() %></h4>
                </div>
                <hr>

                <div class="repre_left_bottom" style="text-align: cent;">
                    <a href="#" class="main-menu">매출관리</a>
                    <div class="sub-menu">
                        <a href="<%=contextPath%>//productform.re" class="sub-item">상품관리</a>
                        <a href="<%=contextPath%>/selectDate.re" class="sub-item">월별매출조회</a>
                    </div>
                    <a href="<%=contextPath%>/memberForm.re" class="main-menu">회원관리</a>
                    <a href="#" class="main-menu">트레이너관리</a>
                    <a href="#" class="main-menu">영상관리</a>
                </div>

                <script>
                    // 메인 메뉴 클릭 시 서브메뉴 토글
                    const mainMenus = document.querySelectorAll('.main-menu');
                    mainMenus.forEach(menu => {
                    menu.addEventListener('click', function() {
                        const subMenu = this.nextElementSibling;
                        const isActive = subMenu.classList.contains('active');

                        // 모든 하위 메뉴 숨기기
                        const subMenus = document.querySelectorAll('.sub-menu');
                        subMenus.forEach(subMenu => {
                        subMenu.classList.remove('active');
                        });

                        // 현재 클릭한 메뉴의 하위 메뉴만 보이도록 설정
                        if (!isActive) {
                        subMenu.classList.add('active');
                        }
                    });
                    });
                </script>


            </div>
            <div class="repre_body_right">
                <div class="repre_right_top">
                    <div class="right_top_title">
                        <h1>상품관리</h1>
                    </div>

                    <div class="right_top_button">
                        <button class="btn" data-toggle="modal" data-target="#insert_Modal">상품추가</button>
                    </div>
                </div>
                <div class="repre_right_center">
                    <div class="sale_table">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">번호</th>
                                    <th style="width: 20%;">이미지</th>
                                    <th style="width: 20%;">상품명</th>
                                    <th style="width: 20%;">가격</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tr data-toggle="modal" data-target="#info_Modal">
                                <th class="highlight">1</th>
                                <td><img class="product_img" src="/resources/img/common/트레이너 이미지 샘플.png" alt=""></td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr data-toggle="modal" data-target="#info_Modal">
                                <th class="highlight">1</th>
                                <td><img class="product_img" src="/resources/img/common/트레이너 이미지 샘플2.png" alt=""></td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr data-toggle="modal" data-target="#info_Modal">
                                <th class="highlight">1</th>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr data-toggle="modal" data-target="#info_Modal">
                                <th class="highlight">1</th>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr data-toggle="modal" data-target="#info_Modal">
                                <th class="highlight">1</th>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                        </tbody>
                        </table>
                    </div>


                    <!-- 상품추가 모달창 -->
                    <div class="modal fade" id="insert_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">상품추가</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="insert_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <th>이미지</th>
                                                <td><div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="customFile" required onchange="updateLabel(this, 'insert_form')">
                                                    <label class="custom-file-label" for="customFile" style="text-align: left;">첨부파일을 추가해주세요</label>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" class="form-control" placeholder="이름을 입력해주세요" required></td>
                                            </tr>
                                            <tr>
                                                <th>가격</th>
                                                <td><input type="text" class="form-control" placeholder="상품가격을 입력해주세요" id="input_price" required></td>
                                            </tr>
                                        </table>
                                        <div class="table_btn">
                                            <button type="submit" class="btn change_btn">추가하기</button>
                                        </div>
                                    </form>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <!-- 상품추가 모달창 끝 -->


                    <!-- 상품수정 모달창 -->
                    <div class="modal fade" id="info_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">상품수정</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="change_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <th>이미지</th>
                                                <td><div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="customFile" required onchange="updateLabel(this, 'change_form')">
                                                    <label class="custom-file-label" for="customFile" style="text-align: left;">첨부파일을 추가해주세요</label>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" class="form-control" placeholder="이름을 입력해주세요" required></td>
                                            </tr>
                                            <tr>
                                                <th>가격</th>
                                                <td><input type="text" class="form-control" placeholder="상품가격을 입력해주세요" id="input_price" required></td>
                                            </tr>
                                        </table>
                                        <div class="table_btn">
                                            <button class="btn btn-danger" id="deleteBtn">삭제하기</button>
                                            <button type="submit" class="btn change_btn" id="changeBtn">수정하기</button>
                                        </div>
                                    </form>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <!-- 상품수정 모달창 끝 -->


                    <script>

                    function updateLabel(input, formId) {
                            var form = document.getElementById(formId);
                            var label = form.querySelector('.custom-file-label');
                            var fileName = input.files[0].name;
                            label.innerText = fileName;
                        }

                    $('#insert_form').submit(function(event) {
                        event.preventDefault(); // 기본 제출 동작 막기
                        alert("작성이 완료했습니다.");
                        this.submit();
                    });

                    $('#change_form').submit(function(event) {
                        event.preventDefault(); // 기본 제출 동작 막기
                        alert("수정이 완료했습니다.");
                        this.submit();
                    });

                    $('#deleteBtn').click(function() {
                        var confirmation = confirm("정말로 삭제하시겠습니까?");
                        if (!confirmation) {
                            event.preventDefault(); // 폼 제출을 막음
                        } else {
                            alert("삭제 되었습니다.");
                        }
                    });


                    </script>

                </div>
                <div class="repre_right_bottom">
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
            </div>
        </div>
    </div>
</body>
</html>