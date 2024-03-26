<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.serviceBoard.vo.ServiceBoard" %>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%
	String contextPath = request.getContextPath();
	List<ServiceBoard> list = (List<ServiceBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 센터 페이지</title>

	
   <%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>

    <style>
        /* 고객센터 추가적 스타일 */
        /* 공지사항이라는 위치를 알리기 위한 배경색 */
        .board-out>#customer{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: none;
        }
        .boardNav>.boardFree{
            background-color: rgba(26, 188, 156, 0.2);
        }
        /* 답변 작성 쪽 최소 높이 및 정렬 , 박스모양 */
        .repeat{
            border: 1px solid rgb(224, 224, 224);
            min-height: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        /* 글 내용 조회시 글자가 너무 작아서 글자 크기 변경 */
        p{
            font-size: 13px;
        }
        tfoot{
            height: 100px;
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
      
      
            <td class="section2">
                <div>
                    <table id="boardcontent" class="table">
                        <tr id="theader" style="background-color: rgb(224, 224, 224);">
                            <th class="table-number">번호</th>
                            <th>카테고리</th>
                            <th class="table-title">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>

					<%for(int i=0; i<list.size();i++){ 
                        ServiceBoard s = list.get(i);
                        %>
                        <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>">
                            <td class="table-number"><%=s.getServiceNo() %></td>
                            <td><%=list.get(i).getCategoryNo() %></td>
                            <td class="table-title"><%=list.get(i).getServiceTitle() %></td>
                            <td><%=list.get(i).getServiceUser() %></td>
                            <td><%=list.get(i).getRegistDate() %></td>
                        </tr>

                        <tr id="context<%=i%>" class="collapse">
                    <form action="<%=contextPath %>/updateServiceBoard.trainer" method="get" id="serviceList">
                            <td colspan="5">
                                <p style="min-height:150px; text-align: left; white-space: pre;" class="border rounded">
                                    <%=list.get(i).getServiceContent() %>
                                <hr>
                                <input type="hidden" name="no" value="<%=s.getServiceNo() %>">
                                <input type="hidden" name="confimeTR" value="<%=loginUser.getUserNo()%>">
                                <%if(list.get(i).getUpfileUrl() != null && list.get(i).getFileStatus().equals("Y")){ %>
	                                <div style="max-width:100%; height: auto; text-align: left;">
	                                	<a download="orginName" href="<%=contextPath + list.get(i).getUpfileUrl() %>" class="btn btn-outline-success">download</a>
	                                </div>
                                <%}else{ %>
                                	등록된 첨부파일이 없습니다.
                                <%} %>
                                <hr>
                                <div class="repeat border rounded mx-auto">
                                <!-- 
                                	내용 ㅇ => 내용을 보이게
                                	내용 X => 작성하면
                                 -->
                                <% if(list.get(i).getServiceRepeat() != null){ %>
                                 	<%
                                 	if(loginUser.getUserNo() == Integer.parseInt(s.getServiceTr())) {
                                 	%>
	                                    <div><b><%=trainerID %><br><!-- <%=list.get(i).getServiceTr()%> --></b></div>
	                                    <div style="width: 80%; display: flex;">
	                                    <input type="control" class="form-control" required name="repeat" value="<%=list.get(i).getServiceRepeat()%>" >
	                                    	                                 
	                                    <button  type="submit" class="btn btn-outline-warning btn-sm" style="margin-left: 70px;">수정</button>
	                                    </div>
	                                   
	                        			
                                	<%}else { %>
	                                	<div><b><%=trainerID %><br></b></div>
	                                    <div style="width: 80%;"><input type="control" class="form-control" required name="repeat" value="<%=list.get(i).getServiceRepeat() %>" readonly></div>
                                	<%} %>
                                	<%}else{ %>
	                                    <div><b><%=trainerID %><br><!-- <%=list.get(i).getServiceTr() %> --></b></div>
	                                    <input type="control" class="form-control" required name="repeat">
	                                    <button  type="submit" class="btn btn-outline-success btn-sm" style="margin-left: 70px;">등록</button>
                                	<% } %>
                                </div>
                            </td>
                    	</form>
                        </tr>
                    
                    <%} %>

                    </table>
                </div>
            </td>
            <td class="section3"></td>
        </tbody>

        <tfoot>
            <td class="section1" style="background-color: rgb(224, 224, 224);"></td>
            <td class="section2" id="paging" >
                <ul class="pagination" >
                	<%if(pi.getCurrentPage()==1){ %>
                    	<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/serviceBoardList.trainer?page=<%=pi.getCurrentPage()-1%>">이전</a></li>
                    <%} %>
                    
                    <%for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    <%if(p == pi.getCurrentPage()){ %>
                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
                    <%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/serviceBoardList.trainer?page=<%=p%>"><%= p %></a></li>
					<%} %>
					<%} %>
					
					<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item"><a class="page-link" href="#">다음</a></li>
                    <%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/serviceBoardList.trainer?page=<%=pi.getCurrentPage()+1%>">다음</a></li>
                    <%} %>
                </ul>
            </td>

			<td class="section3">
                <button type="button" class="btn btn-outline-danger btn-sm " data-toggle="modal" data-target="#deletModal" >삭제</button>
            </td>
        </tfoot>


<!-- 삭제용 모달 -->
<div class="modal" id="deletModal">
    <div class="modal-dialog">
      <div class="modal-content" style="border: 3px solid #1abc9cc7;">
  
        <!-- Modal Header -->
        <form action="">
        <div class="modal-header">
          <h3 class="modal-title">게시물 삭제</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body" style="text-align: center; font-size: 15px; ">
            게시물을 정말로 삭제 하시겠습니까?
        
        </div>
        <input type="hidden" name="no">
  
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-outline-danger btn-sm deletebtn">확인</button>
        </div>
        </form>
  
      </div>
    </div>
  </div>
  
		<script>
		  	$(document).ready(function(){
               
                $("#boardcontent tr").click(function(){
                    const num = $(this).children('.table-number').text();
                    console.log(num);
                    $('#deletModal').find('input[name=no]').val(num);

                })


                 $(".deletebtn").on("click",(function(){

                    $.ajax({
                        url:"<%=contextPath%>/deleteServiceBoard.trainer",
                        data:{no:$('#deletModal').find('input[name=no]').val()},
                        type:"get",
                        success:function(result){
                            console.log(result);
                            alert("게시글 삭제 완료되었습니다.");
                            location.href="/mzym/serviceBoardList.trainer?page=1";
                        },
                        error:function(){
                            console.log("문의글 삭제 ajax 통신 실패");
                            alert("게시글 삭제 실패");
                        }
                    })
                    
                 }))         

            })
		 </script>


  
</body>


</html>