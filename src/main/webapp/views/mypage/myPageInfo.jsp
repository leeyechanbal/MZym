<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
	String birth = (String)request.getAttribute("birth");
	String gender = (String)request.getAttribute("gender");
	String health =(String)request.getAttribute("health");
	int PT = (int)request.getAttribute("PT");
	int ptNum = (int)request.getAttribute("ptNum");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/*마이페이지 style*/


.mypage_content{
    margin: auto;
    width: 75%;
}

.mypage_info{
 border: 2px solid #1ABC9C;
 width: calc(100% - 20%); 
 margin: auto;
 margin-bottom: 50px; /* Fix the duplicate margin property */
 margin-right: 50px;
 min-height: 200px;
 padding: 4%;
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

.etc_button{
	margin-left: 71%;
}

.btn:hover{
    background: rgba(224, 224, 224, 0.842);
}

#btn_resign{
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
	
        <%@ include file="/views/common/mypage_sidemenu.jsp" %>

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
                                    <td><input type="text" readonly name="userId" value="<%=loginUser.getUserId()%>"></td>
                                </tr>
                                <tr id="info">
                                    <th>이름</th>
                                    <td><input type="text" readonly name="userName" value="<%=loginUser.getUserName()%>"></td>
                                </tr>
                                <tr id="info">
                                    <th>생년월일</th>
                                    <td><input type="text" readonly name="birth" value="<%=birth%>"></td>
                                </tr>
                                <tr id="info">
                                    <th>성별</th>
                                    <td>
                                        <input type="text" name="gender" readonly value="<%=gender%>">
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
                                    <td><input type="text" readonly name="email" value="<%=loginUser.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" readonly name="phone" value="<%=loginUser.getPhone()%>"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input type="text" name="address" readonly value="<%=loginUser.getAddress()%>"></td>
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
                                    <% if(health == "") { %>
                                    <td><input type="text" name="health" readonly value="-"></td>
                                    <% } else {%>
                                    <td><input type="text" name="health" readonly value="<%=health%>까지"></td>
                                	<% } %>
                                </tr>
                              
	                                <tr id="info">
	                                    <th>PT 이용권</th>
	                                    <% if(PT == 0 && ptNum == 0) { %>
	                                     <td><input type="text" name="PT" readonly value="-"></td>
	                                    <% } else { %>
	                                    <td><input type="text" name="PT" readonly value="<%=ptNum%> / <%=PT%> 회"></td>
	                                	<% } %>
	                                </tr> 
                                              
                             </table>
                        </div>   

                <table class="etc_button">
                        
                    <tr>
                    <th><a href="<%=contextPath%>/deleteForm.me" class="btn" id="btn_resign">회원탈퇴</a></th>
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
                   		 <form id="myForm" action="<%= contextPath%>/updatePwd.me" method="post" onsubmit="return submitForm()">
	                        <table align="center">
	                            <tr>
	                                <td><input type="password" class="form-control" name="userPwd" placeholder="현재 비밀번호"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" class="form-control" name=newPwd placeholder="변경할 비밀번호"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="password" class="form-control" name="confirmPwd" placeholder="변경할 비밀번호 재입력"></td>
	                            </tr>
	                            <tr>
	                                <td colspan="2" style="text-align: center; padding-top: 10px;">
	                                    <button type="button" data-dismiss="modal" id="btn2">취소</button>
	                                    <button type="submit" id="btn1">변경</button>
	                                </td>
	                            </tr>
	                        </table>
                         </form>
                         
                         <script>
                         function submitForm() {

                        	var newPwd = document.getElementsByName("newPwd")[0].value;
                        	var userPwd = document.getElementsByName("userPwd")[0].value;
                        	var confirmPwd = document.getElementsByName("confirmPwd")[0].value;

                   	        console.log("변경할 비밀번호:", newPwd);
                   	        console.log("변경할 비밀번호 재입력:", confirmPwd);
                   	        
                   	        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
                            if (!passwordRegex.test(newPwd)) {
                                alert("비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
                                return false;
                            }
                            if (newPwd != confirmPwd) {
                                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                                return false;
                            }

                        	document.getElementById("myForm").submit();
                        }
                        </script>
                         
                        
                         
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