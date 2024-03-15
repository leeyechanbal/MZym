<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 알림창 넣는데 밑에 두면 옆에 매뉴 바의 display가 none처리 되버려요. -->
<%@ include file="/views/trainer/Leeyechan/trainerFilter.jsp" %>

<%@ page import="com.mzym.board.vo.Notice" %>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="java.util.List"%>
<%
	PageInfo info = (PageInfo)request.getAttribute("info");
	List<Notice> list = (List<Notice>)request.getAttribute("list");	
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지사항</title>

<style>
         /* 공지사항 추가 스타일 */
         .board-out>#board{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: block;
        }
        .boardNav>.boardNotice{
            background-color: rgba(26, 188, 156, 0.2);
        }
        /* 공지사항 첨부파일 정렬 */
        .formOut{
            display: flex; 
            justify-content: space-between;
        }
        tfoot{
            height: 100px;
        }
 </style>

</head>
<body>       
		
		<table id="outTable">
        
        <thead>
            <td class="section1" id="back" onclick="history.back();"><img src="<%=mzymPath %>/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></td>
            <td class="section2" id="logo"><img src="<%=mzymPath %>/resources/img/icon/logo-sm-170x100.png" alt="로고"></td>
            <td class="section3"></td>
        </thead>
		
		
        <tr style="height: 30px;"></tr>
		
        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br>xxx</div>
                <div class="board-out">
                    <div id="board">게시판</div>

                    <div class="boardNav" style="margin-top: 0px;">
                        <div class="boardNotice"><a href="<%=mzymPath%>/listNotice.trainer?page=1">공지사항</a></div>
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

                    <div id="calory"><a href="">인바디</a></div>

                </div>
            </td>

            <td class="section2">
                <div>
                    <table id="boardcontent" class="table">
                        <tr id="theader" style="background-color: rgb(224, 224, 224);">
                            <th class="table-number">번호</th>
                            <th class="table-title">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>

					
					<%for(int i= 0; i < list.size(); i++){ %>
                    <form action="" method="post">
                        <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>">
                            <td class="table-number" name=""><%=list.get(i).getNoticeNo()%></td>
                            <td class="table-title" name=""><%=list.get(i).getTitle()%></td>
                            <td name=""><%=list.get(i).getWriterName()%></td>
                            <td name=""><%=list.get(i).getRegistDate()%></td>
                        </tr>

                        <tr id="context<%=i%>" class="collapse">
                            <td colspan="5">
                                <div>
                                    <p class="border"><%=list.get(i).getContent()%></p>
                                    <div class="formOut">
                                        <input type="file" name="file">
                                        <button type="submit" class="btn btn-outline-warning btn-sm">수정</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </form>
                    <%} %>


                    </table>
                </div>
            </td>
            <td class="section3"></td>
        </tbody>
        <!-- tfoot : 페이징 바 및 작성 과 삭제 버튼 영역 -->
        <tfoot>
               <td class="section1" style="background-color: rgb(224, 224, 224);"></td>
               
               
	           <td class="section2" id="paging" >
	                <ul class="pagination" >
	                <!-- 현재 페이지가 1인 경우 이전 버튼이 작동하지 않도록 -->
	           		<% if (info.getCurrentPage() == 1) {%>
	                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					<% } else {%>
	                    <li class="page-item"><a class="page-link" href=<%=mzymPath + "/listNotice.trainer?page=" + (info.getCurrentPage()- 1) %>>이전</a></li>
					<%} %>
					
					<!-- 페이징바 숫자 부분 -->
					<% for (int i= info.getStartPage(); i <= info.getEndPage(); i++){ %>
						<!-- 
							페이징바의 현재 숫자가 총 페이징 수보다 작으면 이동 가능한 페이지를
							페이지의 총 수보다 클 경우는 페이징 이동이 불가능하게 구현
							(info.getCurrentPage() <= info.getMaxPage())
							!(info.getCurrentPage() >= info.getMaxPage())
							하는 같은 경우를 제외 하고 하나는 같은 경우를 포함
						 -->
						<%if((info.getCurrentPage() <= info.getMaxPage())) {%>					
							<!-- 사용자의 요청 페이지와 반복문의 숫자가 같은 경우 active 속성 -->
							<% if(info.getCurrentPage() == i){ %>
		                    <li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
		                    <%} else if (i <= info.getMaxPage()) { %>
		                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/listNotice.trainer?page=" + i%>"><%=i%></a></li>
		                    <%}else { %>
		                    <li class="page-item disabled"><a class="page-link" href="#"><%=i%></a></li>
		                    <%} %>
	                    <%} %>
					<%} %>
					
					<!-- 현재의 페이징바가 총 페이징 바의 수 보다 클 경우 다음으로 안 넘어가도록  -->
					<% if(info.getCurrentPage() >= info.getMaxPage()) {%>						
	                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                   	<%} else { %> 
	                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/listNotice.trainer?page=" + (info.getCurrentPage()+ 1) %>">다음</a></li>
                    <%} %>
	                </ul>
	                
	            </td>
            
            <td class="section3 ">
                <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal">작성</button>
                <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
            </td>
        </tfoot>
        <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->
   </table>
	
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

  
<!-- 작성용 모달 -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-create">
                <!-- Modal Header -->
                <div class="modal-header-create">
                <br>
                <h3 class="modal-title text-center" id="creat-modal-header">공지사항</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <br>
                <form action="<%=mzymPath%>/insertNotice.trainer" method="post" enctype="multipart/form-data">
	                <!-- Modal body -->
	                <div class="modal-body-create">
	                    <div class="hair-careate"><input name='title' type="text" placeholder="제목 입력"></div>
	                    <hr>
	                    <div class="bottom-create"><textarea name="content" cols="30"  rows="20" placeholder="글입력" style="resize: none;"></textarea></div>
	                <!-- 큰모달창 일 경우 cols="55" -->
	                    <hr>
	                    <div class="formOut">
	                        <input name="file" type="file">
	                    </div>
	                </div>
	                <br>
	        
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                <!-- data-dismiss="modal" : 요청이 가기도 전에 모달을 닫아버려서 요청이 가지를 않는다. -->
	                    <button type="submit" class="btn btn-outline-success btn-sm">작성</button>
	                    <button type="submit" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
	                </div>
                </form>       
        </div>
      </div>
    </div>
  </div>
	
	
   
</body>

</html>