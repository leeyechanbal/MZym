<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        
        <tr style="height: 30px;"></tr>

        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br>xxx</div>
                <div class="board-out">
                    <div id="board">게시판</div>

                    <div class="boardNav" style="margin-top: 0px;">
                        <div class="boardNotice"><a href="<%=mzymPath%>/board.trainer>">공지사항</a></div>
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

					
					<%for(int i= 0; i<list.size(); i++){ %>
                    <form action="<%=mzymPath %>/update.change" method="post">
                        <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>"> <!--반복문 !! -->
                            <td class="table-number" name=""><%=list.get(i).getNoticeNo()%></td>
                            <td class="table-title" name=""><%=list.get(i).getTitle()%></td>
                            <td name=""><%=list.get(i).getWriterName()%></td>
                            <%-- <% System.out.println(list.get(i).getWriterName());%> --%>
                            <td name=""><%=list.get(i).getRegistDate()%></td>
                        </tr>

                        <tr id="context<%=i%>" class="collapse">
                            <td colspan="5">
                                <div>
                                    <p class="border"><%=list.get(i).getContent()%></p>
                                    <div><img src="" alt="첨부파일 미리보기"></div>
                                    <div class="formOut">
                                        <input type="file" name="">
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
	                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
	
	                    <li class="page-item active"><a class="page-link" href="<%=mzymPath%>/paging.trainer?page=1&board=notice">1</a></li>
	                    <li class="page-item"><a class="page-link" href="#">2</a></li>
	                    <li class="page-item"><a class="page-link" href="#">3</a></li>
	
	                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
	                </ul>
	            </td>
            
            <td class="section3 ">
                <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal">작성</button>
                <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
            </td>
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

  
<!-- 작성용 모달 -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-create">
            <form action="">
                <!-- Modal Header -->
                <div class="modal-header-create">
                <h3 class="modal-title text-center" id="creat-modal-header">공지사항</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <br>
                <!-- Modal body -->
                <div class="modal-body-create">
                <div class="hair-careate"><input type="text" placeholder="제목 입력"></div>
                <hr>
                <div class="bottom-create"><textarea name="" cols="30"  rows="20" placeholder="글입력" style="resize: none;"></textarea></div>
                <!-- 큰모달창 일 경우 cols="55" -->
                <hr>
                <div class="file-create"><input type="file"></div>
                <br>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">작성</button>
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
      </div>
    </div>
  </div>


</body>
</html>