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
	int categoryNum = (int)request.getAttribute("categoryNum");
	
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
<meta charset="UTF-8">
<title>신고</title>

<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>
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
                          <a class="dropdown-item" href="<%=mzymPath%>/report.trainer?pageC=1&pageB=1&status=Y&cate=<%=b.getCategoryNo()%>"><%=b.getCategoryName()%></a>
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
                        <div class="tab-pane container active" id="reportBoard">

                            <table id="boardcontent" class="table">
                                <tr id="theader" style="background-color: rgb(224, 224, 224);">
                                    <th class="table-number">번호</th>
                                    <th class="table-title">제목</th>
                                    <th>작성자</th>
                                </tr>
        					
        					<% for(int i =0; i<listBoard.size(); i++) {
        						Report r = listBoard.get(i);
        						Board b = r.getBoard();
        						Attachment a = b.getAtt();
        						
        						if(b.getBoardType() != numPT) {
        					%>
                            <!-- 게시글 : 첨부파일 -->
                                <tr class="tr-title" data-toggle="collapse" data-target="#reBoard<%=i%>"> 
                                    <td class="table-number"><%=r.getReportNo()%></td>
                                    <td class="table-title"><%=b.getBoardTitle()%></td>
                                    <td><%=b.getBoardMember()%></td>
                                </tr>
        
                                <tr id="reBoard<%=i %>" class="collapse">
                            <form action="" method="get">
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
                                                </ul>
                                            </fieldset>
                                            <textarea cols="150" rows="5" readonly><%=b.getBoardContent()%></textarea>
                                            <legend><u>보고서</u></legend>
                                            <textarea cols="150" rows="5" name="content"></textarea>
                                            <input type="hidden" name="board" value="<%=b.getBoardNo()%>">
                                            <input type="hidden" name="report" value="<%=r.getReportNo()%>">
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
                                                    <button type="submit" class="btn btn-outline-secondary btn-sm">철회</button>
                                                    <% if (r.getCategoryNo() == 5) {%>
                                                    	<button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal">이동</button>
                                                    <%} else { %>
                                                    <button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
                                                    <%} %>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                            </form>
                                </tr>
							<%} else { %>

                            <!-- pt후기 : 사진 -->
                            <form action="" method="get">
                                <tr class="tr-title" data-toggle="collapse" data-target="#rePicture<%=i%>"> 
                                    <td class="table-number"><%=r.getBoardNo() %></td>
                                    <td class="table-title"><%=b.getBoardContent() %></td>
                                    <td><%=b.getBoardMember() %></td>
                                </tr>
        
                                <tr id="rePicture<%=i%>" class="collapse">
                                    <td colspan="5">
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
                                                    </ul>
                                                    <textarea cols="75" rows="8" readonly><%=b.getBoardContent()%></textarea>
                                                    <legend><u>보고서</u></legend>
                                                    <textarea cols="75" rows="8"  name="content"></textarea>
                                                    <input type="hidden" name="board" value="<%=%>">
                                                    <input type="hidden" name="report" value="<%=%>">
                                                </fieldset>
                                                <!-- 사진 미리보기 -->
                                                <div id="demo" class="carousel slide" data-ride="carousel">

                                                    <!-- Indicators -->
                                                    <ul class="carousel-indicators">
															<!-- 파일레벨 -->                                                   
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="0" class="<%-- <%=(i == 0 )?"active":""%> --%>"></li>
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="1"></li>
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="2"></li>
                                                    </ul>
                                                    
                                                    <!-- The slideshow -->
                                                    <div class="carousel-inner">
                                                      <div class="carousel-item active"><span class="badge badge-dark">1</span>
                                                        <img src="" width="500px" height="500px">
                                                      </div>
                                                      <div class="carousel-item"><span class="badge badge-dark">2</span>
                                                        <img src="" width="500px" height="500px">
                                                      </div>
                                                      <div class="carousel-item">
                                                        <img src="" width="500px" height="500px">
                                                      </div>
                                                    </div>
                                                    
                                                    <!-- Left and right controls -->
                                                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                                      <span class="carousel-control-prev-icon" style="background-color: black;"></span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#demo" data-slide="next">
                                                      <span class="carousel-control-next-icon" style="background-color: black;"></span>
                                                    </a>
                                                </div>
                                                  <!-- 사진 영역 -->
                                        </div>
                                        <div style="text-align: -webkit-right; margin-top: 10px;">
                                            <button type="submit" class="btn btn-outline-secondary btn-sm">철회</button>
                                            <button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
                                        </div>
                                    </td>
                                </tr>
                            </form>
                            	<%} %> <!-- 사진과 게시글 나누는 if문 끝 -->
                            <%} %><!-- 게시글 for문 끝 -->
                            </table>
                        </div>
                        
                        
                        <!-- 댓글 -->
                        <div class="tab-pane container fade" id="comment">
                            <table id="boardcontent" class="table">
                                <tr id="theader" style="background-color: rgb(224, 224, 224);">
                                    <th class="table-number">번호</th>
                                    <th class="table-title">제목</th>
                                    <th>작성자</th>
                                </tr>
        
        
                        	<% for(int i = 0; i<listComment.size(); i++) {
                        		Report r = listComment.get(i);
                        		Board b = r.getBoard();
                        		Comment c = r.getComment();
                        	%>
                            <form action="" method="get">
                                <tr class="tr-title" data-toggle="collapse" data-target="#reComment<%=i%>">
                                    <td class="table-number"><%=r.getReportNo() %></td>
                                    <td class="table-title"><%=b.getBoardTitle() %></td>
                                    <td><%=c.getUserName()%></td>
                                </tr>
        
                                <tr id="reComment<%=i%>" class="collapse">
                                    <td colspan="5">
                                        <div class="collapseitem">
                                            <fieldset style="text-align: start;">
                                                <legend><u>세부사항</u></legend>
                                                <ul>
                                                    <li>댓글 번호 : <%=c.getCommentNo() %></li>
                                                    <li>카테고리: 
	                                                    <%for(ReportCategory rc : rCategory) {
	 		                                                 if(rc.getCategoryNo() == r.getCategoryNo()){
	 		                                                	 out.print(rc.getCategoryName());
	 		                                                 }  	
	                                                    }%>
                                                    	</li>
                                                    <li>신고자: <%=r.getUserID()%></li>
                                                    <li>신고일: <%=r.getReportDate()%></li>
                                                </ul>
                                            </fieldset>
                                            <textarea cols="150" rows="5" readonly><%=c.getCommentContent()%></textarea>
                                            <legend><u>보고서</u></legend>
                                            <textarea cols="150" rows="5" name="content"></textarea>
                                            <input type="hidden" name="board" value="<%=b.getBoardNo()%>">
                                            <input type="hidden" name="report" value="<%=r.getReportNo()%>">
                                            <br><br>
                                            <div style="text-align: -webkit-right;">
                                                <button type="submit" class="btn btn-outline-secondary btn-sm">철회</button>
                                                <button type="submit" class="btn btn-outline-danger btn-sm">확인</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </form>
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
				<!-- 게시판 페이징 -->
                <ul class="pagination paging-board" >
                <% 
                	int bCurrent = infoBoard.getCurrentPage();
                	int bMaxPage = infoBoard.getMaxPage();
                	int cCurrent = infoComment.getCurrentPage();
	            	int cMaxPage = infoComment.getMaxPage();
                %>
                
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
                        console.log(type);

                        if(type == '게시글'){
                            const $paging = $('.paging-board');
                            $paging.css('content-visibility', 'visible');
                            console.log($paging.next())
                            $paging.next().css('content-visibility', 'hidden');
                        } else {
                            const $paging = $('.paging-commnet');
                            $paging.css('content-visibility', 'visible');
                            console.log($paging.prev())
                            $paging.prev().css('content-visibility', 'hidden');
                        }

                    })

                    $("#boardcontent tr").click(function(){
                        const boardNo = $(this).children(".table-number").text();
                        const text = $(this).next().find(".report-content").val();
                        // console.log(text); 
                        $("#deletModal").find(".board-data").val(boardNo);  
                        $("#myModal").find(".board-data").val(boardNo);
                        $("#myModal").find(".board-text").val(text);        
                    })


                })
            </script>
            
            
            <td class="section3 ">
         
                
					<!-- 이동용 모달 -->
					<div class="modal" id="myModal">
					    <div class="modal-dialog modal-lg">
					      <div class="modal-content">
					        <div class="outline">
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h3 class="modal-title">게시물 이동</h3>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					  
					        <!-- Modal body -->
					    <form action="/moveBoard.trainer" method="post">
					        <div class="modal-body">
					        <div class="in-line">
					            <h5>현재 선택된 게시글</h5> 
					            <div style="font-size: 15px;"><input type="text" class="board-data" name="reportNo">번</div>
					            <div style="font-size: 20px;">현재 위치 : <%=categoryName%></div>
					            <br>
					            <div style="font-size: 20px; display: flex"> 이동 위치 선택
					                <ul class="moving-category" style="font-size: 15px;">
					                     <% for(BoardCategory b : bCategory) {%>
					                     	<li value="<%=b.getCategoryNo()%>"><%=b.getCategoryName() %></li>
					                     <%} %>
					                </ul>
					            </div>
					            <input type="hidden" class="outmove" name="selectNo">
                                <input type="hidden" class="board-text" name="text">
					        </div>
					        </div>
					
					        <!-- Modal footer -->
					        <div class="modal-footer">
					            <button type="submit" class="btn btn-outline-success btn-sm">이동</button>
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
					
					                $(".outmove").val($(this).val());
					            })
					
					
					           
					        })
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
					            <h5>현재 선택된 게시글</h5> 
					            <div style="font-size: 15px;"><input type="text" class="board-data" name="reportNo" value="0">번</div>
					            <div class="modal-body" style="text-align: center; font-size: 15px; ">
					                게시물을 정말로 삭제 하시겠습니까?
					            </div>
					            
					        </div>
					        <!-- Modal footer -->
					        <div class="modal-footer">
					            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					            <button type="button" class="btn btn-outline-danger btn-sm">확인</button>
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