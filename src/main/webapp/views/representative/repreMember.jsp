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
<title>회원관리</title>
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

        .modal-body{
            min-height: 600px;
        }

        .change_sale {
            width: 95%; /* 테이블 전체 너비 설정 */
        }

        .change_sale tr> th{
            text-align: center;
        }

        .change_sale tr> td{
           position: relative;
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
            height: 5%;
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


        .info_btn {
            background-color: #1ABC9C;
            border: solid #1ABC9C;
            position: absolute;
            top: 50%;
            right: 3%; /* 원하는 위치로 조정 가능 */
            margin: auto;
            color : white;
            height: 30px;
            line-height: 10px; 
        }

        .info_btn:hover{
            background: #19b192;;
            border: solid #19b192;
            color: white;
        }
        
        .modal-header, .modal-body{ padding-left : 30px; }

    </style>
</head>
<body>
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
                        <a href="<%=contextPath%>/productForm.re" class="sub-item">상품관리</a>
                        <a href="<%=contextPath%>/selectDate.re" class="sub-item">월별매출조회</a>
                    </div>
                    <a href="<%=contextPath%>/memberForm.re" class="main-menu">회원관리</a>
                    <a href="<%=contextPath%>/trainerForm.re" class="main-menu">트레이너관리</a>
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
                        <h1>회원관리</h1>
                    </div>

                    <div class="right_top_button">
                        <button class="btn" data-toggle="modal" data-target="#insert_Modal">회원추가</button>
                    </div>
                </div>
                <div class="repre_right_center">
                    <div class="sale_table">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">번호</th>
                                    <th style="width: 11%;">이름</th>
                                    <th style="width: 11%;">아이디</th>
                                    <th style="width: 11%;">생년월일</th>
                                    <th style="width: 11%;">이메일</th>
                                    <th style="width: 11%;">전화번호</th>
                                </tr>
                            </thead>
                            <tbody id="saleSelectTable"> 
                            
                            
                        	</tbody>
                        </table>
                    </div>


                    <!-- 회원추가 모달창 -->
                    <div class="modal fade" id="insert_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">회원추가</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="insert_form" action="">
                                        <table class="change_sale">
                                            <tr>
                                                <td><input type="text" class="form-control formid" placeholder="아이디" required id="input_id" name="userId">
                                                    <button type="button" class="info_btn btn-sm" onclick="idCheck();">중복확인</button></td>
                                                    <input type="hidden" class = "form-fontrol" id="input_idCheck" value="">
                                            </tr>
                                            <tr>
                                            	<input type="hidden" class="form-control pwd" placeholder="초기비밀번호 : a1234567" value="a1234567" readonly name="userPwd">
                                                <td><input type="text" class="form-control" placeholder="초기비밀번호 : a1234567"  readonly></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control name" placeholder="이름" required id="input_name" name="userName"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control phone" placeholder="전화번호(-포함해서 입력해주세요)" required id="input_phone" name="phone"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control rrn" placeholder="주민번호(-포함해서 입력해주세요)" required id="input_residentRegistrationNumber" name="rRN"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="email" class="form-control email" placeholder="이메일" required  id="input_email" name="email"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control address" placeholder="주소" required name="address"></td>
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


                    <!-- 상품수정 모달창 -->
                    <div class="modal fade" id="info_Modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h3 class="modal-title">회원수정</h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form id="change_form" action="<%=contextPath %>/deleteMember.re" method="post">
                                        <table class="change_sale">
                                        <input type="hidden" class="form-control" name="userNo" id="update_userNo">
                                            <tr>
                                                <td><input type="text" class="form-control formid" placeholder="아이디" readOnly id="update_id">
                                            </tr>
                                            <tr>
                                                <input type="hidden" class="form-control pwd" placeholder="초기비밀번호 : a1234567" value="a1234567" id="update_userPwd" readonly">
                                                <td><input type="text" class="form-control" placeholder="초기비밀번호 : a1234567"  readonly></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control name" placeholder="이름" required id="update_userName"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control phone" placeholder="전화번호(-포함해서 입력해주세요)" required id="update_phone"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control rrn" placeholder="주민번호(-포함해서 입력해주세요)" required id="update_rrn"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="email" class="form-control email" placeholder="이메일" required  id="update_email"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control address" placeholder="주소" required id="update_address"></td>
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
                    	
	                    var memberList;
	    				var pageInfo;
	    				var form;
	    				
	    				var id;
	    				
	                    $(document).ready(function(){
	                        ajaxSelect(1);
	                 	});
                    
	                    $('#insert_Btn').click(function(event) {
		                    event.preventDefault(); // 기본 제출 동작 막기
		                    form = document.getElementById('insert_form');

		                  	id = form.querySelector('.formid').value;
		                    var idCheck = $('#input_idCheck').val();
		                    
		                    if (id !== idCheck) {
		                        alert("아이디 중복확인 안되었습니다 중복확인 버튼을 눌려주세요");
		                        return;
		                    }
		                    if(check(form)) {
		                        signupMember()
		                    }
	                    });
		                
	                   $('#changeBtn').click(function(event) {
	                        event.preventDefault(); // 기본 제출 동작 막기
	                        form = document.getElementById('change_form');
	                        if(check(form)) {
	                        	$.ajax({
	                     			url:"<%=contextPath%>/updateMember.re",
	                     			data:{
	                     				userNo: $('#update_userNo').val(),
	                     	            id : $('#update_userid').val(),
	                     	            pwd: $('#update_userPwd').val(),
	                     	            name: $('#update_userName').val(),
	                     	            phone: $('#update_phone').val(),
	                     	            rrn: $('#update_rrn').val(),
	                     	            email: $('#update_email').val(),
	                     	         	addreess: $('#update_address').val(),
	                     			},
	                     			type:"post",
	                     			success:function(response){
	                     				if (response === "success") {
	                     		            // 성공 메시지를 보여줍니다.
		                     				ajaxSelect(pageInfo.currentPage)
	                     		            $('#info_Modal').modal('hide');
	                     		            alert("매출이 수정되었습니다.");
	                     		        } else {
	                     		            // 실패 메시지를 보여줍니다.
	                     		            alert("매출수정이 실패했습니다. 다시 시도해주세요.");
	                     		        }

	                     			},error:function(){
	                     				console.log("매출조회 등록용 ajax통신 실패")
	                     			}
	                     		})
	                        } 
	                    });
	                    
	                    $('#change_form').submit(function(event) {
		                    event.preventDefault(); // 기본 제출 동작 막기
		                    var confirmation = confirm("정말로 삭제하시겠습니까?");
		                    if (!confirmation) {
	                            event.preventDefault(); // 폼 제출을 막음
	                        } else {
	                        	this.submit();
	                        }
		                });

		                    
		              
    
                        
                        function check(form){
    
                            id = form.querySelector('.formid').value;
                            name = form.querySelector('.name').value;
                            phoneNumber = form.querySelector('.phone').value;
                            residentRegistrationNumber = form.querySelector('.rrn').value;
                            
                            
                            var idRegex = /^[a-zA-Z0-9]+$/;
                            if (!idRegex.test(id)) {
                                alert("아이디는 영문자와 숫자만 입력 가능합니다.");
                                return;
                            }

                            // 이름 유효성 검사: 한글만 허용
                            var nameRegex = /^[가-힣]+$/;
                            if (!nameRegex.test(name)) {
                                alert("이름은 한글만 입력 가능합니다.");
                                return;
                            }

                            // 전화번호 유효성 검사: 010 또는 02로 시작하는 10~11자리 숫자
                            var phoneNumberRegex = /^(02|010)-\d{3,4}-\d{4}$/;
                            if (!phoneNumberRegex.test(phoneNumber)) {
                                alert("전화번호는 010 또는 02로 시작하는 10~11자리의 숫자이어야 합니다.");
                                return;
                            }

                            // 주민등록번호 유효성 검사: 6자리 숫자-7자리 숫자 형식
                            var residentRegistrationNumberRegex = /^\d{6}-\d{7}$/;
                            if (!residentRegistrationNumberRegex.test(residentRegistrationNumber)) {
                                alert("주민등록번호 형식이 올바르지 않습니다. 예) 123456-1234567");
                                return;
                            }

                            return true;
                        }
                        
                        function ajaxSelect(pageParam){
        					
        					$.ajax({
                     			url:"<%=contextPath%>/selectMember.re",
                     			data:{
        							pageNo:pageParam
                     			},
                     			type:"post",
                     			async:false,
                     			success:function(memberMap){
                     		        
                     				pageInfo = memberMap.pi;
                     		        memberList = memberMap.list;    
                     				
                     				$("ul").html(generatePageLinks(pageInfo, pageParam));
                     				$("#saleSelectTable").html(selectSale(memberList, pageInfo, pageParam));
                     				
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
                        
                        function selectSale(memberList, pageInfo, pageParam) {
        					
        					var html = '';
        					for (var p = 0; p < pageInfo.boardLimit; p++) {
        						if(memberList[p] == null) {
        							html += 
        									'<tr style="height:70px">' +
        						            '<th></th>' +
        						            '<td></td>' +
        						            '<td></td>' +
        						            '<td></td>' +
        						            '<td></td>' +
        						            '<td></td>' +
        						            '</tr>';
        						}else {
        							var jumin = memberList[p].RRN 
        							jumin = jumin.replace(/-/g, '');
        							jumin = jumin.substring(0, 6);
        							html += 
        								'<tr onclick="openModal(' + p +')" data-toggle="modal" data-target="#info_Modal">' +
        							    '<th>' + ((parseInt(pageParam)-1) * pageInfo.pagingLimit + (p+1)) + '</th>' +
        							    '<td>' + memberList[p].userName + '</td>' +
        							    '<td>' + memberList[p].userId + '</td>' +
        							    '<td>' + jumin + '</td>' +
        							    '<td>' + memberList[p].email + '</td>' +
        							    '<td>' + memberList[p].phone + '</td>' +
        							    '</tr>';
        						}
        				    }
                             
                             return html;
        				}
                        
                        function idCheck(){
                  		  
                		  	var id = $('#input_id').val();
                		  	var idRegex = /^[a-zA-Z0-9]+$/;
                		    if (!idRegex.test(id)) {
                		        alert("아이디는 영문자와 숫자만 입력 가능합니다.");
                		        return;
               		    	}

                			$.ajax({
                				url:"<%=contextPath%>/idCheck.me",
                				data: {checkId:id},
                				success: function(resultIdCheck){
                					// 1) 사용불가능(NNNNN)일 경우 => alert로 메세지 출력, 다시 입력할 수 있도록 유도
                					// 2) 사용가능(NNNNY)일 경우 => 진짜 사용할껀지 재차 물어보기 (confirm메소드)
                											  // > yes => 더이상 아이디 수정 못하게끔, 회원가입버튼 활성화
                											  // > no => 다시 입력할 수 있도록 유도
                					if(resultIdCheck == "NNNNN") {
                						alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                						document.getElementById('input_id').focus;
                					}else {
                						$("#input_idCheck").val(id);
                						console.log($("#input_idCheck").val());
                						alert("아이디 사용가능합니다 추후 아이디 변경하면 다시한번 중복확인을 눌려주세요!");			
                					}
                				},
                				error: function(){
                					console.log("아이디 중복체크용 ajax 통신 실패");
                				}
                			});
                		}
                        
                        function signupMember() {
                        	
		    				var pwd = form.querySelector('.pwd').value;
	                        var name = form.querySelector('.name').value;
	                        var phoneNumber = form.querySelector('.phone').value;
	                        var residentRegistrationNumber = form.querySelector('.rrn').value;
	                        var email = form.querySelector('.email').value;
	                        var input_address = form.querySelector('.address').value;
	     					
	                        
	                        $.ajax({
	                            url:"<%=contextPath%>/signup.me",
	                            data:{
	                                userId:id,
	                                userPwd:pwd,
	                                userName:name,
	                                phone:phoneNumber,
	                                email:email,
	                                rRN:residentRegistrationNumber,
	                                address:input_address
	                            },
	                            type:"post",
	                            success:function(result){
	                            	ajaxSelect(1);
	                            	$('#insert_Modal').modal('hide');
	                            	alert("회원이 추가되었습니다.");
	                            },error:function(){
	                                console.log("회원가입 ajax통신 실패")
	                            }
	                        })
                        }
                        
                        function openModal(p) {
        					var modalId = "info_Modal";
        	
        			        // 모달을 열기 위해 모달을 나타내는 요소를 가져옵니다.
        			        var modal = document.getElementById(modalId);
        			        
        			        document.getElementById('update_userNo').value = memberList[p].userNo; 
        			        document.getElementById('update_id').value = memberList[p].userId;
        			        document.getElementById('update_userName').value = memberList[p].userName;
        			        document.getElementById('update_phone').value = memberList[p].phone;
        			        document.getElementById('update_rrn').value = memberList[p].RRN;
        			        document.getElementById('update_email').value = memberList[p].email;
        			        document.getElementById('update_address').value = memberList[p].address;
        			        	        
        			        
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