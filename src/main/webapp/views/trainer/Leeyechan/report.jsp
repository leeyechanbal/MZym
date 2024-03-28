<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.common.paging.PageInfo" %>
<%@ page import="com.mzym.board.vo.Report" %>
<%@ page import="com.mzym.board.vo.Board" %>
<%@ page import="com.mzym.board.vo.Comment" %>
<%@ page import="com.mzym.board.vo.Attachment" %>
<%@ page import="com.mzym.board.vo.ReportCategory" %>
<%@ page import="com.mzym.board.vo.BoardCategory" %>
<%
	PageInfo infoBoard = (PageInfo)request.getAttribute("infoBoard");
	PageInfo infoComment = (PageInfo)request.getAttribute("infoComment");
	
	List<Report> listBoard = (List<Report>)request.getAttribute("listBoard");
	List<Report> listComment = (List<Report>)request.getAttribute("listComment");
	
	List<BoardCategory> bCategory = (List<BoardCategory>)request.getAttribute("bCategory");
	List<ReportCategory> rCategory = (List<ReportCategory>)request.getAttribute("rCategory");
	// 페이지 단에서 리스트가 비어 있지 않는지 isEmpty 확인 그리고 로그아웃 구현, 로그 클릭시 selectedFuntion 가기
	String status = (String)request.getAttribute("status");
	int categoryNum = (int)request.getAttribute("cate");
	
	String categoryName = null;
	int numPT = 0;
	
	boolean check = status.equals("Y");
	
	for (BoardCategory b : bCategory){
		if (b.getCategoryNo() == categoryNum){
			categoryName = b.getCategoryName();
		}
		
 		if(b.getCategoryName().equals("PT및헬스장후기")){
			numPT = b.getCategoryNo();
		} 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>
<meta charset="UTF-8">
<title>신고</title>

    <style>

        /* 신고 댓글 추가 스타일 */
        .board-out>#accusation{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .suteOption{
            display: block;
        }
        
       <% if (check){%> 
	        .suteOption>.suteBoard{
	            background-color: rgba(26, 188, 156, 0.2);
	        }
        <%} else {%>
	         .suteOption>.suteRrepeat{
	            background-color: rgba(26, 188, 156, 0.2);
	        }
       <%}%>
       
    </style>
</head>
<body>

            <td class="section2">
                <div style="display: grid;">
                <div class="dropdown" style="text-align: -webkit-right;">
                        <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" style="margin-bottom: 10px;">
                          <%=categoryName%>
                        </button>
                        <div class="dropdown-menu">
                        <% for(BoardCategory b : bCategory) {%>
                          <a class="dropdown-item" href="<%=mzymPath%>/report.trainer?pageC=1&pageB=1&status=<%=status%>&cate=<%=b.getCategoryNo()%>"><%=b.getCategoryName()%></a>
                          <%} %>
                        </div>
                      </div>

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#reportBoard">게시글</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#comment">댓글</a>
                        </li>
                    </ul>
                    
                    <!-- Tab panes -->
                    <div class="tab-content">
                    <!-- 게시글인 경우 -->
                        <div class="tab-pane container active" id="reportBoard">
						
                            <table id="boardcontent" class="table">
                                <tr id="theader" style="background-color: rgb(224, 224, 224);">
                                    <th class="table-number">번호</th>
                                    <th class="table-title">제목</th>
                                    <th>작성자</th>
                                </tr>
        					
        					<!-- PT후기 게시판이 아닐 경우 -->
        					<% if(categoryNum != numPT) { %>
        						<% for(int i =0; i<listBoard.size(); i++) {
            						Report r = listBoard.get(i);
            						Board b = r.getBoard();
            						Attachment a = b.getAtt();  %>
                            		
                         		<tr class="tr-title" data-toggle="collapse" data-target="#reBoard<%=i%>"> 
                                    <td class="table-number"><%=r.getReportNo()%></td>
                                    <td class="table-title"><%=b.getBoardTitle()%></td>
                                    <td><%=b.getBoardMember()%></td>
                               	</tr>
                            		
                            	<tr id="reBoard<%=i %>" class="collapse">
                            		<td colspan="5">
                                        <div class="collapseitem">
                                            <fieldset>
                                                <legend><u>세부사항</u></legend>
                                                <ul>
                                                    <li>글 번호 : <%=b.getBoardNo()%></li>
                                                    <li>카테고리: 
	                                                    <%for(ReportCategory rc : rCategory) {
	 		                                                 if(rc.getCategoryNo() == r.getCategoryNo()){
	 		                                                	 out.print(rc.getCategoryName());
	 		                                                 }  	
	                                                    }%>
                                                    </li>
                                                    <li>신고자: <%=r.getUserID() %></li>
                                                    <li>신고일: <%=r.getReportDate()%></li>
                                                    <%if (check){ %>
                                                    	<li>보고자: <%=loginUser.getUserId()%></li>
                                                    <%} else { %>
                                                    	<li>보고자: <%=r.getReporter()%></li>
                                                    <%} %>
                                                </ul>
                                            </fieldset>
                 				            <form action="" method="">
                                            <textarea cols="150" rows="5" readonly><%=b.getBoardContent()%></textarea>
                                            <legend><u>보고서</u></legend>
                                            <%if(check){ %> <!-- 상태가 Y일 경우 -->
                                            <textarea cols="150" rows="5" name="content" required></textarea>
                                            <%} else { %>
                                                <!-- 보고자를 테이블에 넣어서 조회 온 뒤에 화면에서 같은 경우와 아닐 경우 출력을 변경 -->
                                                <%if(loginUser.getUserId().equals(r.getReporter())){ %>
                                            	<textarea cols="150" rows="5" name="content"><%=r.getReportContent()%></textarea>
                                            	<%}else { %>
                                            	<textarea cols="150" rows="5" name="content" readonly><%=r.getReportContent()%></textarea>
                                            	<%} %>
                                            <%} %>
                                            <input type="hidden" name="typeCheck" value="1">
                                            <input type="hidden" name="report" value="<%=r.getReportNo()%>">
                                            <input type="hidden" name="reporter" value="<%=loginUser.getUserId()%>">
                                            <br><br>
                                            <div style="width: 100%; display: flex; justify-content: space-between;">
                                            <% String originName = a.getOriginName();
                                            	if(originName != null){
                                            %>
                                                <div>다운로드: <a download="<%=originName%>" href="<%=mzymPath + "/" + a.getFilePath() + a.getChangeName()%>"><%=originName%></a></div>
                                                <%} else { %>
                                                <div>첨부파일이 존재하지 않습니다.</div>
                                                <%} %>
                                                <div>
                                                	<!-- 보고자를 테이블에 넣어서 조회 온 뒤에 화면에서 같은 경우와 아닐 경우 출력을 변경 -->
                                                    <% if (r.getCategoryNo() != 5) {%>
                                                        <% if(check){ %>
                                                            <button type="button" class="btn btn-outline-danger btn-sm type2">확인</button>                                                   	
                                                            <button type="button" class="btn btn-outline-secondary btn-sm type1">철회</button>
                                                        <%} else { %>
                                                            <%if(loginUser.getUserId().equals(r.getReporter())){ %>
                                                            <button type="button" class="btn btn-outline-warning btn-sm type2">수정</button>
                                                            <%} %>
                                                        <%} %>
                                                    <%}else{ %>
                                                        <button type="button" class="btn btn-outline-secondary btn-sm type1">철회</button>
                                                        <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal">이동</button>
                                                    <%} %>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    </form>

                            		
                           		<%} %>
                            <%} else { %>
                            <!-- PT후기(3) 게시판일 경우 -->
                            <%int count = 0; %>
                            
                            	<%for (int i = 0 ; i < listBoard.size(); i++ ){ 
                            		Report r = listBoard.get(i);
                            		Board b = listBoard.get(i).getBoard();
                            		List<Attachment> atList = listBoard.get(i).getBoard().getAtList();
                            		boolean che = (i == 0 ) ? true : (listBoard.get(i-1).getReportNo() != listBoard.get(i).getReportNo());
                            		
                            		if(count >= 10){
                            			break;
                            		}
                            		
                            		
                            	%>
                            												
                            	<% if(che) {%>
                          		 	<tr class="tr-title" data-toggle="collapse" data-target="#rePicture<%=count%>"> 
                                    	<td class="table-number"><%=r.getReportNo() %></td>
                                    	<td class="table-title"><%=b.getBoardTitle() %></td>
                                    	<td><%=b.getBoardMember() %></td>
                                	</tr>
                                	
                                	<tr id="rePicture<%=count%>" class="collapse">
                                	
                                    <td colspan="5">
                                        <form action="" method="">
                                        <div class="collapsePicture">
                                                <fieldset style="text-align: start;">
                                                    <legend><u>세부사항</u></legend>
                                                    <ul>
                                                        <li>글 번호 : <%=b.getBoardNo()%></li>
                                                    	<li>카테고리: 
	                                                    <%for(ReportCategory rc : rCategory) {
	 		                                                 if(rc.getCategoryNo() == r.getCategoryNo()){
	 		                                                	 out.print(rc.getCategoryName());
	 		                                                 }  	
	                                                    }%>
                                                    	</li>
                                                    	<li>신고자: <%=r.getUserID() %></li>
                                                    	<li>신고일: <%=r.getReportDate()%></li>
                                                    	<%if (check){ %>
	                                                    	<li>보고자: <%=loginUser.getUserId()%></li>
	                                                    <%} else { %>
	                                                    	<li>보고자: <%=r.getReporter()%></li>
	                                                    <%} %>
                                                    </ul>
                                                    
                                                    
                                                    <textarea cols="75" rows="8" readonly><%=b.getBoardContent()%></textarea>
                                                    <legend><u>보고서</u></legend>
                                                    <%if(check){ %>
                                                        <textarea cols="75" rows="8" name="content" required></textarea>
                                                        <%} else { %>
                                                        <!-- 보고자를 테이블에 넣어서 조회 온 뒤에 화면에서 같은 경우와 아닐 경우 출력을 변경 -->
                                                        <textarea cols="75" rows="8" name="content"><%=r.getReportContent()%></textarea>
                                                        <%} %>
                                                    <input type="hidden" name="typeCheck" value="1"> <!-- 게시물인지 댓글인지 -->
                                                    <input type="hidden" name="report" value="<%=r.getReportNo()%>">
                                                    <input type="hidden" name="reporter" value="<%=loginUser.getUserId()%>">
                                               	</fieldset>
                                                
                                                
                                                <div id="demo<%=count%>" class="carousel slide" data-ride="carousel" style="width: 50%; align-content: center; margin-left: 15px;">
                                               
													
                                                    <!-- 사진이 있는 경우 -->
                                                    <!-- Indicators -->
													<ul class="carousel-indicators">                                             
                                                       <%for (int j = 0; j< atList.size(); j++ ){ %>
                                                      	<li data-target="#demo<%=count%>" data-slide-to="<%=j%>" class="<%=(j == 0 )?"active":""%>" style="background-color: black;"></li>
                                                   		<%} %>
                                                    </ul>
	                                                    
                                                    <!-- The slideshow -->
                                                    <div class="carousel-inner">
                                                    <%for (int j = 0; j< atList.size(); j++ ){ 
                                                    	Attachment at = atList.get(j);
                                                    	
                                                    %>
                                                      <div class="carousel-item <%=(j == 0)?"active":""%>"><span class="badge badge-dark"><%=at.getFileLevel()%></span>
                                                        <img src="<%=mzymPath + at.getFilePath()+ at.getChangeName()%>" width="500px" height="500px">
                                                      </div>
                                                      <%} %>
                                                    </div>
                                                    <!-- 사진이 있는 경우 -->
                                                  
                                                    
                                                    <!-- Left and right controls -->
                                                    <a class="carousel-control-prev" href="#demo<%=count%>" data-slide="prev">
                                                      <span class="carousel-control-prev-icon" style="background-color: black;"></span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#demo<%=count%>" data-slide="next">
                                                      <span class="carousel-control-next-icon" style="background-color: black;"></span>
                                                    </a>
                                                </div> <!-- demo 끝 -->
                                            </div> <!-- collapsePicture 끝 -->

                                                <div style="text-align: -webkit-right; margin-top: 10px;">
                                                <!-- 보고자를 테이블에 넣어서 조회 온 뒤에 화면에서 같은 경우와 아닐 경우 출력을 변경 -->
                                                <% if(check){ %>
                                                    <button type="button" class="btn btn-outline-danger btn-sm type2">확인</button>                                                   	
                                                    <button type="button" class="btn btn-outline-secondary btn-sm type1">철회</button>
                                                <%} else { %>
                                                    <%if(loginUser.getUserId().equals(r.getReporter())){ %>
                                                        <button type="button" class="btn btn-outline-warning btn-sm type2">수정</button>
                                                    <%} %>
                                                <%} %>
                                                </div>
                                            </td>
                                        </form>
                                </tr>
                                <%count++; %>
                                	<%} %> <!-- 게시물 번호 비교 후 생성 if문 끝 -->
                            	<%} %> <!-- 사진 for문 끝 -->
                           	<%} %> <!-- pt후기 게시글 체크 else문 끝 -->

                            </table>
                        </div>
                        
                        
                        <!-- 댓글 -->
                        <div class="tab-pane container fade" id="comment">
                            <table id="boardcontent" class="table">
                                <tr id="theader" style="background-color: rgb(224, 224, 224);">
                                    <th class="table-number">번호</th>
                                    <th class="table-title">제목</th>
                                    <th style="width: 100px;">글 번호</th>
                                </tr>
        
        
                        	<% for(int i = 0; i<listComment.size(); i++) {
                        		Report r = listComment.get(i);
                        		Board b = r.getBoard();
                        		Comment c = r.getComment();
                        	%>
                            <tr class="tr-title" data-toggle="collapse" data-target="#reComment<%=i%>">
                                <td class="table-number"><%=r.getReportNo() %></td>
                                <td class="table-title"><%=b.getBoardTitle() %></td>
                                <td><%=b.getBoardNo()%></td>
                            </tr>
                            
                            <tr id="reComment<%=i%>" class="collapse">
                                <td colspan="5">
                                    <div class="collapseitem">
                                        <form action="" method="">
                                            <fieldset style="text-align: start;">
                                                <legend><u>세부사항</u></legend>
                                                <ul>
                                                    
                                                    <li>카테고리: 
	                                                    <%for(ReportCategory rc : rCategory) {
	 		                                                 if(rc.getCategoryNo() == r.getCategoryNo()){
	 		                                                	 out.print(rc.getCategoryName());
	 		                                                 }  	
	                                                    }%>
                                                    	</li>
                                                    <li>신고자: <%=r.getUserID()%></li>
                                                    <li>신고일: <%=r.getReportDate()%></li>
                                                    <%if (check){ %>
                                                    	<li>보고자: <%=loginUser.getUserId()%></li>
                                                    <%} else { %>
                                                    	<li>보고자: <%=r.getReporter()%></li>
                                                    <%} %>
                                                </ul>
                                            </fieldset>
                                            <textarea cols="150" rows="5" readonly><%=c.getCommentContent()%></textarea>
                                            <legend><u>보고서</u></legend>
                                            <%if(check){ %>
                                            <textarea cols="150" rows="5" name="content" required></textarea>
                                            <%} else { %>
                                            <textarea cols="150" rows="5" name="content"><%=r.getReportContent()%></textarea>
                                            <%} %>
                                            <input type="hidden" name="typeCheck" value="0">
                                            <input type="hidden" name="report" value="<%=r.getReportNo()%>">
                                            <input type="hidden" name="reporter" value="<%=loginUser.getUserId()%>">
                                            <br><br>
                                            <div style="text-align: -webkit-right;">
                                                <% if(check){ %>
                                                    <button type="button" class="btn btn-outline-danger btn-sm type2">확인</button>                                                   	
                                                    <button type="button" class="btn btn-outline-secondary btn-sm type1">철회</button>
                                                <%} else { %>
                                                    <%if(loginUser.getUserId().equals(r.getReporter())){ %>
                                                        <button type="button" class="btn btn-outline-warning btn-sm type2">수정</button>
                                                    <%} %>
                                                <%} %>
                                            </div>
                                        </form>
                                        </div>
                                    </td>
                                </tr>
                            <%} %>
                            </table>
                        </div>
                        <!-- 댓글 -->
                </div>
            </td>
            <td class="section3"></td>
        </tbody>
        <!-- tfoot : 페이징 바 및 작성 과 삭제 버튼 영역 -->
        <tfoot>
            <td class="section1" style="background-color: rgb(224, 224, 224);"></td>
         
            <td class="section2" id="paging" >
	
                <% 
                	int bCurrent = infoBoard.getCurrentPage();
                	int bMaxPage = infoBoard.getMaxPage();
                	int cCurrent = infoComment.getCurrentPage();
	            	int cMaxPage = infoComment.getMaxPage();
                %>
                
                
				<!-- 
					후기에서 많은 양에 결과를 조회 했는데 출력을 안하다 보니 페이징 과 매칭이 안됨
					
					pt후기 일때와 아닐떄를 나누어서 페이징 처리해야됨
			 	-->
				<!-- 게시판 페이징 -->
				<% if(categoryNum != numPT) { // 카테고리 게시판이 pt후기가 아닐 경우 %>
					
	                <ul class="pagination paging-board" >
	                    <% if (bCurrent == 1) {%>
		                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						<% } else {%>
		                    <li class="page-item"><a class="page-link" href=<%=mzymPath + "/report.trainer?pageB=" + (bCurrent- 1) + "&pageC="+ cCurrent + "&cate=" + categoryNum + "&status=" + status%>>이전</a></li>
						<%} %>
						
						<!-- 페이징바 숫자 부분 -->
						<% for (int i= infoBoard.getStartPage(); i <= infoBoard.getEndPage(); i++){ %>
							
							<%if((bCurrent <= bMaxPage)) {%>					
								<!-- 사용자의 요청 페이지와 반복문의 숫자가 같은 경우 active 속성 -->
								<% if(bCurrent == i){ %>
			                    <li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
			                    <%} else if (i <= infoBoard.getMaxPage()) { %>
			                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/report.trainer?pageB=" + i + "&pageC="+ cCurrent + "&cate=" + categoryNum + "&status=" + status %>"><%=i%></a></li>
			                    <%}else { %>
			                    <li class="page-item disabled"><a class="page-link" href="#"><%=i%></a></li>
			                    <%} %>
		                    <%} %>
						<%} %>
						
						<!-- 현재의 페이징바가 총 페이징 바의 수 보다 클 경우 다음으로 안 넘어가도록  -->
						<% if(bCurrent >= bMaxPage) {%>						
		                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
	                   	<%} else { %> 
		                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/report.trainer?pageB=" + (bCurrent+ 1) + "&pageC="+ cCurrent + "&cate=" + categoryNum + "&status=" + status %>">다음</a></li>
	                    <%} %>
	                </ul>
                	<%} %>

        		<!-- 댓글 페이징 -->
                <ul class="pagination paging-commnet" style="content-visibility:hidden" >
                    <% if (cCurrent == 1) {%>
	                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					<% } else {%>
	                    <li class="page-item"><a class="page-link" href=<%=mzymPath + "/report.trainer?pageC=" + (cCurrent- 1)+ "&pageB="+ bCurrent + "&cate=" + categoryNum + "&status=" + status %>>이전</a></li>
					<%} %>
					
					<!-- 페이징바 숫자 부분 -->
					<% for (int i= infoComment.getStartPage(); i <= infoComment.getEndPage(); i++){ %>
						
						<%if((cCurrent <= cMaxPage)) {%>					
							<!-- 사용자의 요청 페이지와 반복문의 숫자가 같은 경우 active 속성 -->
							<% if(cCurrent == i){ %>
		                    <li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
		                    <%} else if (i <= cMaxPage) { %>
		                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/report.trainer?pageC=" + i + "&pageB="+ bCurrent + "&cate=" + categoryNum + "&status=" + status %>"><%=i%></a></li>
		                    <%}else { %>
		                    <li class="page-item disabled"><a class="page-link" href="#"><%=i%></a></li>
		                    <%} %>
	                    <%} %>
					<%} %>
					
					<!-- 현재의 페이징바가 총 페이징 바의 수 보다 클 경우 다음으로 안 넘어가도록  -->
					<% if(cCurrent >= cMaxPage) {%>						
	                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                   	<%} else { %> 
	                    <li class="page-item"><a class="page-link" href="<%=mzymPath + "/report.trainer?pageC=" + (cCurrent+ 1)+ "&pageB="+ bCurrent+ "&cate=" + categoryNum + "&status=" + status %>">다음</a></li>
                    <%} %>
                </ul>

            </td>


            <script>
                $(function(){
                    $(".nav-item a").click(function(){
                        const type = $(this).text()
                        //console.log(type);

                        if(type == '게시글'){
                            const $paging = $('.paging-board');
                            $paging.css('content-visibility', 'visible');
                            // console.log($paging.next())
                            $paging.next().css('content-visibility', 'hidden');



                        } else {
                            const $paging = $('.paging-commnet');
                            $paging.css('content-visibility', 'visible');
                            // console.log($paging.prev())
                            $paging.prev().css('content-visibility', 'hidden');
                        }

                    })

                    $("#boardcontent tr").click(function(){
                        const boardNo = $(this).children(".table-number").text();
                        $("#deletModal").find(".board-data").val(boardNo);  
                        
                        $(this).css('border', '3px solid #1abc9cc7');

                        $(this).siblings().css('border', '0');
                        // console.log($(this).siblings());
                        // console.log($(this).siblings('.show'));
                       
                        $(this).siblings('.show').removeClass('show');

                    })

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

                    $(".type1").click(function(){
                        const $form = $(this).parents('form');
                        // console.log($form);
                        const reportNo = $form.find('input[name=report]').val();
                        // console.log(reportNo);
                        const text = $form.find('textarea[name=content]').val();
                        // console.log(text);
                        const typeCheck = $form.find('input[name=typeCheck]').val();
                        // console.log(typeCheck);
                        const reporter = $form.find('input[name=reporter]').val();
                        // console.log(reporter);

                        const str = '<%=mzymPath%>/reportRequest.trainer?reportNo=' + reportNo + '&text='+ text +'&typeCheck=' + typeCheck +'&cate=' + <%=categoryNum%> + '&reporter='+ reporter + '&type=1';
                        console.log(str);
                       location.href = str;
                        // 화면이 안 넘어 갈떄는 sumbit이 두번 요청 되고 있는지 확인 button이 submit타입이라서 두번 요청 될 수 있음
                    })

                    $(".type2").click(function(){
                        const $form = $(this).parents('form');
                        // console.log($form);
                        const reportNo = $form.find('input[name=report]').val();
                        // console.log(reportNo);
                        const text = $form.find('textarea[name=content]').val();
                        // console.log(text);
                        const typeCheck = $form.find('input[name=typeCheck]').val();
                        // console.log(typeCheck);
                        const reporter = $form.find('input[name=reporter]').val();
                        // console.log(reporter);

                        const str = '<%=mzymPath%>/reportRequest.trainer?reportNo=' + reportNo + '&text='+ text +'&typeCheck=' + typeCheck +'&cate=' + <%=categoryNum%> + '&reporter='+ reporter + '&type=2';
                        console.log(str);
                       location.href = str;
                    })
                    
                    // 이동 모달 데이터 받기
                    $("[data-target='#myModal']").click(function(){
                        // console.log(this);
                        // console.log($(this).parents('form'));

                        const reportNo =  $(this).parents('form').children('input[name=report]').val()
                        // console.log(reportNo);

                        const content =  $(this).parents('form').children('textarea[name=content]').val()
                        // console.log(content);

                        const reporter = $(this).parents('form').children('input[name=reporter]').val()
                        // console.log(reporter);


                        $("#myModal").find("input[name=reportNo]").val(reportNo);
                        $("#myModal").find("input[name=text]").val(content);   
                        $("#myModal").find("input[name=reporter]").val(reporter);  


                    })


                })
            </script>
            
            
            <td class="section3 ">
                
					<!-- 이동용 모달 -->
					<div class="modal" id="myModal">
					    <div class="modal-dialog modal-lg">
					      <div class="modal-content">
					        <div class="out-line">
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h3 class="modal-title">게시물 이동</h3>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					  
					        <!-- Modal body -->
					    <form action="<%=mzymPath%>/moveBoard.trainer" method="post">
					        <div class="modal-body">
					        <div class="in-line">
					            <h5>현재 선택된 게시글</h5> 
					            <div style="font-size: 15px;"><input style="text-align: center; border: 0;" type="text" name="reportNo">번</div>
                                <div style="font-size: 15px;"><input style="text-align: center; border: 0;" type="text" name="reporter">관리자</div>
					            <br>
                                <div style="font-size: 20px;">현재 위치 : <u style="text-decoration-color: #1abc9cc7;"><%=categoryName%></u></div>
					            <br>
					            <div style="font-size: 20px; display: flex"> 이동 위치 선택
					                <ul class="moving-category" style="font-size: 15px;">
					                     <% for(BoardCategory b : bCategory) {%>
					                     	<li value="<%=b.getCategoryNo()%>"><%=b.getCategoryName() %></li>
					                     <%} %>
					                </ul>
					            </div>
					            <input type="text" name="selectNo">
                                <!-- 타입이 hidden일 경우에는 requerd가 먹히지 않는다. -->
                                <input type="text" name="text">
                                <input type="text" name="cate" value="<%=categoryNum%>">
					        </div>
					        </div>
					
					        <!-- Modal footer -->
					        <div class="modal-footer">
					            <button type="submit" class="btn btn-outline-success btn-sm" onclick="return modalCheck();">이동</button>
                                <!-- submit보다 속성 이벤트가 먼저 작동된다. -->
					            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					        </div>
					    </div>
					    </form>
					
					    <script>
					        $(function(){
					            $(".moving-category>li").click(function(e){
					                
					                $(this).css('border', '1px solid #1abc9cc7').css('border-radius', '10px');
					               
					                // 제이쿼리에서 선택된 요소를 제외한고 골라준다.
					                $(this).siblings().css('border', '0')
					
					                $("input[name=selectNo]").val($(this).val());
					            })
					           
					        })

                            function modalCheck(){
                                console.log($('input[name=selectNo]').val());
                                console.log(document.getElementsByName('selectNo').value);
                                console.log(document.getElementsByName('selectNo').value == null);


                                return false;
                            }

					    </script>
					  
					      </div>
					    </div>
					  </div>


                
               <% if (!check) {%>
                <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
                
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
					        <form action="<%=mzymPath%>/reportDelete.trainer">
					        <div class="in-line" style="text-align: center;">
					            <h5>현재 선택된 데이터 번호</h5> 
					            <div style="font-size: 15px;"><input type="text" class="board-data" name="reportNo" value="0">번</div>
					           	<input type="hidden" name="cate" value="<%=categoryNum%>">
					            <div class="modal-body" style="text-align: center; font-size: 15px; ">
					                게시물을 정말로 삭제 하시겠습니까?
					            </div>
					            <div style="font-weight: bold; color: red; text-align: center;">삭제 후에는 데이터를 복구 할 수 없습니다.</div>
					        </div>
					        <!-- Modal footer -->
					        <div class="modal-footer">
					            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					            <button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
					        </div>
                        </form>
					      </div>
					    </div>
					</div>
                <%} %>
            </td>
        </tfoot>
        <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->

  </table>
   
</body>
</html>