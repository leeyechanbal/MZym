<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
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

    <style>
        /* 인바디 추가 스타일 */
        .board-out>#inbody{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: none;
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
           margin: 90px;
           font-size: 20px;
        }
        .calory>*{
            margin-right: 50px;
        }

    </style>
</head>
<body>

   <table id="outTable">
        
        <thead class="">
            <td class="section1" id="back"><img src="/src/main/webapp/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></td>
            <td class="section2" id="logo"><img src="/src/main/webapp/resources/img/icon/logo-sm-170x100.png" alt="로고"></td>
            <td class="section3"></td>
        </thead>
        
        <tr style="height: 30px;"></tr>

        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br>xxx</div>
                <div class="board-out">
                    <div id="board">게시판</div>

                    <div class="boardNav" style="margin-top: 0px;">
                        <div class="boardNotice"><a href="">공지사항</a></div>
                        <div class="boardFree"><a href="">자유게시판</a></div>
                        <div class="boardQuestion"><a href="">질문게시판</a></div>
                        <div class="boardReview"><a href="">PT 및 헬스장 후기</a></div>
                        <div class="boardClass"><a href="">운동 모임</a></div>
                    </div>

                    <div id="counseling"><a href="">상담예약</a></div>
                    <div id="customer"><a href="">고객센터</a></div>
                    <div id="accusation"><a href="">신고</a></div>
                    <div class="suteOption" style="margin-top: 0;">
                        <div class="suteBoard"><a href="">게시글</a></div>
                        <div class="suteRrepeat"><a href="">답글</a></div>
                    </div>

                    <div id="inbody"><a href="">인바디</a></div>

                </div>
            </td>

            <td class="section2">
                <div class="calory">
                    <h4>검색: </h4>&nbsp;<input type="tel" style="width: 400px;" placeholder="회원의 전화번호를 입력해 주세요.">
                    <button >검색</button>
                </div>
                <div class="inbody">
                    <table>
                        <tr>
                            <td width="150px">신장  </td>
                            <td><input type="number" style="margin-bottom: 10px;"> cm</td>
                        </tr>
                        <tr>
                            <td>체중  </td>
                            <td><input type="number" style="margin-bottom: 10px;"> kg</td>
                        </tr>
                        <tr>
                            <td>기초대사량  </td>
                            <td><input type="number" style="margin-bottom: 10px;"> kcal</td>
                        </tr> 
                        <tr>
                            <td>체지방량  </td>
                            <td><input type="number" style="margin-bottom: 10px;"> bmi</td>
                        </tr>
                        <tr>
                            <td>등록일 </td>
                            <td><input type="date" style="margin-bottom: 10px;"></td>
                        </tr>
                    </table>
                    <div style="display: flex; align-items: end;">
                        <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">확인</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
                    </div>
                </div>
            </td>
        </form>
            <td class="section3"></td>
        </tbody>
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






</html>