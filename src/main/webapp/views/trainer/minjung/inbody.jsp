<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
   String contextPath = request.getContextPath();
   String alertMsg = (String)session.getAttribute("alertMsg");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인바디 페이지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
      
      /* 등록 모달 스타일 */
      #insertContent{
        border: 2px solid rgba(26, 188, 156, 0.78);
        border-radius: 10px;
        padding: 10px;
        width : 550px;

         
        }
        .modal-body ul{
        list-style: none;
        padding-left: 1px ;       
        background-color: none;
        }
       /* li 요소에 hover 스타일이 없도록 재정의 */
       .modal-body ul li:hover {
           background-color: transparent !important; /* 배경색 투명으로 설정 */
           color: inherit !important; /* 글자색 상속 */
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
                <div class="calory" id="userInbodySelect" style="min-height: 80px;">
                <form action="<%=contextPath%>/updateInbody.trainar" method="post">
                    <h4></h4>&nbsp;<input type="text" name="userPhone" style="width: 400px; text-align:left;" placeholder="회원의 전화번호를 입력해 주세요.">
                    <button type="button" id="searchbtn">검색</button>
                </div>
                <br>
                <div class="inbody" id="userInbody">
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
                        <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#insertModal" style="margin-right:6px">등록</button>
                        <button type="submit" class="btn btn-outline-warning btn-sm" data-dismiss="modal" style="margin-right:6px">수정</button>
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


<!-- 등록용 모달 -->
<div class="modal" id="insertModal" >
    <div class="modal-dialog">
      <div class="modal-content" id="insertContent" style="border: 3px solid #1abc9cc7;">
        <!-- Modal Header -->
        <div class="modal-header" >
          <h4 class="modal-title">인바디 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body" style="font-size: 15px; ">
                <ul>
                    <li>
                        <label >이름</label> <br>
                        <input type="text" name="insertName" style="width: 325px; margin-bottom: 15px;" required> 
                    </li>
                    <li>
                        <label>전화번호</label> <br>
                        <input type="text" name="insertPhone" style="width: 325px; margin-bottom: 15px;" required placeholder=" ex) 010-xxxx-xxxx(-포함)">
                    </li>
                    <li>
                        <label>신장</label> <br>
                        <input type="text" name="insertHeight" style="width: 325px; margin-bottom: 15px;" required> cm

                    </li>
                    <li>
                        <label>체중</label> <br>
                        <input type="text" name="insertWeight" style="width: 325px; margin-bottom: 15px;" required> kg

                    </li>
                    <li>
                        <label>기초대사량</label> <br>
                        <input type="text" name="insertMetabolism" style="width: 325px; margin-bottom: 15px;" required> kcal

                    </li>
                    <li>
                        <label>체지방량</label> <br>
                        <input type="text" name="insertFat" style="width: 325px; margin-bottom: 15px;" required> bmi

                    </li>
                </ul>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="insertbtn"class="btn btn-outline-success btn-sm"data-dismiss="modal">등록</button>
                    </div>
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
               
               if(ib != null){
	               $("#userInbody input[name='userName']").val(ib.userName).prop("readonly",true);
	               $("#userInbody input[name='height']").val(ib.bodyHeight);
	               $("#userInbody input[name='weight']").val(ib.bodyWeight);
	               $("#userInbody input[name='metabolism']").val(ib.badyMetabolism);
	               $("#userInbody input[name='fat']").val(ib.bodyFat);
	               //$("#inbody input[name='registDate']").val(ib.registDate);
               }else{
            	   $("#userInbody input[name='userName']").val("-");
            	   $("#userInbody input[name='height']").val(0);
	               $("#userInbody input[name='weight']").val(0);
	               $("#userInbody input[name='metabolism']").val(0);
	               $("#userInbody input[name='fat']").val(0);
            	   
               }
               
               
            },
            error:function(){
               console.log("인바디 조회 ajax 통신 실패");
               alert("조회에 실패하였습니다.");
            }
         })
         
      })
      
      
      // 회원 인바디 등록
      $("#insertbtn").on("click", function(){
         $.ajax({
            url:"<%=contextPath%>/insertInbody.trainar",
            data:{
               insertName:$("input[name='insertName']").val(),
               insertPhone:$("input[name='insertPhone']").val(),
               insertHeight:$("input[name='insertHeight']").val(),
               insertWeight:$("input[name='insertWeight']").val(),
               insertMetabolism:$("input[name='insertMetabolism']").val(),
               insertFat:$("input[name='insertFat']").val()
            },
            type:"post",
            success:function(result){
               console.log(result);               
               alert("성공적으로 등록 되었습니다.");
            },
            error:function(){
               console.log("인바디 등록 ajax통신 실패");
               alert("등록에 실패하였습니다. 입력하신 정보를 다시 확인해주세요.");
            }
         })
      })
      

      
      
      
      
   </script>

</body>







</html>