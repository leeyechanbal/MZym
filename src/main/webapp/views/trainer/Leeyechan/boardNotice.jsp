<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.board.vo.Notice" %>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.board.vo.Attachment" %>
<%@ page import="java.util.List"%>
<%
	PageInfo info = (PageInfo)request.getAttribute("info");
	List<Notice> list = (List<Notice>)request.getAttribute("list");	
%>
<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>
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
       /* 파일 쪽 스타일 */
       .file{
            display: flex;
            align-items: start;
            flex-direction: column;
        }
        .file>*{  
            margin-bottom: 5px;      	
        }

        
 </style>

</head>
<body>       
			
            <td class="section2">
                <div>
                    <table id="boardcontent" class="table">
                        <tr id="theader" style="background-color: rgb(224, 224, 224);">
                            <th class="table-number">번호</th>
                            <th class="table-title">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>

					
					<%for(int i= 0; i < list.size(); i++){ 
						Attachment att = list.get(i).getAtt();
						boolean nChecked = att == null;
						String originName = nChecked ?  null : att.getOriginName();
					%>
					<!-- 추후 세션값에서 &noticeWriter=로그인된 트레이너아이돌 바꿀꺼임 -->
                        <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>">
                            <td class="table-number"><%=list.get(i).getNoticeNo()%></td>
                            <td class="table-title"><%=list.get(i).getTitle()%></td>
                            <td><%=list.get(i).getWriterName()%></td>
                            <td><%=list.get(i).getRegistDate()%></td>
                        </tr>


                        <tr id="context<%=i%>" class="collapse">
                            <td colspan="5">
                   				<form action="<%=mzymPath%>/updateNotice.trainer" method="post" enctype="multipart/form-data">
                                <div>
                                    <textarea class="border" style="padding: 10px;" name="noticeContent"><%=list.get(i).getContent()%></textarea>
                                    <div class="formOut">
                                    	<div class="file">
                                    	<% if(nChecked) { %>
                                         	<div>다운로드: "현재 첨부파일이 없습니다."</div>
                                         	
                                         <%} else { %>
                                            <div>다운로드: <a download="<%=originName%>" href="<%=mzymPath + "/" + att.getFilePath() + att.getChangeName()%>"><%=originName%></a></div>
                                           	<input type="hidden" name="wasOriginName" value="<%=att.getOriginName()%>">
                                            <input type="hidden" id="change" name="wasChangeName" value="<%=att.getChangeName()%>">
                                         <%} %>
                                          	<input type="hidden" name="noticeNo" value="<%=list.get(i).getNoticeNo()%>">
                                            <input type="hidden" name="noticeTitle" value="<%=list.get(i).getTitle()%>">
                                         	<div>수정: <input type="file" name="file"></div>
                                        </div>
                                        <div style="align-self: self-end;">
                                        	<button type="submit" class="btn btn-outline-warning btn-sm">수정</button>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </td>
                        </tr>
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
	<Script>
		$(function(){
	        $("#boardcontent tr").click(function(){
	            const boardNo = $(this).children(".table-number").text();
	            /* console.log(boardNo); */
	            $("#deletModal").find("#boardNum").val(boardNo);
	            
	            const changeName = $(this).next().find("#change").val();            
				/* console.log(changeName) */
	            $("#deletModal").find("#fileName").val(changeName);
	             
	        })
	    })
    </Script>
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
    <form action="<%=mzymPath%>/deletedNotice.traniner" method="get">
        <div class="modal-body" style="text-align: center; font-size: 15px; ">
            게시물을 정말로 삭제 하시겠습니까?
        </div>
        <input type="hidden" id="boardNum" name="boardNum">
        <input type="hidden" id="fileName" name="fileName">
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
        </div>
    </form>
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