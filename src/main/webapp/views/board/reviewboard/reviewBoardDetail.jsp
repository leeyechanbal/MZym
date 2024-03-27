<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.board.vo.*" %>
    
<%
    Board b = (Board)request.getAttribute("b"); // 게시글번호, 제목, 내용, 작성자
	List<Attachment> list = (List<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        .wrap, .wrap * {box-sizing: border-box;}

        .wrap{
            margin:auto;
            width:100%;
            max-width:1300px; 
            display:flex;
            flex-direction:column;
        }
        .header{height:250px;}
        .main_content{min-height:500px;}
        .footer{height:250px;}

        .center{display:flex; justify-content: center; align-items: center;}

        /* Section 관련 스타일 */
        .board_content{
            border:1px solid #1abc9c;
            width:80%;
            margin:auto;
            margin-top:50px; 
            margin-bottom:50px;
            min-height:500px;
            padding:50px;
            border-radius:10px;
        }

        hr{
            width: 200px;
            text-align: center;
        }

        h2 { 
            text-align: center; 
        }

        .btn-secondary{
            text-align: bottom;
        }

        .btn1{
            border: 1px solid #1abc9c;
            color: #000;
            text-align: center;
        }
        .btn2{
            border: 1px solid #1abc9c;
            color: #000;
        }
        .btn3{
            border: 1px solid #1abc9c;
            color: #000;    
        }
        
        .btn4{
            border: 1px solid #eee;
            color: #000;
        }

        #img_content{
            width:500px;
            min-height:300px;
            margin:auto;
        }
        .carousel-item img{
            width:500px;
            height:300px;
        }

    </style>

</head>
<body>

<%@ include file="/views/common/Mzym_header.jsp" %>

<section class="main_content">
	<%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>PT 헬스장 후기</h2>
            <hr>
            <br><br>

            
            <div id="img_content" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                  <!-- li 요소는 이미지의 갯수만큼 -->
                  
                  <% for(int i=0; i<list.size(); i++) { %>
                <li data-target="#img_content" data-slide-to="<%= i %>" class="<%=i==0?"active":""%>"></li>
                  <% } %>
              </ul>
              
                <!-- The slideshow -->
                <div class="carousel-inner">

                   <!-- 이미지 갯수만큼 .carousel-item -->
                      <% for(int i=0; i<list.size(); i++) { %>
                      <div class="carousel-item <%=i==0?"active":""%>">
                        <img src="<%= contextPath + "/" + list.get(i).getFilePath() + list.get(i).getChangeName() %>">
                      </div>
                      <% } %>

                </div>
              
                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#img_content" data-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#img_content" data-slide="next">
                  <span class="carousel-control-next-icon"></span>
                </a>
              
            </div>

            <br><br>
            
            
            <table class="table">
                <tr>
                    <th>제목</th>
                    <td colspan="3"><%= b.getBoardTitle() %></td>
                </tr>
                <tr>
                    <th width="100">작성자</th>
                    <td width="400"><%= b.getBoardMember() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"><%=b.getBoardContent() %></div></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <button type="button" class="btn1 btn-outline-secondary btn-sm">목록</button>
                        <!-- 현재 로그인한 사용자가 해당 게시글 작성자일 경우 보여지는 버튼 요소 -->
                        <% if(loginUser != null && Integer.toString(loginUser.getUserNo()).equals(b.getBoardMember())) { %>
                        <button type="button" class="btn3 btn-outline-danger btn-sm">삭제</button>
                        <% }else if(loginUser != null){%>
		                <!-- 현재 로그인한 사용자가 해당 게시글 작성자가 아닐 경우 보여지는 버튼 요소 -->
		                <button type="button" class="btn4 btn-outline-danger btn-sm" id="report_board">신고</button>
		                <% } %>
                    </td>
                </tr>
            </table>

            <br><br>

        </div>

    </section>
    <!-- Section end -->
    
    <script>
		    // 삭제 버튼 클릭 시 confirm 창 띄우기
		    $(".btn3").click(function() {
		        var result = confirm("정말 삭제하시겠습니까?");
		        
		        // 사용자가 "확인"을 선택한 경우에만 AJAX 요청을 실행합니다.
		        if (result) {
		            $.ajax({
		                url: "<%=contextPath%>/deleteFree.bo",
		                type: "POST",
		                data: {
		                    boardNo: <%=b.getBoardNo() %>
		                },
		                success: function(response) {
		                    alert("삭제되었습니다.");
		                    window.location.reload();
		                  	window.location.href = "<%= contextPath %>/list.re";
		                },
		                error: function(xhr, status, error) {
		                    alert("삭제에 실패했습니다. 다시 시도해주세요.");
		                    console.error(xhr, status, error);
		                }
		            });
		        }
		    });
		</script>
		
		<!-- 글신고 모달 -->
     <div class="modal" id="reportBoardModal">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- 모달 헤더 -->
            <div class="modal-header">
            <h5 class="modal-title">글 신고</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- 모달 본문 -->
            <div class="modal-body">
            <p>이 글을 신고하시겠습니까?</p>
            <div class="form-group">
                <label for="reportReason">신고 사유 선택:</label>
                <select class="form-control" id="reportReason">
                    <option value="1">도배/스팸</option>
                    <option value="2">욕설/차별/혐오</option>
                    <option value="3">음란물</option>
                    <option value="4">홍보의심</option	>
                    <option value="5">기타</option>
                </select>
            </div>
            </div>    

            <!-- 모달 하단 -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" id="confirmReport">신고</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
    
    <!-- 스크립트 -->
    <script>
        // 페이지가 로드될 때부터 modal이 숨겨져 있도록 설정
        $(document).ready(function(){
        $("#reportBoardModal").modal('hide');
        });
    
        // 신고 버튼 클릭 시 모달 띄우기
        $("#report_board").click(function(){
        	$("#reportBoardModal").modal('show');
        });
    
        // 신고 확인 버튼 클릭 시 처리
        $("#confirmReport").click(function(){
	    var reportReason = $("#reportReason").val(); // 신고 사유
	    var postId = <%=b.getBoardNo() %>;
	
	    // AJAX를 사용하여 서버에 데이터 전송
	    $.ajax({
	        url: "<%=contextPath%>/report.bo",
	        type: "POST",
	        data: {
	            postId: postId,
	            reportReason: reportReason
	        },
	        success: function(response) {
	            // 서버로부터 응답을 받았을 때 처리
	            alert("글이 신고되었습니다.");
	            // 모달 닫기
	            $("#reportBoardModal").modal('hide');
	        },
	        error: function(xhr, status, error) {
	            // 서버 통신에 오류가 발생했을 때 처리
	            alert("신고 처리 중 오류가 발생했습니다.");
	            console.error(xhr, status, error);
	        }
	    });
	});

    </script>
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>

</body>
</html>