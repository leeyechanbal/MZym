<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
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
        padding: 20px;
    }
    .main_content>div{ /*메인 영역*/
        min-height: 500px;
        width: 1000px;
    }

    .main_header{
        width: 1000px;
        margin: auto;
    }

    .homePage_content {
      margin: auto;
      padding: 30px;
    }

    .homePage_content td {
        position: relative;
    }

    .homePage_content td input{
        height: 60px;
    }

    .findId_btn {
        background: #1ABC9C;
        border: solid #1ABC9C;
        color: white;
        border-radius: 7px;
        width: 200px; 
        height: 50px; 
        font-size: larger;
        line-height: 40px; /* 버튼의 높이에 맞춰 가운데 정렬 */
	    vertical-align: middle;
	    text-decoration: none; /* 링크 텍스트의 밑줄 제거 */
	    cursor: pointer; 
    }
    .findId_btn:hover{
        background: #19b192;;
        border: solid #19b192;
        color: white;
        text-decoration: none;
    }

    .table {
        border-collapse: separate;
        border-spacing: 0px 50px;
    }

    .modal-content {
      border: 3px solid #1ABC9C;
      width: 400px;
      height: 300px;
      margin: auto;
      padding: 30px;
    }

    </style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/Mzym_header.jsp" %>
		<div class="main_header">
	        <h1>아이디 찾기</h1>
	        <hr>
	        <h5>회원정보 입력</h5>
      	</div>
      	<section class="main_content">
          <!--메인 컨텐츠 내용 -->  
            <div class="homePage_content">
                <form id="myForm" action="" method="" style="width: 100%;">
                    <table class="table table-borderless">
                        <tr>
                            <td><input type="text" class="form-control" placeholder="이름" required id="input_name" name="userName"></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="전화번호(-포함해서 입력해주세요)" required id="input_phone" name="phone"></td>
                        </tr>
                        <tr>
                            <td><input type="email" class="form-control" placeholder="이메일" required id="input_email" name="email"></td>
                        </tr>

                        <tr>
                            <th style="text-align: center; padding-top: 20px;">
                                <button type="button" class="findId_btn" data-toggle="modal" id="submit_Btn">아이디찾기</button>
                            </th>
                        </tr>
                    </table>
                </form>
            </div>


           <!-- The Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 100%; padding: 0; overflow: visible !important;">
              <div class="modal-dialog modal-dialog-centered" role="document" style="position: absolute; bottom: 10%; left: 40%;">
                <div class="modal-content" style="width:350px">
                  <div style="text-align: center; padding-top: 10%;">
                   <p style="font-size: larger;" id="pFindId"></p>
                  </div>
                  <div style="width: 100%; padding-top: 10%; display: flex; justify-content: center;">
                    <a href="<%=contextPath %>/loginForm.me" type="button" class="findId_btn" style="width: 170px; text-align: center;">로그인하러 가기</a>
                  </div>
                </div>
              </div>
            </div>

      </section>
      <!--section end-->

      <script>
        $('#submit_Btn').click(function(event) {
            event.preventDefault(); // 기본 제출 동작을 막습니다.
            var name = $('#input_name').val();
            var phoneNumber = $('#input_phone').val();
            var input_email = $('#input_email').val();
            $.ajax({
                url:"<%=contextPath%>/findId.me",
                data:{
                    userName:name,
                    phone:phoneNumber,
                    email:input_email
                },
                type:"post",
                success:function(getId){
                	console.log(getId)
                    if(getId === ""){
                    	alert("입력하신 정보와 일치하는 아이디가 없습니다");
                    }else{
                    	let value = ""
                    	value = "안녕하세요 " + name +"님<br>회원님의 아이디는<br>" + getId +"입니다.";
                    	$("#pFindId").html(value);
                    	$('#myModal').modal('show');
                    }
                },error:function(){
                    console.log("아이디찾기 ajax통신 실패")
                }
            })
            
        });
      </script>

    	<%@ include file="/views/common/Mzym_footer.jsp" %>
    </div>
		
</body>
</html>