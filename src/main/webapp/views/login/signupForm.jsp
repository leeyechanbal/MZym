<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    hr{
        border: 0;
        width: 100%;
        height: 1px;
        background: black;
    }

    .homePage_content{ /*메인 영역*/
        border: 3px solid #1ABC9C;
        border-radius: 3%;
    }
    
    .main_content{ /*메인 영역*/
        min-height: 1000px;
        width: 1000px;
        margin: auto;
    }

    .main_header{
        width: 1000px;
        margin: auto;
    }

    .homePage_content{
        margin: auto;
        width: 1000px;
        padding: 30px;
    }

    .homePage_content td {
        position: relative;
    }

    .homePage_content td input{
        height: 60px;
    }

    .info_btn {
        background-color: #1ABC9C;
        border: solid #1ABC9C;
        position: absolute;
        top: 30%;
        right: 3%; /* 원하는 위치로 조정 가능 */
        margin: auto;
        color : white;
    }

    .info_btn:hover{
        background: #19b192;;
        border: solid #19b192;
        color: white;
    }
    
    .signup_btn {
        background: #1ABC9C;
        border: solid #1ABC9C;
        color: white;
        border-radius: 7px;
    }
</style>
</head>
<body>
	<div class="wrap">
	
	<%@ include file="/views/common/Mzym_header.jsp" %>
	
	<!--section start-->    
      <div class="main_header">
        <h1>회원가입</h1>
        <hr>
        <h5>회원정보 입력</h5>
      </div>
      <section class="main_content">
        <%@ include file="/views/common/Mzym_sidebar.jsp" %>
          <!--메인 컨텐츠 내용 -->  
            <div class="homePage_content">
                <form action="" method="post" style="width: 100%;">
                    <table class="table table-borderless">
                        <tr>
                            <td>
                                <input type="text" class="form-control" placeholder="아이디" required id="input_id" name="userId">
                                <button type="button" class="info_btn btn-sm" onclick="idCheck();">중복확인</button>
                                <input type="hidden" class = "form-fontrol" id="input_idCheck" value="">
                            </td>
                        </tr>
                        <tr>
                            <td><input type="password" class="form-control" placeholder="비밀번호" required id="input_pwd" name="userPwd"></td>
                        </tr>
                        <tr>
                            <td><input type="password" class="form-control" placeholder="비밀번호 확인" required id="input_pwdcheck"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="이름" required id="input_name" id="input_name" name="userName"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="전화번호(-포함해서 입력해주세요)" id="input_phone" name="phone"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="주민번호(-포함해서 입력해주세요)" id="input_residentRegistrationNumber" name="rRN"></td>
                        </tr>
                        <tr>
                            <td><input type="email" class="form-control" placeholder="이메일" id="input_email" name="email"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="주소" id="input_address" name="address"></td>
                        </tr>
                        
                        <tr>
                            <td style="font-size: larger;">
                                <label style="display: flex; align-items: center; justify-content: center; text-align: center;">
                                <input type="checkbox" name="check_agreement" id="check_agreement" style="margin-right: 7px; width: 20px;">
                                [필수]개인정보 수집, 이용 동의
                                </label>
                            </td>
                        </tr>

                        <tr>
                            <th style="text-align: center; padding-top: 20px;">
                                <button type="button" id="submit_Btn" class="signup_btn" style="width: 200px; height: 50px; font-size: larger;">회원가입</button>
                            </th>
                        </tr>
                    </table>
                </form>
            </div>

      </section>
      <!--section end-->

	  <!-- 아이디 중복체크 스크립트 - 구성모 -->
	  <script>
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
				success: function(result){
					// 1) 사용불가능(NNNNN)일 경우 => alert로 메세지 출력, 다시 입력할 수 있도록 유도
					// 2) 사용가능(NNNNY)일 경우 => 진짜 사용할껀지 재차 물어보기 (confirm메소드)
											  // > yes => 더이상 아이디 수정 못하게끔, 회원가입버튼 활성화
											  // > no => 다시 입력할 수 있도록 유도
					if(result == "NNNNN") {
						alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
						$idInput.focus();
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
		
        </script>
        <!-- 유효성검사-구성모 -->
        <script>

        $(document).ready(function() {
            $('#submit_Btn').click(function(event) {
                event.preventDefault(); // 기본 제출 동작 막기

                var agreementChecked = $('#check_agreement').is(':checked');
                if (!agreementChecked) {
                    alert("개인정보 수집, 이용에 동의해주세요.");
                    return;
                }

                var id = $('#input_id').val();
                var idCheck = $('#input_idCheck').val();
                var password = $('#input_pwd').val();
                var confirmPassword = $('#input_pwdcheck').val();
                var name = $('#input_name').val();
                var phoneNumber = $('#input_phone').val();
                var residentRegistrationNumber = $('#input_residentRegistrationNumber').val();
                var input_email = $('#input_email').val();
				var input_address =$('#input_address').val();                
                

                if (id !== idCheck) {
                    alert("아이디 중복확인 안되었습니다 중복확인 버튼을 눌려주세요");
                    return;
                }

                var idRegex = /^[a-zA-Z0-9]+$/;
                if (!idRegex.test(id)) {
                    alert("아이디는 영문자와 숫자만 입력 가능합니다.");
                    return;
                }
                
                // 비밀번호 유효성 검사: 영문자, 숫자, 특수문자 포함, 8자 이상
                var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
                if (!passwordRegex.test(password)) {
                    alert("비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
                    return;
                }

                // 비밀번호와 비밀번호 확인 일치 여부 검사
                if (password !== confirmPassword) {
                    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
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
                    
                $.ajax({
                    url:"<%=contextPath%>/signup.me",
                    data:{
                        userId:id,
                        userPwd:password,
                        userName:name,
                        phone:phoneNumber,
                        email:input_email,
                        rRN:residentRegistrationNumber,
                        address:input_address
                    },
                    type:"post",
                    success:function(result){
                        if(result > 0 ){
                        	window.location.href = "<%=contextPath %>";
                        }else{
                        	alert("회원가입 실패했습니다.");
                        }
                    },error:function(){
                        console.log("회원가입 ajax통신 실패")
                    }
                })
            });
        });
        </script>
      
      
	
	    <%@ include file="/views/common/Mzym_footer.jsp" %>
     </div>
	
</body>
</html>