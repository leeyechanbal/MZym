<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mzym.common.paging.PageInfo"%>
<%@ page import="com.mzym.board.vo.Advice"%>

<%
	PageInfo infoY = (PageInfo)request.getAttribute("infoY");
	List<Advice> listY = (List<Advice>)request.getAttribute("listY");
	PageInfo infoN = (PageInfo)request.getAttribute("infoN");
	List<Advice> listN = (List<Advice>)request.getAttribute("listN");
%>

<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 상담예약 추가 스타일 */
.board-out>#counseling {
	background-color: rgba(26, 188, 156, 0.2);
}

.boardNav {
	display: none;
}

/* 테이블 변경 및 추가 사항 */
/* 이름 및 날짜 가로 길이 */
#boardcontent {
	width: 450px;
}

.table-name, .table-date {
	width: 100px;
}

.section2>div {
	display: flex;
	justify-content: space-around;
}

tfoot {
	height: 100px;
}
.border{
    white-space: normal;
}
/* .detail{
	border: 1px solid;
} */
/* legend{
	margin-left: 25px;
} */
.buttonLo{
    text-align: right;
}
</style>

</head>
<body>

	<td class="section2">
		<div style="min-height: 50px;">
			<h3>상담완료</h3>
			<h3>상담대기</h3>
		</div>

		<div class="section2-table">
			<div>
				<table id="boardcontent" class="table">
					<tr id="theader" style="background-color: rgb(224, 224, 224);">
						<th class="table-number">번호</th>
						<th class="table-name">이름</th>
						<th class="table-date">날짜</th>
					</tr>

					<!--반복문 !! -->
					<% for (int i =0; i < listY.size(); i++){ 
						Advice ad = listY.get(i);
					%>
					<tr class="tr-title" data-toggle="collapse"data-target="#complete<%=i%>">
						<td class="table-number"><%=ad.getAdviceNo()%></td>
						<td class="table-name"><%=ad.getAdviceName() %></td>
						<td class="table-date"><%=ad.getRegist() %></td>
						<!-- 등록일을 수정일로 사용 하겠음 -->
					</tr>

					<tr id="complete<%=i %>" class="collapse">
						<td colspan="3" align="left" class="border"
							style="font-size: 15px;">
							<fieldset class="detail">
								<legend>세부사항</legend>
								<ul>
									<li>핸드폰 번호: <%=ad.getPhone()%></li>
									<li>분류: <%=ad.getCategoryName() %></li>
									<li>신청 날짜: <%=ad.getAdviceDate()%></li>
									<li>담당자: <%=ad.getTrainerId() %></li>
									<li>상담 완료일: <%=ad.getModifyDate() %></li>
								</ul>
							</fieldset> <br>
					<form action="<%=mzymPath %>/turnAdvice.trainer" method="post">
							<fieldset>
								<legend><u>신청내용</u></legend>
<textarea style="padding: 10px; resize: none;" cols="57" rows="5" readonly><%=ad.getAdviceContent()%></textarea>
								<h4><u>보고서</u></h4>
								<%if(ad.getRepeat() != null){ %>
									<%if(ad.getTrainerId().equals(trainerID)){ %>
<textarea cols="57" rows="5" style="resize: none; padding: 10px;" name="repeat"><%=ad.getRepeat()%></textarea>									
									<%} else { %>
<textarea cols="57" rows="5" style="resize: none; padding: 10px;"readonly><%=ad.getRepeat()%></textarea>									
									<%} %>
								<%} else {%>
								<div>조회되는 데이터가 없습니다. 관리자를 호출해 주세요.</div>
								<% } %>
								<input type="hidden" name="adviceNo" value="<%=ad.getAdviceNo()%>">
								<input type="hidden" name="status" value="<%=ad.getStatus()%>">
								<!-- 트레이너 아이디 출력 -->
								<input type="hidden" name="trainerId" value="<%=trainerID%>">
							</fieldset>
							<!-- 세션값을 받아와야함  -->
							<%if(ad.getTrainerId().equals(trainerID)){ %>
							<div class="buttonLo">
							<button type="submit" class="btn btn-outline-warning btn-sm">수정</button>
							</div>
							<%} %>
						</td>
					</tr>
					</form>
					<%} %>
					<!--반복문 !! -->

				</table>
				<!-- 상담완료쪽 페이징 처리 -->
				<div class="section2" id="paging">
					<ul class="pagination">
						<% if (infoY.getCurrentPage() == 1) {%>
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						<% } else {%>
						<li class="page-item"><a class="page-link"
							href=<%=mzymPath + "/counseling.trainer?pageN="+infoN.getCurrentPage()+"&pageY=" + (infoY.getCurrentPage()- 1) %>>이전</a></li>
						<%} %>

						<!-- 페이징바 숫자 부분 -->
						<% for (int i= infoY.getStartPage(); i <= infoY.getEndPage(); i++){ %>

						<%if((infoY.getCurrentPage() <= infoY.getMaxPage())) {%>
						<!-- 사용자의 요청 페이지와 반복문의 숫자가 같은 경우 active 속성 -->
						<% if(infoY.getCurrentPage() == i){ %>
						<li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
						<%} else if (i <= infoY.getMaxPage()) { %>
						<li class="page-item"><a class="page-link"
							href="<%=mzymPath + "/counseling.trainer?pageN="+infoN.getCurrentPage()+"&pageY=" + i%>"><%=i%></a></li>
						<%}else { %>
						<li class="page-item disabled"><a class="page-link" href="#"><%=i%></a></li>
						<%} %>
						<%} %>
						<%} %>

						<!-- 현재의 페이징바가 총 페이징 바의 수 보다 클 경우 다음으로 안 넘어가도록  -->
						<% if(infoY.getCurrentPage() >= infoY.getMaxPage()) {%>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						<%} else { %>
						<li class="page-item"><a class="page-link"
							href="<%=mzymPath + "/counseling.trainer?pageN="+infoN.getCurrentPage()+"&pageY=" + (infoY.getCurrentPage()+ 1) %>">다음</a></li>
						<%} %>
					</ul>
				</div>
				
			</div>

			<div>
				<table id="boardcontent" class="table">
					<tr id="theader" style="background-color: rgb(224, 224, 224);">
						<th class="table-number">번호</th>
						<th class="table-name">이름</th>
						<th class="table-date">날짜</th>
					</tr>
					<%for (int i =0; i< listN.size(); i++){ 
						Advice ad = listN.get(i);
					%>
						<!--반복문 !! -->
						<tr class="tr-title" data-toggle="collapse" data-target="#book<%=i%>">
							<td class="table-number"><%=ad.getAdviceNo() %></td>
							<td class="table-name"><%=ad.getAdviceName() %></td>
							<td class="table-date"><%=ad.getRegist()%></td>
						</tr>

						<tr id="book<%=i%>" class="collapse">
							<td colspan="3" align="left" class="border" style="font-size: 15px;">
								<fieldset class="detail">
									<legend>세부사항</legend>
									<ul>
										<li>핸드폰 번호: <%=ad.getPhone() %></li>
										<li>분류: <%=ad.getCategoryName() %></li>
										<li>신청 날짜: <%=ad.getAdviceDate() %></li>
										<li>담당자: <%=trainerID%></li>
									</ul>
								</fieldset> <br>
					<form action="<%=mzymPath %>/turnAdvice.trainer" method="post">
								<fieldset>
									<legend><u>신청내용</u></legend>
<textarea style="padding: 10px; resize: none;" cols="57" rows="5" readonly><%=ad.getAdviceContent()%></textarea>
									<h4><u>보고서</u></h4>
<textarea cols="57" rows="5" style="resize: none; padding: 10px;" name="repeat" placeholder="내용을 작성해 주세요."></textarea>
								<input type="hidden" name="adviceNo" value="<%=ad.getAdviceNo()%>">
								<input type="hidden" name="status" value="<%=ad.getStatus()%>">
								<!-- 트레이너 아이디 출력 -->
								<input type="hidden" name="trainerId" value="<%=loginUser.getUserId()%>">
								</fieldset> 
								<div class="buttonLo">
								<button type="submit" class="btn btn-outline-success btn-sm">작성</button>
								</div>
							</td>
						</tr>
						<!--반복문 !! -->
					</form>
					<%} %>

				</table>
				<!-- 상담완료쪽 페이징 처리 -->
				<div class="section2" id="paging">
					<ul class="pagination">
						<% if (infoN.getCurrentPage() == 1) {%>
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						<% } else {%>
						<li class="page-item"><a class="page-link"
							href=<%=mzymPath + "/counseling.trainer?pageY="+infoY.getCurrentPage()+"&pageN=" + (infoN.getCurrentPage()- 1) %>>이전</a></li>
						<%} %>

						<!-- 페이징바 숫자 부분 -->
						<% for (int i= infoN.getStartPage(); i <= infoN.getEndPage(); i++){ %>

						<%if((infoN.getCurrentPage() <= infoN.getMaxPage())) {%>
						<!-- 사용자의 요청 페이지와 반복문의 숫자가 같은 경우 active 속성 -->
						<% if(infoN.getCurrentPage() == i){ %>
						<li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
						<%} else if (i <= infoN.getMaxPage()) { %>
						<li class="page-item"><a class="page-link"
							href="<%=mzymPath + "/counseling.trainer?pageY="+infoY.getCurrentPage()+"&pageN=" + i%>"><%=i%></a></li>
						<%}else { %>
						<li class="page-item disabled"><a class="page-link" href="#"><%=i%></a></li>
						<%} %>
						<%} %>
						<%} %>

						<!-- 현재의 페이징바가 총 페이징 바의 수 보다 클 경우 다음으로 안 넘어가도록  -->
						<% if(infoN.getCurrentPage() >= infoN.getMaxPage()) {%>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						<%} else { %>
						<li class="page-item"><a class="page-link"
							href="<%=mzymPath + "/counseling.trainer?pageY="+infoY.getCurrentPage()+"&pageN=" + (infoN.getCurrentPage()+ 1) %>">다음</a></li>
						<%} %>
					</ul>

				</div>


			</div>
		</div>

	</td>
	<td class="section3"></td>
	</tbody>
	
	<Script>
		$(function(){
	        $(".section2 tr").click(function(){
	            const adviceNo = $(this).children(".table-number").text();
	            console.log(adviceNo);
	            $("#deletModal").find("#adviceNo").val(adviceNo);
	          	             
	        })

			$("#boardcontent tr").click(function(){
                        
                        $(this).css('border', '3px solid #1abc9cc7').css('border-radius', '10px');

                        $(this).siblings().css('border', '0');
                        // console.log($(this).siblings());
                        // console.log($(this).siblings('.show'));
                       
                        $(this).siblings('.show').removeClass('show');

			})

			 // 키보드 값을 입력 받을떄 해당 위치의 collapse 등장
			 const te = document.querySelectorAll("textarea");

			$(document).keydown(function(e){
					const val = e.key;
					let check = true;

					for (let i =0; i < te.length; i++){
						if((te[i] === document.activeElement)){
							check = false;
						}
					}

					if(check){
						let $t = null;
						if(val != 0){
							$t = $("#boardcontent tr").eq(Number(val) * 2);   
						} else if (val == 0){
							$t = $("#boardcontent tr").eq(20);
						}

						$t.css('border', '3px solid #1abc9cc7');
							$t.addClass('show');

							$t.siblings().css('border', '0');
							$t.siblings('.show').removeClass('show');

					}
			}) 



	    })
    </Script>
	
	<!-- tfoot : 삭제 버튼 영역 -->
	<tfoot>
		<td class="section1" style="background-color: rgb(224, 224, 224);"></td>

		<td class="section2"></td>

		<td class="section3 ">
			<button type="button" class="btn btn-outline-danger btn-sm"
				data-toggle="modal" data-target="#deletModal">삭제</button>
		</td>
	</tfoot>
	<!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->
	</table>
	<!-- 삭제용 모달 -->
	<div class="modal" id="deletModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">게시물 삭제</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<form action="<%=mzymPath %>/deleteAdvice.trainer" method="post">
				<div class="in-line" style="text-align: center;">
				<div style="font-size: 15px; padding-top: 10px;"><input class="board-data" type="text" id="adviceNo" name="adviceNo">번</div>
				<div class="modal-body" style="text-align: center; font-size: 15px;">
					게시물을 정말로 삭제 하시겠습니까?
				</div>
				<div style="font-weight: bold; color: red; text-align: center;">삭제 후에는 데이터를 복구 할 수 없습니다.</div>
				</div>
				<br>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>