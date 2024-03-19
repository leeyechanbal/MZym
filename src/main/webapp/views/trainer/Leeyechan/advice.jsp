<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ %>    
    
<%

%>  
  
<%@ include file="/views/trainer/Leeyechan/trainerHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        /* 상담예약 추가 스타일 */
        .board-out>#counseling{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .boardNav{
            display: none;
        }

        /* 테이블 변경 및 추가 사항 */
        /* 이름 및 날짜 가로 길이 */
        #boardcontent{
            width: 450px;
        }
        .table-name, 
        .table-date{
            width: 100px;
        }
        .section2 > div {
            display: flex;
            justify-content: space-around;
        }
        tfoot{
            height: 100px;
        }
    </style>

</head>
<body>

            <td class="section2">
                <div>
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

                        <form action="" method="">
                            <!--반복문 !! -->
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">1</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>

                            <tr id="complete1" class="collapse">
                                <td colspan="3" align="left" class="border" style="font-size: 15px;">
                                    <fieldset>
                                        <legend>세부사항</legend>
                                        <div>번호:</div>
                                        <div>분류:</div>
                                        <div>신청 날짜:</div>
                                        <div>담당자:세션정보에서 가져오기</div>
                                    </fieldset>
                                    <br>
                                    <fieldset>
                                        <legend>신청내용</legend>
                                        <pre style="text-align: left;" class="rounded">안녕하세요 인포 여성분 마음에 들어서 그런데 번호 좀 주세요.</pre>
                                        <h4>보고서</h4>
                                        <textarea name="" cols="57" rows="5"  style="resize: none;"></textarea>
                                    </fieldset>
                                    <input type="checkbox"> 완료여부
                                    <button type="submit" class="btn btn-outline-warning btn-sm">수정</button>
                                </td>
                            </tr>
                            <!--반복문 !! -->

                            <!-- 샘플 데이터 -->
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete2"> 
                                <td class="table-number" name="">2</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>

                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">3</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">4</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">5</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">6</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">7</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">8</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">9</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                                <td class="table-number" name="">10</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>
                            
                            <!-- 샘플 데이터 -->
                        </form>
                    </table>
                    <!-- 상담완료쪽 페이징 처리 -->
                        <div class="section2" id="paging" >
                            <ul class="pagination" >
                                <li class="page-item"><a class="page-link" href="#">이전</a></li>
            
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
            
                                <li class="page-item"><a class="page-link" href="#">다음</a></li>
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

                        <form action="" method="">
                            <!--반복문 !! -->
                            <tr class="tr-title" data-toggle="collapse" data-target="#book1"> 
                                <td class="table-number" name="">1</td>
                                <td class="table-name" name="">임영뭉</td>
                                <td class="table-date" name="">2024-05-06</td>
                            </tr>

                            <tr id="book1" class="collapse">
                                <td colspan="3" align="left" class="border" style="font-size: 15px;">
                                    <fieldset>
                                        <legend>세부사항</legend>
                                        <div>번호:</div>
                                        <div>분류:</div>
                                        <div>신청 날짜:</div>
                                        <div>담당자: 세션정보에서 가져오기</div>
                                    </fieldset>
                                    <br>
                                    <fieldset>
                                        <legend>신청내용</legend>
                                        <pre style="text-align: left;">안녕하세요 인포 여성분 마음에 들어서 그런데 번호 좀 주세요.</pre>
                                        <h4>보고서</h4>
                                        <textarea name="" cols="57" rows="5"  style="resize: none;"></textarea>
                                    </fieldset>
                                    <input type="checkbox"> 완료여부
                                    <button type="submit" class="btn btn-outline-success btn-sm">작성</button>
                                </td>
                            </tr>
                            <!--반복문 !! -->
                        </form>

                        <!-- 샘플 데이터 -->
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">2</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">3</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">4</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">5</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">6</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">7</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">8</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">9</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        <tr class="tr-title" data-toggle="collapse" data-target="#complete1"> 
                            <td class="table-number" name="">10</td>
                            <td class="table-name" name="">임영뭉</td>
                            <td class="table-date" name="">2024-05-06</td>
                        </tr>
                        
                        <!-- 샘플 데이터 -->

                        </table>
                        <!-- 상담완료쪽 페이징 처리 -->
                        <div class="section2" id="paging" >
                            <ul class="pagination" >
                                <li class="page-item"><a class="page-link" href="#">이전</a></li>
            
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
            
                                <li class="page-item"><a class="page-link" href="#">다음</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </td>
            <td class="section3"></td>
        </tbody>
        <!-- tfoot : 페이징 바 및 작성 과 삭제 버튼 영역 -->
        <tfoot>
            <td class="section1" style="background-color: rgb(224, 224, 224);"></td>

            <td class="section2"></td>
            
            <td class="section3 ">
                <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
            </td>
        </tfoot>
        <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->
   </table>
<!-- 삭제용 모달 -->
<div class="modal" id="deletModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">게시물 삭제</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body" style="text-align: center; font-size: 15px; ">
            게시물을 정말로 삭제 하시겠습니까?
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-outline-danger btn-sm" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
</div>
</body>
</html>