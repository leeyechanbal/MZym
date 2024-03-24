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
<title>영상관리</title>
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

        .change_sale select{
            height :40px;
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
        <div class="repre_header"><img src="<%=contextPath%>/resources/img/icon/logo-sm-170x100.png" alt=""></div>
        <div class="repre_body">
            <div class="repre_body_left">
                <!-- 관리자 로그인 화면 -->
                <div class="repre_left_top" style="display: flex; padding: 5%;">
                    <img src="<%=contextPath%>/resources/img/common/profile_icon_512x512.png" alt="" style="width: 50px; height: 50px;">
                    <h4 style="text-align: center; width: 100%; padding-top: 10%;"><%=loginUser.getUserName() %></h4>
                </div>
                <hr>

                <div class="repre_left_bottom" style="text-align: cent;">
                    <a href="#" class="main-menu">매출관리</a>
                    <div class="sub-menu">
                        <a href="<%=contextPath%>/productform.re" class="sub-item">상품관리</a>
                        <a href="<%=contextPath%>/selectDate.re" class="sub-item">월별매출조회</a>
                    </div>
                    <a href="<%=contextPath%>/memberForm.re" class="main-menu">회원관리</a>
                    <a href="#" class="main-menu">트레이너관리</a>
                    <a href="<%=contextPath%>/movieForm.re" class="main-menu">영상관리</a>
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
                        <h1>영상관리</h1>
                    </div>

                    <div class="right_top_button">
                        <button class="btn" data-toggle="modal" data-target="#insert_Modal">영상추가</button>
                    </div>
                </div>
                <div class="repre_right_center">
                    <div class="sale_table">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">번호</th>
                                    <th style="width: 20%;">분류</th>
                                    <th style="width: 20%;">영상제목</th>
                                    <th style="width: 20%;">링크</th>
                                </tr>
                            </thead>
                            <tbody id="saleSelectTable">
                            
                        	</tbody>
                        </table>
                    </div>


                    <!-- 영상추가 모달창 -->
                    <div class="modal fade" id="insert_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">영상추가</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="insert_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <th>분류</th>
                                                <td>
                                                    <select name="" id="category" class="form-control category">
                                                        <option value="select_category" selected>분류선택</option>
                                                        <option value="1">추천영상</option>
                                                        <option value="2">일반영상</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td><input type="text" class="form-control title" placeholder="제목을 입력해주세요" required></td>
                                            </tr>
                                            <tr>
                                                <th>링크</th>
                                                <td><input type="text" class="form-control link" placeholder="유튜브링크 입력해주세요" required id="input_link"></td>
                                            </tr>
                                        </table>
                                        <div class="table_btn">
                                            <button type="button" class="btn change_btn" id="insert_Btn">추가하기</button>
                                        </div>
                                    </form>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <!-- 상품추가 모달창 끝 -->


                    <!-- 영상수정 모달창 -->
                    <div class="modal fade" id="info_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">영상수정</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="change_form" action="<%=contextPath %>/deleteVideo.re" method="post">
                                        <table class="change_sale">
                                        <input type="hidden" class="form-control" name="videoNo" id="update_videoNo">
                                            <tr>
                                                <th>분류</th>
                                                <td>
                                                    <select name="" id="category_update" class="form-control category">
                                                        <option value="select_category" selected>분류선택</option>
                                                        <option value="1">추천영상</option>
                                                        <option value="2">일반영상</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td><input type="text" class="form-control title" placeholder="제목을 입력해주세요" required id="update_title"></td>
                                            </tr>
                                            <tr>
                                                <th>링크</th>
                                                <td><input type="text" class="form-control link" placeholder="유튜브링크 입력해주세요" required id="update_link"></td>
                                            </tr>
                                        </table>
                                        <div class="table_btn">
                                            <button type="submit" class="btn btn-danger" id="deleteBtn">삭제하기</button>
                                            <button type="button" class="btn change_btn" id="changeBtn">수정하기</button>
                                        </div>
                                    </form>
                                </div>   
                            </div>
                        </div>
                    </div>
                    <!-- 상품수정 모달창 끝 -->


                    <script>
                    
                    var vidoeList;
    				var pageInfo;
    				var form;
                    
                    $(document).ready(function(){
                        ajaxSelect(1);
                 	});
                    
                    $('#insert_Btn').click(function(event) {
	                    event.preventDefault(); // 기본 제출 동작 막기
	                    form = document.getElementById('insert_form');
	                    
	                    if(check(form)) {
	                        insertVideo()
	                    }
                    });

                    $('#changeBtn').click(function(event) {
                        event.preventDefault(); // 기본 제출 동작 막기
                        form = document.getElementById('change_form');
                        if(check(form)) {
                        	$.ajax({
                     			url:"<%=contextPath%>/updateVideo.re",
                     			data:{
                     				videoNo: $('#update_videoNo').val(),
                     	            title : $('#update_title').val(),
                     	            link: $('#update_link').val(),
                     	           	category: $('#category_update').val(),
                     			},
                     			type:"post",
                     			success:function(response){
                     				if (response === "success") {
                     		            // 성공 메시지를 보여줍니다.
	                     				ajaxSelect(pageInfo.currentPage)
                     		            $('#info_Modal').modal('hide');
                     		            alert("영상이 수정되었습니다.");
                     		        } else {
                     		            // 실패 메시지를 보여줍니다.
                     		            alert("영상수정이 실패했습니다. 다시 시도해주세요.");
                     		        }

                     			},error:function(){
                     				console.log("영상조회 등록용 ajax통신 실패")
                     			}
                     		})
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
                    	
                    	var link = form.querySelector('.link').value;
                        var category = form.querySelector('.category').value;

                        if (category === "select_category") {
                            alert("분류 선택하세요!");
                            return false; // 폼 제출을 막음
                        }
                        var urlPattern = /^(https?:\/\/)?([\w\-]+\.)+[a-z]{2,}(\/\S*)?$/i;
                        if (!urlPattern.test(link)) {
                            alert("유효한 링크를 입력하세요");
                            return false; // 폼 제출을 막음
                        }

                        return true;
                    }
                    
                    function ajaxSelect(pageParam){
    					
    					$.ajax({
                 			url:"<%=contextPath%>/selectMovie.re",
                 			data:{
    							pageNo:pageParam
                 			},
                 			type:"post",
                 			async:false,
                 			success:function(vidoeMap){
                 		        
                 				pageInfo = vidoeMap.pi;
                 				vidoeList = vidoeMap.list;    
                 				
                 				$("ul").html(generatePageLinks(pageInfo, pageParam));
                 				$("#saleSelectTable").html(selectSale(vidoeList, pageInfo, pageParam));
                 				
                 			},error:function(){
                 				console.log("회원조회 등록용 ajax통신 실패")
                 			}
                 		})
    				}
                    
                    function generatePageLinks(pageInfo, pageParam) {
    				    var pagehtml = '';
    				    // 이전 페이지 링크 추가
    				    if (pageInfo.currentPage == 1) {
    				    	pagehtml += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
    				    } else {
    				    	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(' + (pageInfo.currentPage - 1) + ')">Previous</a></li>';
    				    }

    				    // 페이지 번호 링크 추가
    				    for (var p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
    				        if (p == pageInfo.currentPage) {
    				        	pagehtml += '<li class="page-item active"><a class="page-link" href="#">' + p + '</a></li>';
    				        } else {
    				        	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(' + p + ')">' + p + '</a></li>';
    				        }
    				    }

    				    // 다음 페이지 링크 추가
    				    if (pageInfo.currentPage == pageInfo.maxPage) {
    				    	pagehtml += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
    				    } else {
    				    	pagehtml += '<li class="page-item"><a class="page-link" href="#" onclick="ajaxSelect(' + (pageInfo.currentPage + 1) + ')">Next</a></li>';
    				    }

    				    return pagehtml;
    				}
                    
                    function selectSale(vidoeList, pageInfo, pageParam) {
    					var html = '';
    					for (var p = 0; p < pageInfo.boardLimit; p++) {
    						if(vidoeList[p] == null) {
    							html += 
    									'<tr style="height:70px">' +
    						            '<th></th>' +
    						            '<td></td>' +
    						            '<td></td>' +
    						            '<td></td>' +
    						            '</tr>';
    						}else {
    							var videoCategory;
    							if(vidoeList[p].videoLevel  === 1) {
    								videoCategory = "추천영상"
    							}else {
    								videoCategory = "일반영상"
    							}
    							html += 
    								'<tr onclick="openModal(' + p +')" data-toggle="modal" data-target="#info_Modal">' +
    							    '<th>' + ((parseInt(pageParam)-1) * pageInfo.pagingLimit + (p+1)) + '</th>' +
    							    '<td>' + videoCategory + '</td>' +
    							    '<td>' + vidoeList[p].videoTitle + '</td>' +
    							    '<td>' + vidoeList[p].link + '</td>' +
    							    '</tr>';
    						}
    				    }
                         
                         return html;
    				}
					
                    function insertVideo() {
                    	
                    	var title = form.querySelector('.title').value;
                    	var link = form.querySelector('.link').value;
                        var category = form.querySelector('.category').value;
     
                        $.ajax({
                            url:"<%=contextPath%>/insertVideo.re",
                            data:{
                                videoTitle:title,
                                videoLink:link,
                                videoCategory:category,
                            },
                            type:"post",
                            success:function(result){
                            	ajaxSelect(1);
                            	$('#insert_Modal').modal('hide');
                            	alert("영상이 추가되었습니다.");
                            },error:function(){
                                console.log("영상추가 ajax통신 실패")
                            }
                        })
                    }
                    
                    function openModal(p) {
    					var modalId = "info_Modal";
    	
    			        // 모달을 열기 위해 모달을 나타내는 요소를 가져옵니다.
    			        var modal = document.getElementById(modalId);
    			        
    			        document.getElementById('update_videoNo').value = vidoeList[p].videoNo; 
    			        document.getElementById('update_title').value = vidoeList[p].videoTitle;
    			        document.getElementById('update_link').value = vidoeList[p].link;
    			        
    			        
    			        var select = document.getElementById('category_update');
    			        
    			        for (var i = 0; i < select.options.length; i++) {
    			            if (select.options[i].value === vidoeList[p].videoLevel.toString()) {
    			                select.selectedIndex = i;
    			                select.options[i].selected = true;
    			                break;
    			            }
    			        }
          	        
    			        
    			        $(modal).modal('show');

                    }

                    </script>

                </div>
                <div class="repre_right_bottom">
                    <ul class="pagination my justify-content-center">
                        
                    </ul>
                </div>
            </div>
        </div>
    </div>

</body>
</html>