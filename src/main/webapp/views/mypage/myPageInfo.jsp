<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.vo.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*side메뉴*/
.side_menu{
    float: left;
    flex-direction: column;
    background-color: #e0e0e0; 
    margin-top: 15px;    
    height: 1500px;
    width: 15%;
}

.user_data a{
    width: 140px;
    height: 40px;
    margin-top: 45px;
    margin-left: 15%;
}

.user_data:hover a {
font-weight: bold;
background: #1ABC9C; 
color: white;
}

/*마이페이지 style*/

.mypage_content{
    margin: auto;
    width: 80%;
}

.mypage_info{
 border: 2px solid #1ABC9C;
 width: calc(100% - 20%); 
 margin: auto;
 margin-bottom: 50px; /* Fix the duplicate margin property */
 margin-right: 50px;
 min-height: 200px;
 padding: 40px;
 border-radius: 10px;
}

.mypage_info button{
    width: 70px;
    font-weight: bold; 
    margin-left: 90%;
    margin-top: 15px;
    background: rgb(224, 224, 224);
    color: black;
    border-color: rgb(224, 224, 224);
}

.mypage_content h4 {  
padding-top: 50px;
margin-left: 230px;
}

.mypage_info i{
   font-size: 100px;
   margin-left: 60px;
}

.mypage_content input[type=radio]{margin: 10px;}
.mypage_content input[type=text]{margin: 5px; border: none;}
.modal-body input[type=text]{border: 1px solid lightgray;}

.etc_button button{
    margin-left: 10px;
    font-weight: bold;
    background: rgb(224, 224, 224);
    color: black;
    border-color: rgb(224, 224, 224);
}

.btn:hover{
    background: rgba(224, 224, 224, 0.842);
}

#btn_resign{
    margin-left: 700px;
    background: #1ABC9C;
    color: white;
    border: #1ABC9C;
    font-weight: bold;
}

#btn_resign:hover{
    background:#1abc9ce0;
    color: white;
}

/*모달 style*/
#btn1{
    background: #1ABC9C;
    color: white;
    font-weight: bold;
    border-radius: 5px;
    border: none;
    width: 90px;
    height: 38px;
}

#btn1:hover{
    background: #1ABC9C;
}

#btn2{
    background:#e0e0e0;
    color: black;
    font-weight: bold;
    border-radius: 5px;
    border: none;
    width: 90px;
    height: 38px;
}
.modal-body input[type=password]{margin: 5px;}
</style>
</head>
<body>

 <div class="wrap">
 	
 	 <%@ include file="/views/common/Mzym_header.jsp" %>

    <!--section start-->    
    <section class="main_content">
    
    	<%@ include file="/views/common/Mzym_sidebar.jsp" %>
		
		
        <!--side menu start-->
        <div class="side_menu">
            <h3 style="height: 40px; padding: 30px" align="center">My page</h3>
            <div class="user_data">
                <a href="" class="btn btn-light" style="font-weight: bold;">회원정보</a>
            </div>
            <div class="user_data">
                <a href="" class="btn btn-light" style="font-weight: bold;">나의 식단 정보</a>
            </div>
            <div class="user_data">
                <a href="" class="btn btn-light" style="font-weight: bold;">나의 인바디</a>
            </div>
            <div class="user_data">
                <a href="" class="btn btn-light" style="font-weight: bold;">나의 구매내역</a>
            </div>
        </div>
        <!--side menu end-->

        <div class="mypage_content">
            <form action="<%=contextPath%>/myPage.me" method="post">
                    <h4>기본정보</h4>
                        <div class="mypage_info">
                            <table style="width: 70%;">
                                <tr>
                                    <th rowspan="5"><i class="far fa-address-card"></i></th>
                                </tr>
                                <tr id="info">
                                    <th>아이디</th>
                                    <td><input type="text" readonly name="userId" value=""></td>
                                </tr>
                                <tr id="info">
                                    <th>이름</th>
                                    <td><input type="text" readonly name="userName" value="홍길동"></td>
                                </tr>
                                <tr id="info">
                                    <th>생년월일</th>
                                    <td><input type="text" readonly name="Birth" value="1999년 9월 13일"></td>
                                </tr>
                                <tr id="info">
                                    <th>성별</th>
                                    <td>
                                        <input type="text" name="gender" readonly value="남성">
                                    </td>
                                </tr>
                            </table>
                        </div>
                     
                    <h4>연락처정보</h4>                   
                        <div class="mypage_info">

                            <table style="width: 70%;">
                                <tr>
                                    <th rowspan="5"><i class="far fa-edit"></i></th>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" readonly name="email" value="user01@gmail.com"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" readonly name="phone" value="010-1111-2222"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input type="text" name="address" readonly value="서울시"></td>
                                </tr>                       
                             </table>

                             <div>
                                <button type="button" class="btn" data-toggle="modal" data-target="#changeInfoModal">수정</button>
                             </div>

                        </div>

                    <h4>나의이용권</h4>
                        <div class="mypage_info">
                            <table style="width: 70%;">
                                <tr>
                                    <th rowspan="5"><i class="fas fa-wallet"></i></th>
                                </tr>
                                <tr id="info">
                                    <th>헬스장 이용권</th>
                                    <td><input type="text" readonly value="24년 8월 22일 까지"></td>
                                </tr>
                                <tr id="info">
                                    <th>PT 이용권</th>
                                    <td><input type="text" readonly value="24년 3월 22일 까지"></td>
                                </tr>                      
                             </table>
                        </div>   

                <table class="etc_button">
                        
                    <tr>
                    <th><a href="<%=contextPath%>/delete.me" class="btn" id="btn_resign">회원탈퇴</a></th>
                    <th><button type="button" class="btn" data-toggle="modal" data-target="#changePwdModal">비밀번호변경</button></th>
                    </tr>  

                </table>
                     
            </form>
            
            <!-- 회원정보 모달창 -->
            <div class="modal" id="changeInfoModal">
                <div class="modal-dialog">
                    <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h3 class="modal-title" style="font-weight: bold;">회원수정</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                    	 <form action="<%= contextPath%>/update.me" method="post">
	                        <table align="center">
	                            <tr>
	                                <td><input type="text" class="form-control" name="newEmail" placeholder="이메일(@포함)"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="text" class="form-control" name="newPhone" placeholder="핸드폰번호(-포함)"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="text" class="form-control" name="newAddress" placeholder="주소"></td>
	                            </tr>
	                            <tr>
	                                <td colspan="2" style="text-align: center; padding-top: 10px;">
	                                    <button type="submit" id="btn1">수정</button>
	                                </td>
	                            </tr>
	                        </table>
                        </form>
                    </div>
                </div>
                </div>
            </div>

             <!-- 비밀번호 모달창 -->
             <div class="modal" id="changePwdModal">
                <div class="modal-dialog">
                    <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h3 class="modal-title" style="font-weight: bold;">비밀번호변경</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                   		 <form action="<%= contextPath%>/updatePwd.me" method="post">
	                        <table align="center">
	                            <tr>
	                                <td><input type="password" class="form-control" name="userPwd" placeholder="현재 비밀번호"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" class="form-control" name=newPwd placeholder="변경할 비밀번호"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" class="form-control" placeholder="변경할 비밀번호 재입력"></td>
	                            </tr>
	                            <tr>
	                                <td colspan="2" style="text-align: center; padding-top: 10px;">
	                                    <button type="button" data-dismiss="modal" id="btn2">취소</button>
	                                    <button type="submit" id="btn1">변경</button>
	                                </td>
	                            </tr>
	                        </table>
                         </form>
                    </div>
                </div>
                </div>
            </div>

        </div>
       

    </section>
    <!--section end-->
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>

</div>

</body>
</html>