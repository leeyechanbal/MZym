<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.common.paging.PageInfo" %>
<%@ page import="com.mzym.board.vo.Report" %>
<%
	PageInfo info = (PageInfo)request.getAttribute("info");
	List<Report> list = (List<Report>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 대기</title>

<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>
<style>

    /* 신고 게시판 추가 스타일 */
    .board-out>#accusation{
        background-color: rgba(26, 188, 156, 0.2);
    }
    .suteOption{
        display: block;
    }
    .suteOption>.suteBoard{
        background-color: rgba(26, 188, 156, 0.2);
    }
    .collapseitem{
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    .collapseitem li{
        padding: 5px;
        font-size: 15px;
    }
    .collapseitem p{
        font-size: 15px;
        width: 100%;
    }
    .collapseitem input{
        margin: 5px;
    }
    tfoot{
        height: 100px;
    }

</style>
</head>
<body>

   <table id="outTable">
   

           <td class="section2">
               <div>
                   <table id="boardcontent" class="table">
                       <tr id="theader" style="background-color: rgb(224, 224, 224);">
                           <th class="table-number">번호</th>
                           <th class="table-title">제목</th>
                           <th>신고자</th>
                           <th>종류</th>
                       </tr>

					<%for (int i =0; i < list.size(); i++){ 
						/* 반복되는 변수 선언 */
						Report re = list.get(i);
						// 신고된 종류
						String type = re.getType();
					%>
						<%if (type.equals("board")) {
							// 게시글인 경우 반복된는 변수
						%>

									<tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>">
			                           <td class="table-number"><%= %></td>
			                           <td class="table-title">여기서 똥싸도 되요.</td>
			                           <td>user0001</td>
			                           <td>댓글</td>
			                       </tr>
			
			                       <tr id="context<%=i%>" class="collapse">
			                   <form action="" method="get">
			                           <td colspan="5">
			                               <div class="collapseitem">
			                                   <fieldset>
			                                       <legend>세부사항</legend>
			                                       <ul>
			                                           <li>글번호: </li>
			                                           <li>카테고리: </li>
			                                           <li>작성자: </li>
			                                           <li>신고일: </li>
			                                       </ul>
			                                   </fieldset>
			                                   <p class="border"> 저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.</p>
			                                   <div>
			                                       <button type="submit" style="margin-left: 600px;" class="btn btn-outline-warning btn-sm">신고취소</button>
			                                       <button type="submit" style="margin-left: 50px;" class="btn btn-outline-warning btn-sm">신고확인</button>
			                                   </div>
			                               </div>
			                           </td>
			                   </form>
			                       </tr>
						
						
						<%} else {   
							// 댓글인 경우 반복되는 변수
						%>
						
						
						
						
						
						
						
						
						
						<%} %>
						
						
						
						
						
						
						
						
						
                       <tr class="tr-title" data-toggle="collapse" data-target="#context<%=i%>"> <!--반복문 !! -->
                           <td class="table-number">1</td>
                           <td class="table-title">여기서 똥싸도 되요.</td>
                           <td>user0001</td>
                           <td>댓글</td>
                       </tr>

                       <tr id="context<%=i%>" class="collapse">
                   <form action="" method="get">
                           <td colspan="5">
                               <div class="collapseitem">
                                   <fieldset>
                                       <legend>세부사항</legend>
                                       <ul>
                                           <li>글번호: </li>
                                           <li>카테고리: </li>
                                           <li>작성자: </li>
                                           <li>신고일: </li>
                                       </ul>
                                   </fieldset>
                                   <p class="border"> 저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.</p>
                                   <div>
                                       <button type="submit" style="margin-left: 600px;" class="btn btn-outline-warning btn-sm">신고취소</button>
                                       <button type="submit" style="margin-left: 50px;" class="btn btn-outline-warning btn-sm">신고확인</button>
                                   </div>
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
       <!-- tfoot : 페이징 바 및 작성 과 삭제 버튼 영역 -->
       <tfoot>
           <td class="section1" style="background-color: rgb(224, 224, 224);"></td>
           <td class="section2" id="paging" >
               <ul class="pagination" >
                   <li class="page-item"><a class="page-link" href="#">이전</a></li>

                   <li class="page-item active"><a class="page-link" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>

                   <li class="page-item"><a class="page-link" href="#">다음</a></li>
               </ul>
           </td>
           
           <td class="section3 "></td>
       </tfoot>
       <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->
  </table>

   
</body>
</html>