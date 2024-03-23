<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인바디 페이지</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link href="/src/main/webapp/resources/css/leeyechan/trailnerLee.css" rel="stylesheet" type="text/css">
    <script src="/src/main/webapp/resources/js/trailnerLee.js" rel="javascript"></script>

	<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>

    <style>
        /* 인바디 추가 스타일 */
        .board-out>#inbody{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: block;
        }
        .section2{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .inbody{
            border: 2px solid #1abc9cc7;
            border-radius: 10px;
            margin: 10px;
            padding: 30px;
            /* display: flex;
            flex-direction: column; */
            width: 700px; 
            height: 500px;
        }
        .inbody table{
           margin: 0 auto;
           font-size: 20px;
        }
        .calory>*{
            margin-right: 20px;
            
        }
        #searchbtn{
	        border: none;
	        background: #1ABC9C;
	        color: white;
	        font-weight: bold;
        	border-radius: 5px;      	
        	width:60px;
	    }
	    /*
	    .section2 input[type="text"],
	    .section2 input[type="number"]{
	    	text-align : right;
	    } 
        */
        .inbody:hover {
		    /* hover 효과를 없애는 스타일 */
		    background-color: none;
		}

    </style>
</head>
<body>
		<%if(alertMsg != null){ %>
			<script>
				alert('<%=alertMsg%>');
			</script>
        <%
        	session.removeAttribute("alertMsg");
		} 
		%>

            <td class="section2" >
            <br>
                <div class="calory" >
                <form action="<%=contextPath%>/updateInbody.trainar" method="post">
                    <h4></h4>&nbsp;<input type="text" name="userPhone" style="width: 400px; text-align:left;" placeholder="회원의 전화번호를 입력해 주세요.">
                    <button type="button" id="searchbtn">검색</button>
                </div>
                <br>
                <div class="inbody">
                    <table>
                    	<tr>
                            <td width="150px">이름  </td>
                            <td><input type="text" name="userName" readonly></td>
                        </tr>
                        <tr>
                            <td width="150px">신장  </td>
                            <td><input type="text" name="height"> cm</td>
                        </tr>
                        <tr>
                            <td>체중  </td>
                            <td><input type="text" name="weight"> kg</td>
                        </tr>
                        <tr>
                            <td>기초대사량  </td>
                            <td><input type="text" name="metabolism"> kcal</td>
                        </tr> 
                        <tr>
                            <td>체지방량  </td>
                            <td><input type="text" name="fat"> bmi</td>
                        </tr>
                        <tr>
                        <!-- 
                            <td>등록일 </td>
                            <td><input type="date" name="registDate" style="margin-bottom: 10px;"></td>
                        </tr>
                         -->

                    </table>
                    <br>
                    <div style="display: flex; align-items: end;">
                        <button type="submit" class="btn btn-outline-success btn-sm" data-dismiss="modal" style="margin-right:6px">수정</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" id="deletebtn" data-toggle="modal" data-target="#deletModal" >삭제</button>
                    </div>
                </div>
		        </form>
            </td>
        
            <td class="section3"></td>
        <!-- tfoot : 페이징 바 및 작성 과 삭제 버튼 영역 -->
        <tfoot>
            <td class="section1" style="background-color: rgb(224, 224, 224);"></td>
            <td class="section2"></td>
            <td class="section3 "></td>
        </tfoot>
        <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->
   </table>


</body>

<!-- 삭제용 모달 -->
<div class="modal" id="deletModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">게시물 삭제</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body" style="text-align: center; font-size: 15px; ">
            게시물을 정말로 삭제 하시겠습니까?
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-outline-danger btn-sm" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>


	<script>
	
		// 회원의 인바디 조회 
		$("#searchbtn").on("click", function(){
			$.ajax({
				url: "<%=contextPath%>/inbody.trainar",
				data:{userPhone:$("input[name='userPhone']").val()},
				type:"get",
				success:function(ib){
					console.log(ib);
					
					$("#inbody input[name='userName']").val(ib.userName).prop("readonly",true);
					$("#inbody input[name='height']").val(ib.bodyHeight);
					$("#inbody input[name='weight']").val(ib.bodyWeight);
					$("#inbody input[name='metabolism']").val(ib.badyMetabolism);
					$("#inbody input[name='fat']").val(ib.bodyFat);
					//$("#inbody input[name='registDate']").val(ib.registDate);
					
					
				},
				error:function(){
					console.log("인바디 조회 ajax 통신 실패");
					alert("조회에 실패하였습니다.");
				}
			})
			
		})
		
		
		// 회원 인바디 삭제버튼 클릭시 나올 모달창
		$(document).ready(function(){
			$("#deletebtn").click(function(){
				$("#deletModal").modal("show");
			})
		});
		
		
		
		
		
	</script>





</html>