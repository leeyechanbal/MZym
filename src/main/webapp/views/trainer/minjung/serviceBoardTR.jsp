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

					<%for(int i=0; i<list.size();i++){ %>
                    <form action="<%=contextPath %>/updateServiceBoard.trainer?no=<%=list.get(i).getServiceNo() %>" method="post" id="serviceList">
                        <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>">
                            <td class="table-number"><%=list.get(i).getServiceNo() %></td>
                            <td name=""><%=list.get(i).getCategoryNo() %></td>
                            <td class="table-title"><%=list.get(i).getServiceTitle() %></td>
                            <td name=""><%=list.get(i).getServiceUser() %></td>
                            <td><%=list.get(i).getRegistDate() %></td>
                        </tr>

                        <tr id="context<%=i%>" class="collapse">
                            <td colspan="5">
                                <p style="min-height:150px; text-align: left; white-space: pre;" class="border rounded">
                                    <%=list.get(i).getServiceContent() %>
                                <hr>
                                <%if(list.get(i).getUpfileUrl() != null && !list.get(i).getFileStatus().equals("N")){ %>
	                                <div>
	                                	<img src="<%=contextPath + "/" + list.get(i).getUpfileUrl() %>" style="max-width:100%; height: auto;">
	                                </div>
                                <input type="file">
                                <%}else{ %>
                                	등록된 첨부파일이 없습니다.
                                <%} %>
                                <hr>
                                <div class="repeat border rounded mx-auto">
                                 	<%
                                 		int serviceTr = 0;
                                 		serviceTr = Integer.parseInt(String.valueOf(list.get(i).getServiceTr()));
                                    
                                    if(loginUser.getUserNo() == serviceTr){ %>
	                                    <div><b>관리자<br><%=list.get(i).getServiceTr() %></b></div>
	                                    <div style="width: 80%;"><input type="control" class="form-control" required name="repeat" value="<%=list.get(i).getServiceRepeat() %>"></div>
	                                    <button  type="submit" class="btn btn-outline-success btn-sm">답변</button>
	                        			<button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
                                	<%}else { %>
	                                	<div><b>관리자<br><%=list.get(i).getServiceTr() %></b></div>
	                                    <div style="width: 80%;"><input type="control" class="form-control" required name="repeat" value="<%=list.get(i).getServiceRepeat() %>" readonly></div>
                                	<%} %>
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
                    	<li class="page-item active"><a class="page-link" href="<%=contextPath%>/serviceBoardList.trainer?page=<%=p%>"><%= p %></a></li>
					<%} %>
					<%} %>
					
					<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item"><a class="page-link" href="#">다음</a></li>
                    <%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/serviceBoardList.trainer?page=<%=pi.getCurrentPage()+1%>">다음</a></li>
                    <%} %>
                </ul>
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
        <input type="text" class="">
  
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
		  		
		  		$(".deletebtn").on("click",function(){
		  			
		  			const boardNo = $(".tr-title");
		  		 
		  			
		  			console.log(boardNo);
		  			
		  			/*
		  			$.ajax({
		  				url:"<%=contextPath%>/deleteServiceBoard.trainer",
		  				data:{no:$(this).closest("form").find(".table-number").text()},
		  				type:"get",
		  				success:function(result){
		  					console.log(result);
		  					alert("게시글 삭제 완료되었습니다.");
		  				},
		  				error:function(){
		  					console.log("문의글 삭제 ajax 통신 실패");
		  					alert("게시글 삭제 실패");
		  				}
		  			})
		  			*/
		  		})
		  	})	
		 </script>


  
  
</body>


</html>