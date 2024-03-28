<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담예약</title>
<!-- 메인콘테트 관련 style -->
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
        min-height: 500px;
        width: 1000px;
        margin: auto;
    }

    .main_header{
        width: 1000px;
        height: 70px;
        margin: auto;
        display: flex;
    }
    .main_header_right{ 
        width: 50%;
        display: flex;
        align-items: center;
    }

    .main_header_left h1{
        margin-left: 10px;
    }

    .main_header_left { width: 50%; display: flex; flex-direction: column-reverse; }

    .homePage_content{
        margin: auto;
        padding: 30px;
        width:1000px
    }

    .homePage_content td input{
        height: 60px;
    }
    .homePage_content td select{
        height: 60px;
    }

    .consulting_table {
        width: 100%;
        border-collapse: collapse; /* 테이블 셀 간의 간격 제거 */
    }

    .consulting_table th{
        width: 20%;
    }

    .consulting_table th,
    .consulting_table td {
        padding: 10px; /* 셀 내부 여백 추가 */
        text-align: right; /* 가운데 정렬 */
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
        <div class="main_header_right"><img src="<%=contextPath %>/resources/img/icon/telephone_icon_50x50.png"><h1>상담문의</h1></div>

        <div class="main_header_left"><h3>상담가능 시간 | 오전08:00 ~ 오후10:00</h3></div>
      </div>
      <section class="main_content">
   

          <!--메인 컨텐츠 내용 -->  
            <div class="homePage_content">
                <form action="<%=contextPath %>/insertConsulting.bo" method="post">
                    <table class="consulting_table table-borderless" style="width: 100%;">
                        <tr>
                            <th><h4>이름</h4></th>
                            <td>
                                <input type="text" class="form-control" placeholder="이름을 입력해주세요" required id="input_name" name="userName">
                            </td>
                        </tr>
                        <tr>
                            <th><h4>연락처</h4></th>
                            <td><input type="text" class="form-control" placeholder="전화번호(-포함해서 입력해주세요)" required id="input_phone" name="phone"></td>
                        </tr>
                        <tr>
                            <th><h4>상담분류</h4></th>
                            <td><select name="category" id="category" class="form-control">
                                <option value="select_consulting" selected>상담선택</option>
                                <option value="10">PT 문의</option>
                                <option value="20">이용 문의</option>
                                <option value="30">기타</option>
                            </select></td>
              
                        </tr>
                        <tr>
                            <th><h4>희망상담일</h4></th>
                            <td><input type="date" class="form-control" placeholder="xxxx-xx-xx(-포함하여 입력해주세요)" required id="input_date" name="adviceDate"></td>
                        </tr>
                        <tr>
                            <th><h4>상담내용</h4></th>
                            <td><textarea class="form-control" cols="30" rows="10" style="resize: none;" placeholder="내용을 입력해주세요" name="adviceContent"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" style="font-size: larger;">
                                <label style="display: flex; align-items: center; justify-content: center; text-align: center;">
                                <input type="checkbox" name="check_agreement" id="check_agreement" style="margin-right: 7px; width: 20px;">
                                [필수]개인정보 수집, 이용 동의
                                </label>
                            </td>
                        </tr>

                        <tr>
                            <th colspan="2" style="text-align: center; padding-top: 20px;">
                                <button type="submit" class="signup_btn" style="width: 200px; height: 50px; font-size: larger;">예약하기</button>
                            </th>
                        </tr>
                    </table>
                </form>

                <!-- 폼제출 유효성 검사_구성모-->
                <script>
                    $('form').submit(function(event) {
                    event.preventDefault(); // 기본 제출 동작 막기

                    var agreementChecked = $('#check_agreement').is(':checked');
                    if (!agreementChecked) {
                        alert("개인정보 수집, 이용에 동의해주세요.");
                        return;
                    }

                    var name = $('#input_name').val();
                    var phoneNumber = $('#input_phone').val();
                    var date = $('#input_date').val();

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

                    var selectedValue = document.getElementById("category").value;
                    if (selectedValue === "select_consulting") {
                    alert("상담을 선택하세요!");
                    return false; // 폼 제출을 막음
                    }

                    // 주민등록번호 유효성 검사: 6자리 숫자-7자리 숫자 형식
                    var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
                    if (!dateRegex.test(date)) {
                        alert("날짜입력형식이 올바르지 않습니다. 예) xxxx-xx-xx");
                        return;
                    }

                    this.submit();
                });
                </script>
            </div>

      </section>
      <!--section end-->
      
      <%@ include file="/views/common/Mzym_footer.jsp" %>
    </div>
</body>
</html>