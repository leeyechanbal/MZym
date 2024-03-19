<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.serviceBoard.vo.ServiceBoard"%>
<%@ page import="com.mzym.board.vo.Attachment"%>
<%@ page import="java.util.List"%>
<%
PageInfo pi = (PageInfo)request.getAttribute("pi");
List<ServiceBoard> list = (List<ServiceBoard>)request.getAttribute("list");
Attachment at = (Attachment)request.getAttribute("at");
String deleteBoard = request.getContextPath()+"/delete.serviceBoard";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
.center {
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Section 관련 스타일 */
.board_content {
	border: 1px solid #1abc9c;
	width: 80%;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
	min-height: 500px;
	padding: 50px;
	border-radius: 10px;
}

.sea {
	position: relative;
	width: 300px;
	float: left;
	margin-bottom: 30px;
}

input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

.sea img {
	position: absolute;
	width: 17px;
	top: 10px;
	right: 12px;
	margin: 0;
}

h2 {
	text-align: center;
}

.my.pagination>.active>a, .my.pagination>.active>span, .my.pagination>.active>a:hover,
	.my.pagination>.active>span:hover, .my.pagination>.active>a:focus, .my.pagination>.active>span:focus
	{
	background: #1abc9c;
	border-color: #1abc9c;
}

.page-link {
	color: #000;
	background-color: #fff;
	border: 1px solid #ccc;
}

.page-item.active .page-link {
	z-index: 1;
	font-weight: bold;
	background-color: #f1f1f1;
	border-color: #ccc;
}

hr {
	width: 200px;
	text-align: center;
}

.board-out>#board {
	background-color: rgba(26, 188, 156, 0.2);
}

.boardNav {
	display: block;
}

.boardNav>.boardFree {
	background-color: rgba(26, 188, 156, 0.2);
}
/* 답변 작성 쪽 최소 높이 및 정렬 , 박스모양 */
.repeat {
	border: 1px solid rgb(224, 224, 224);
	min-height: 50px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.repeat>* {
	margin: 0 5px;
}

.border {
	text-align: left;
	white-space: pre;
	overflow: auto;
	padding: 30px;
}

.buttonArea {
	display: flex;
	justify-content: flex-end;
}

.buttonArea button {
	margin: 10px;
}

.upfileArea {
	min-height: 200px;
	border-top: 2px solid #e0e0e0;
	border-bottom: 2px solid #e0e0e0;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/Mzym_header.jsp"%>


		<!-- Section start -->
		<section class="main_content">
			<%@ include file="/views/common/Mzym_sidebar.jsp"%>
			<div class="board_content">
				<h2>고객센터</h2>
				<hr>
				<br>
				<br>

				<!-- 현재 로그인된 상태일 경우 보여지는 요소 -->

				<div class="sea">
					<input type="text" placeholder="검색어를 입력하세요"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>


				<%if(loginUser != null){ %>
				<div align="right">
					<a href="<%=contextPath %>/enroll.service"
						class="btn btn-secondary">글쓰기</a> <br>
					<br>
				</div>
				<%} %>
				<br>
				<table class="table">
					<thead>
						<tr>
							<th width="150px">글번호</th>
							<th width="150px">카테고리</th>
							<th width="450px">글제목</th>
							<th width="150px">작성자</th>
							<th width="150px">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%if(list == null || list.isEmpty()){ %>
						<tr>
							<td colspan="5" style="text-align: center;">존재하는 게시글이 없습니다.</td>
						</tr>
						<%}else{ %>

						<!-- case2. 조회된 게시글이 있을 경우 -->
						<% int index = 0; %>
						<script>
    
					    function viewContent(index) {
					        var content = document.getElementById("content_" + index);
					        content.classList.toggle("collapse"); 
					    }
						</script>
						<%for(ServiceBoard sb : list){ %>
						<tr data-toggle="collapse" data-target="#context_<%= index %>">
							<td><%=sb.getServiceNo()%></td>
							<td><%=sb.getCategoryNo() %></td>
							<td style="cursor: pointer;" onclick="viewContent(<%= index %>)"><%=sb.getServiceTitle()%></td>
							<td><%=sb.getServiceUser() %></td>
							<td><%=sb.getRegistDate() %></td>

						</tr>
						<%if(loginUser !=null&& loginUser.getUserId().equals(sb.getServiceUser())){ %>

						<tr id="context_<%=index %>" class="collapse">
							<td colspan="5">
								<div class="border rounded">

									<%=sb.getServiceContent() %>

								</div>

								<div class="upfileArea ">
									
									<%if(sb.getUpfileUrl() != null){ %>
									<img src="<%= contextPath + "/" + sb.getUpfileUrl() %>"
										style="max-width: 100%; height: auto;"> <br> <a
										href="<%= contextPath + "/" + sb.getUpfileUrl() %>"
										download="<%= contextPath + "/" + sb.getUpfileUrl() %>">다운로드</a>
									<% }else{ %>
									첨부파일이 없습니다.
									<%} %>
									  
								</div>
								<div class="buttonArea">
									<a class="btn btn-outline-secondary btn-sm"
										style="margin-right: 20px;">수정</a> <a
										
										class="btn btn-outline-danger btn-sm"
										onclick="deleteService(<%= sb.getServiceNo() %>);">삭제</a>

								</div> <%if(sb.getServiceTr()!=null){ %>
								<div class="repeat border mx-auto">
									<div>
										<b>관리자 <%=sb.getServiceTr() %>
										</b>
									</div>
									<div style="width: 80%; max-height: 200px;"><%=sb.getServiceRepeat() %></div>

								</div> <%} %>
							</td>
						</tr>
						<% index++; %>
						<%} else { %>
						<tr id="context_<%=index %>" class="collapse">
							<td colspan="5">
								<div class="border rounded">
									<span>글 작성자만 볼 수 있습니다.</span>
								</div>
							</td>
						</tr>
						<% index++; %>
						<%} %>
						<%} %>
						<%} %>
					</tbody>
				</table>
				<script>
						  
						    function deleteService(serviceNo) {
						      
						        if (confirm('정말 삭제하시겠습니까?')) {
						            
						            $.ajax({
						            	url: "<%= deleteBoard %>",
						                type: "get", 
						                data: { "serviceNo": serviceNo }, 
						                success: function(response) {
						                	$("#row_" + serviceNo).remove();
						                    alert("삭제가 성공적으로 되었습니다."); 
						                    location.reload();
						                    
						                },
						                error: function() { 
						                    
						                    alert("글삭제에 실패했습니다."); 
						                }
						            });
						        }
						    }
						</script>




				<br>
				<!--  페이징바 영역 -->
				<ul class="pagination justify-content-center">
					<%if(pi.getCurrentPage()==1){ %>
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					<%}else{ %>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>/list.service?page=<%=pi.getCurrentPage()-1 %>">Previous</a></li>
					<%} %>
					<%for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
					<%if(p==pi.getCurrentPage()){ %>
					<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
					<%}else{%>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>/list.service?page=<%=p%>"><%=p %></a></li>
					<%} %>
					<%} %>


					<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>
					<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					<%}else{ %>
					<li class="page-item"><a class="page-link"
						href="<%=contextPath%>/list.service?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
					<%} %>
				</ul>
			</div>
		</section>
		<!-- Section end -->

		<%@ include file="/views/common/Mzym_footer.jsp"%>



	</div>
</body>
</html>