<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.board.vo.*" %>
    
<%
	Board b = (Board)request.getAttribute("b");  // 글번호, 제목, 내용, 작성자이름
	Attachment at = (Attachment)request.getAttribute("at"); // 파일번호, 원본명, 수정파일명, 저장경로
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
            border: 1px solid #eee;
            color: #000;
            text-align: center;
            border: none;
        }

        .btn2{
            border: 1px solid #eee;
            color: #000;
            float: right;
            margin-right: 100px;
        } 
        .btn3{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        .btn4{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        .btn5{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            width: 50px;
        }
        
        .btnlist{
        	border: 1px solid #eee;
            color: #000;
        }

        .modal-content{
            border: 1px solid #1abc9c;
        }

    </style>

</head>

<body>

 <!-- Section start -->
    <section class="main_content">
    
    <%@ include file="/views/common/Mzym_header.jsp" %>
      
       <!-- Section start -->
       <section class="main_content">
       <%@ include file="/views/common/Mzym_sidebar.jsp" %>

        <div class="board_content">
            <h2>자유게시판</h2>
            <hr>

            <table class="table">
            	<thead>
                <!-- 현재 로그인한 사용자가 해당 게시글 작성자일 경우 보여지는 버튼 요소 -->
                <% if(loginUser != null && Integer.toString(loginUser.getUserNo()).equals(b.getBoardMember())) { %>
                <button type="button" class="btn2 btn-outline-danger btn-sm">삭제</button>
                <a href="<%= contextPath %>/freeUpdateForm.bo?no=<%= b.getBoardNo() %>" class="btn3 btn-outline-secondary btn-sm">수정</a>
                <% }else {%>
                <!-- 현재 로그인한 사용자가 해당 게시글 작성자가 아닐 경우 보여지는 버튼 요소 -->
                <button type="button" class="btn4 btn-outline-danger btn-sm">신고</button>
                <% } %>
                
                <tr>
                    <td><h3><%= b.getBoardTitle() %></h3></td>
                </tr>
                <tr>
                    <td><div style="min-height:200px; white-space:pre"><%= b.getBoardContent() %></div></td>
                </tr>
                <tr>
                    <td>
                       <% if(at == null){ %>
                       <!-- case1. 해당 게시글에 첨부파일이 없을 경우 -->
                       현재 첨부파일이 없습니다. 
						<% }else { %>
                       <!-- case2. 해당 게시글에 첨부파일이 있을 경우 -->
                       <a download="<%= at.getOriginName() %>" href='<%= contextPath + "/" + at.getFilePath() + at.getChangeName() %>' style="color:black"><%= at.getOriginName() %></a>
                       <% } %>
                    </td>
                </tr>
            </table>

            <br><br>

            <!-- 댓글관련 영역 -->
            <table class="table">
                <thead>
                    <tr>
                        <th>댓글작성</th>
                        <th width="1000px"><textarea rows="3" class="form-control" style="resize:none"></textarea></th>
                        <td style="vertical-align: bottom;"><button class="btn btn-secondary btn-sm">댓글등록</button></td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
            
            <script>
            
            	$(function(){
            		selectCommentList();
            	})
            
            	function selectCommentList(){
            		$.ajax({
            			url:"<%= contextPath %>/rlist.bo",
            			data:{no:<%= b.getBoardNo() %>},
            			success:function(list){
            				
            				console.log(list);
            				
            			},
            			error:function(){
            				console.log("댓글 목록 조회용 ajax통신 실패")
            			}
            		})
            	}
            
            </script>
            <div class="btn1">
                <a href="<%= contextPath %>/freelist.bo?page=1" class="btnlist btn-outline-secondary btn-sm">목록</a>
            </div>
        </div>

    </section>
    <!-- Section end -->

     <!-- 글신고 모달 -->
     <div class="modal" id="reportModal">
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
                    <option value="4">홍보의심</option>
                    <option value="5">기타</option>
                    <!-- 필요한 신고 사유 항목을 추가하세요 -->
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
        $("#reportModal").modal('hide');
        });
    
        // 신고 버튼 클릭 시 모달 띄우기
        $(".btn4").click(function(){
        $("#reportModal").modal('show');
        });
    
        // 신고 확인 버튼 클릭 시 처리
        $("#confirmReport").click(function(){
        // 여기에 신고 처리를 위한 로직을 추가할 수 있습니다.
        // 예를 들어, AJAX를 사용하여 서버에 신고 요청을 보낼 수 있습니다.
        alert("글이 신고되었습니다.");
        // 모달 닫기
        $("#reportModal").modal('hide');
        });
    </script>

    <!-- 댓글 신고 모달 -->
    <div class="modal" id="reportModal">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- 모달 헤더 -->
            <div class="modal-header">
            <h5 class="modal-title">댓글 신고</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- 모달 본문 -->
            <div class="modal-body">
            <p>이 댓글을 신고하시겠습니까?</p>
            <label for="reportReason">신고 사유 선택:</label>
                <select class="form-control" id="reportReason">
                    <option value="1">도배/스팸</option>
                    <option value="2">욕설/차별/혐오</option>
                    <option value="3">음란물</option>
                    <option value="4">홍보의심</option>
                    <option value="5">기타</option>
                    <!-- 필요한 신고 사유 항목을 추가하세요 -->
                </select>
            </div>
    
            <!-- 모달 하단 -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" id="confirmReport1">신고</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>
    
    <!-- 스크립트 -->
    <script>
        // 페이지가 로드될 때부터 modal이 숨겨져 있도록 설정
        $(document).ready(function(){
        $("#reportModal").modal('hide');
        });
    
        // 신고 버튼 클릭 시 모달 띄우기
        $(".btn5").click(function(){
        $("#reportModal").modal('show');
        });
    
        // 신고 확인 버튼 클릭 시 처리
        $("#confirmReport1").click(function(){
        // 여기에 신고 처리를 위한 로직을 추가할 수 있습니다.
        // 예를 들어, AJAX를 사용하여 서버에 신고 요청을 보낼 수 있습니다.
        alert("댓글이 신고되었습니다.");
        // 모달 닫기
        $("#reportModal").modal('hide');
        });
    </script>
    
    <%@ include file="/views/common/Mzym_footer.jsp" %>

</body>
</html>