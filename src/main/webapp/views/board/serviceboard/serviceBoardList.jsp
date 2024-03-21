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
.hideContent{
	    min-height: 150px;
    /* text-align: left; */
    /* white-space: pre; */
    overflow: auto;
    text-align: center;
    /* margin: auto; */
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
	

.sea img {
             position : absolute;
             width: 18px;
             top: 14px;
             right: 12px;
              margin: 0;
        }
        
input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

h2 {
	text-align: center;
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

border rounded>span {
	display: flex;
	align-items: center;
	justify-content: center;
}
/* 답변 작성 쪽 최소 높이 및 정렬 , 박스모양 */
.repeat {
	border: 1px solid rgb(224, 224, 224);
	min-height: 50px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.repeat b {
	display: inline-flex;
	justify-content: center;
	align-items: center;
}

.repeat>* {
	margin: 0 5px;
}

.border {
	min-height: 250px;
	
	overflow: auto;
}

.buttonArea {
	display: flex;
	justify-content: flex-end;
	margin: 20px;
}
.fileimgarea{
	width: 120px;
}

.buttonArea > *{
	width: 70px; 
	height: 30px;
	text-align: center;
}

.upfileArea {
	min-height: 200px;
	border-top: 2px solid #e0e0e0;
	border-bottom: 2px solid #e0e0e0;
	margin: 20px;
}
.upNewfileArea{
	min-height: 200px;
	border-top: 2px solid #e0e0e0;
	border-bottom: 2px solid #e0e0e0;
	margin: 20px;
}
.borderDetailcontent {
	margin: 20px;
	text-align: left;
}
.my.pagination > .active > a, 
 .my.pagination > .active > span, 
 .my.pagination > .active > a:hover, 
 .my.pagination > .active > span:hover, 
 .my.pagination > .active > a:focus, 
 .my.pagination > .active > span:focus {
     background: #1abc9c;
     border-color: #1abc9c;
 }
 
 .page-item a.page-link {
 color: #1abc9c;
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
				<br> <br>

				<!-- 현재 로그인된 상태일 경우 보여지는 요소 -->
				<%if(loginUser != null){ %>
				<div class="sea">
					<form action="<%=contextPath %>/search.me" method="get" onsubmit="return enterForm();">
					<div class="sea">
               		<input type="search" placeholder="검색어를 입력하세요" name="keyword" id="keyword">
                	<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            		</div>
					
					</form>
				</div>
				<%} %>
				<script>
				    function enterForm() {
				    	
				        var keyword = document.getElementById("keyword").value;
				        console.log(keyword);
				        if (keyword === "") {
				            alert("검색어를 입력해주세요.");
				            return false; 
				        }
				        //return true;
				   	  }
				</script>	

				<%if(loginUser != null){ %>
				<div align="right">
					<a href="<%=contextPath %>/enroll.service"
						class="btn btn-secondary">글쓰기</a> <br> <br>
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
						    if(content) {
						        content.classList.toggle("collapse"); 
						    }
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
								<form action="<%=contextPath %>/update.sev" method="post" enctype="multipart/form-data">
									<input type ="hidden" name="serviceNo" value="<%=sb.getServiceNo()%>">
									<div class="border rounded contentDiv">
										<div class="borderDetailcontent" id="detailcontent">
											<%=sb.getServiceContent() %>
										</div>

										<textarea class="contentTextarea summernote" style="display: none" name="newcontent"><%=sb.getServiceContent() %></textarea>
										
										<div class="upfileArea ">

										<%if(sb.getUpfileUrl() != null){ %>
										<div class=fileimgarea>
										<img src="<%= contextPath + "/" + sb.getUpfileUrl() %>"
											style="max-width: 100%; height: auto;"> 
										</div>	
										<a href="<%= contextPath + "/" + sb.getUpfileUrl() %>" download="<%= contextPath + "/" + sb.getUpfileUrl() %>" class="btn btn-outline-secondary btn-sm" style="float: right;">다운로드</a>
										<% }else{ %>
										첨부파일이 없습니다.
										<%} %>

										</div>
									
									<div class="upNewfileArea ">

										<%if(sb.getUpfileUrl() != null){ %>
										<div class=fileimgarea>
										<img src="<%= contextPath + "/" + sb.getUpfileUrl() %>"
											style="max-width: 100%; height: auto;"> 
										</div>	<a href="<%= contextPath + "/" + sb.getUpfileUrl() %>" download="<%= contextPath + "/" + sb.getUpfileUrl() %>" class="btn btn-outline-secondary btn-sm" style="float: right;">다운로드</a>
										<% }else{ %>
										첨부파일이 없습니다. 추가 하시겠습니까??
										
										<input type="file" value="파일추가">
										<%} %>

									</div>
									
									</div>

									
									<div class="buttonArea">

										<button type="button" class="btn btn-outline-secondary btn-sm updateBtn"
											style="margin-right: 20px;">수정</button>

										<a class="btn btn-outline-danger btn-sm"
											onclick="deleteService(<%= sb.getServiceNo() %>);">삭제</a>

									</div>
									<%if(sb.getServiceTr()!=null){ %>
									<div class="repeat border mx-auto">
										<div>
											<b>관리자 <%=sb.getServiceTr() %>
											</b>
										</div>
										<div style="width: 80%; max-height: 200px;"><%=sb.getServiceRepeat() %>
										</div>

									</div>
									<%} %>
								</form>
							</td>
						</tr>
						<% index++; %>
						<% } else { %>
						<tr id="context_<%=index %>" class="collapse">
							<td colspan="5">
								<div class="hideContent">
									<span>글 작성자만 볼 수 있습니다.</span>
								</div>
							</td>
						</tr>
						<%  index++; %>
						<%} %>
						<%} %>
						<%} %>
					</tbody>
				</table>

				<script>
				
				$(document).ready(function () {
			        $('.summernote').summernote({
			            placeholder: '내용을 작성하세요',
			            height: 400,
			            maxHeight: 400
			        });
			        
			        $('.note-editor').hide();
			        $('.upNewfileArea').hide();
			        $(document).on("click", '.updateBtn', function(){
			        
			        	$(this).parent().siblings(".contentDiv").children(".borderDetailcontent").hide();
			        	$(this).parent().siblings(".contentDiv").children(".note-editor").show();
			    		$(this).parent().siblings(".contentDiv").children(".upfileArea").hide();
			    		$(this).parent().siblings(".contentDiv").children(".upNewfileArea").show();
			        	
			        	$(this).html("저장");
			        	$(this).attr("type", "submit");
			        	$(this).removeClass("updateBtn");
			        	return false;
			        })
			        
			        
			    });
						  
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