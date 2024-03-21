<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.member.model.vo.RepreDate" %>
<% 
	List<RepreDate> dateList = (List<RepreDate>)request.getAttribute("dateList"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
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

        .repre_body{height: 500px; display: flex;}

        .repre_body_left{min-width: 150px; display: flex; flex-direction: column;}
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

        .repre_body_right{width: 100%; display: flex; flex-direction: column;}
        .repre_right_top{ display: flex; height: 85px; padding-left: 3%; padding-top: 2%; align-items: center;}
        .right_top_title{ min-width: 200px;}
        .repre_right_top h1 {
            padding-right: 3%;
            padding-left: 3%;
        }
        .right_top_select {
            width: 150px;
            height: 40px;
            overflow-y: auto;
        }
        .form-control {
            width: 100%;
            height: 100%;
        }
        .right_top_button {
            width: 80%;
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

        .repre_right_center{height: 70%; display: flex; flex-direction: column;}
        .sale_table {
            height: 85%;
            padding-left: 3%;
        }

        .sale_table th,
        .sale_table td { text-align: center;}
        .sale_table th {
            background-color: lightgray;
        }

        .sale_table tr:hover td{
            background-color: #1ABC9C;
            color: white;
        }

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
        .change_sale input,
        .change_sale select{
            height :40px;
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

        .sale_total {
            height: 15%; 
            background-color: lightgray; 
            display: flex;
            flex-direction: column; /* 요소들을 세로로 배치 */
            justify-content: center; /* 세로 중앙 정렬 */
            align-items: center; /* 가로 중앙 정렬 */
            min-width: 500px;
            width: 97%;
            margin-left: 3%;
        }
        
        .repre_right_bottom{height: 15%; padding-top: 2%;}
        .page-item.active .page-link {background-color: #1ABC9C; border:#1ABC9C; }
        .repre_right_bottom a { color:black;}
        .page-item:not(.disabled):hover .page-link {
            background-color: lightgray; /* 원하는 색상으로 변경해주세요 */
            color: #fff; /* 텍스트 색상을 변경할 수도 있습니다. */
        }

    </style>
</head>
<body>
	<div class="wrap">
        <div class="repre_header"><img src="<%=contextPath %>/resources/img/icon/logo-sm-170x100.png" alt=""></div>
        <div class="repre_body">
            <div class="repre_body_left">
                <!-- 관리자 로그인 화면 -->
                <div class="repre_left_top" style="display: flex; padding: 5%;">
                    <img src="<%=contextPath%>/resources/img/common/profile_icon_512x512.png" alt="" style="width: 50px; height: 50px;">
                    <h4 style="text-align: center; width: 100%; padding-top: 10%;">홍길동</h4>
                </div>
                <hr>

                <div class="repre_left_bottom" style="text-align: cent;">
                    <a href="#" class="main-menu">매출관리</a>
                    <div class="sub-menu">
                        <a href="#" class="sub-item">상품관리</a>
                        <a href="#" class="sub-item">월별매출조회</a>
                    </div>
                    <a href="#" class="main-menu">회원관리</a>
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
                        <h1>매출관리</h1>
                    </div>

                    <div class="right_top_select">
                        <select class="form-control" name="select_date" id="select_date" onchange="selectDate(this.value)">
                        	<% for(RepreDate r : dateList) { %>
                            <option value="<%= r.getSqlDate() %>"><%= r.getSelectDate() %></option>
                            <% } %>
                            
                        </select>
                    </div>
                    <div class="right_top_button">
                        <button class="btn" data-toggle="modal" data-target="#insert_Modal">매출추가</button>
                    </div>
                </div>
                <div class="repre_right_center">
                    <div class="sale_table">
                        <table class="table table-hover table-bordered" style="height:100%">
                            <thead>
                                <tr>
                                    <th style="width: 60px;">번호</th>
                                    <th style="width: 100px;">이름</th>
                                    <th style="width: 20%;">상품명</th>
                                    <th style="width: 20%;">가격</th>
                                    <th style="width: 20%;">구매날짜</th>
                                </tr>
                            </thead>
                            <tbody id="saleSelectTable">
                            
                            
                        	</tbody>
                        </table>
                    </div>


                    <!-- 매출추가 모달창 -->
                    <div class="modal fade" id="insert_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">매출추가</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="insert_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" class="form-control" placeholder="이름을 입력해주세요" required id="input_name"></td>
                                            </tr>
                                            <tr>
                                                <th>상품</th>
                                                <td><select name="" class="form-control" id="category">
                                                    <option value="select_product">상품선택</option>
                                                    <option value="PT_20">PT20회</option>
                                                    <option value="PT_20">PT20회</option>
                                                    <option value="PT_20">PT20회</option>
                                                </select></td>
                                            </tr>
                                            <tr>
                                                <th>가격</th>
                                                <td><input type="text" class="form-control" placeholder="상품가격을 입력해주세요" id="input_price"></td>
                                            </tr>
                                            <tr>
                                                <th>구매날짜</th>
                                                <td><input type="text" class="form-control" placeholder="xxxx-xx-xx(-포함하여 입력해주세요)" id="input_date"></td>
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
                    <!-- 매출추가 모달창 끝 -->


                    <!-- 매출수정 모달창 -->
                    <!-- 모달 창 -->
                    <div class="modal fade" id="info_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">매출수정</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="change_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" class="form-control" required id="input_name" value="홍길동"></td>
                                            </tr>
                                            <tr>
                                                <th>상품</th>
                                                <td><select name="" id="" class="form-control">
                                                    <option value="PT_20">PT20회</option>
                                                    <option value="PT_20">PT20회</option>
                                                    <option value="PT_20">PT20회</option>
                                                </select></td>
                                            </tr>
                                            <tr>
                                                <th>가격</th>
                                                <td><input type="text" class="form-control" value="1,200,000" required id="input_price"></td>
                                            </tr>
                                            <tr>
                                                <th>구매날짜</th>
                                                <td><input type="text" class="form-control" value="2024-02-22" required id="input_date"></td>
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
                    <!-- 매출수정 모달창 끝 -->
                             
                <!-- 폼제출 유효성 검사_구성모-->
                <script>
                    $('#insert_form').submit(function(event) {
                        event.preventDefault(); // 기본 제출 동작 막기
                        if(check($(this))) {
                            alert("작성이 완료했습니다.");
                            this.submit();
                        }  
                    });

                    $('#change_form').submit(function(event) {
                        event.preventDefault(); // 기본 제출 동작 막기
                        if(check($(this))) {
                            alert("수정이 완료했습니다.");
                            this.submit();
                        } 
                    });

                    $('#deleteBtn').click(function() {
                        var confirmation = confirm("정말로 삭제하시겠습니까?");
                        if (!confirmation) {
                            event.preventDefault(); // 폼 제출을 막음
                        } else {
                            alert("삭제 되었습니다.");
                        }
                    });

                    
                    function check(form){

                        var name = form.find('#input_name').val();
                        var price = form.find('#input_price').val();
                        var date = form.find('#input_date').val();

                        console.log(name)

                        // 이름 유효성 검사: 한글만 허용
                        var nameRegex = /^[가-힣]+$/;
                        if (!nameRegex.test(name)) {
                            alert("이름은 한글만 입력 가능합니다.");
                            return false;
                        }

                        var selectedValue = form.find("#category").value;
                        if (selectedValue === "select_product") {
                            alert("상품을 선택하세요!");
                            return false; // 폼 제출을 막음
                        }

                        var priceRegex = /^(\d{1,3}(,\d{3})*|\d+)$/;
                        if (!priceRegex.test(price)) {
                            alert("금액 입력형식이 올바르지 않습니다. 예) 1,000,000");
                            return false;
                        }

                        // 주민등록번호 유효성 검사: 6자리 숫자-7자리 숫자 형식
                        var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
                        if (!dateRegex.test(date)) {
                            alert("날짜입력형식이 올바르지 않습니다. 예) xxxx-xx-xx");
                            return false;
                        }

                        return true;
                    }
                </script>



                    <div class="sale_total">
                        <h3>24년8월 총 매출 : 100,000,000원</h3>
                    </div>
                </div>
                <div class="repre_right_bottom">
                    <ul class="pagination my justify-content-center">
                        
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ajax스크립트 -->
				<script>
				$(document).ready(function(){
               		var select_date = $("#select_date").val();
                    var pageParam = 1
             		
                    ajaxSelect(select_date,pageParam);
             	});
				
				function selectDate(selectedDate){
					ajaxSelect(selectedDate, 1);
				}
				
				function ajaxSelect(select_date, pageParam){
					
					$.ajax({
             			url:"<%=contextPath%>/selectSale.re",
             			data:{
							pageNo:pageParam,
             				date : select_date
             			},
             			type:"post",
             			success:function(saleMap){
             				
             				var pageInfo = saleMap.pi;
             		        var paymentList = saleMap.list;
             				$("ul").html(generatePageLinks(select_date, pageInfo, pageParam));
             				$("#saleSelectTable").html(selectSale(paymentList, pageInfo, pageParam));
             				
             			},error:function(){
             				console.log("매출조회 등록용 ajax통신 실패")
             			}
             		})
				}
				
				function generatePageLinks(select_date, pageInfo, pageParam) {
				    var pagehtml = '';
				    // 이전 페이지 링크 추가
				    if (pageInfo.currentPage == 1) {
				    	pagehtml += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
				    } else {
				    	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(\'' + select_date + '\',' + (pageInfo.currentPage - 1) + ')">Previous</a></li>';
				    }

				    // 페이지 번호 링크 추가
				    for (var p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
				        if (p == pageInfo.currentPage) {
				        	pagehtml += '<li class="page-item active"><a class="page-link" href="#">' + p + '</a></li>';
				        } else {
				        	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(\'' + select_date + '\',' + p + ')">' + p + '</a></li>';
				        }
				    }

				    // 다음 페이지 링크 추가
				    if (pageInfo.currentPage == pageInfo.maxPage) {
				    	pagehtml += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
				    } else {
				    	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(\'' + select_date + '\',' + (pageInfo.currentPage + 1) + ')">Next</a></li>';
				    }

				    return pagehtml;
				}
				
				function selectSale(paymentList, pageInfo, pageParam) {
					
					var html = '';
					for (var p = 0; p < pageInfo.boardLimit; p++) {
						console.log(paymentList[p])
						if(paymentList[p] == null) {
							html += '<tr style="height:50px">' +
						            '<th></th>' +
						            '<td></td>' +
						            '<td></td>' +
						            '<td></td>' +
						            '<td></td>' +
						            '</tr>';
						}else {
							html += 
							'<tr data-toggle="modal" data-target="#info_Modal">' +
	                        '<th>' + ((parseInt(pageParam)-1) * pageInfo.pagingLimit + (p+1)) + '</td>' +
	                        '<td>' + paymentList[p].userName + '</td>' +
	                        '<td>' + paymentList[p].productName + '</td>' +
	                        '<td>' + paymentList[p].price + '</td>' +
	                        '<td>' + paymentList[p].paymentDate + '</td>' +
	                        '</tr>';
						}
				    }
                     
                     return html;
				}
				
				</script>   
    
</body>
</html>