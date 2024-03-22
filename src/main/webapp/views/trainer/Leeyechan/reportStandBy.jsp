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

        /* 신고 댓글 추가 스타일 */
        .board-out>#accusation{
            background-color: rgba(26, 188, 156, 0.2);
        }
        .suteOption{
            display: block;
        }
        .suteOption>.suteRrepeat{
            background-color: rgba(26, 188, 156, 0.2);
        }
    </style>
</head>
<body>
   <table id="outTable">
        
        <thead class="">
            <td class="section1" id="back"><img src="/src/main/webapp/resources/img/icon/back-igon-32x24.png" alt="뒤로가기"></td>
            <td class="section2" id="logo"><img src="/src/main/webapp/resources/img/icon/logo-sm-170x100.png" alt="로고"></td>
            <td class="section3"></td>
        </thead>
        
        <tr style="height: 30px;"></tr>

        <tbody>
            <td class="section1" id="menu">
                <div id="adi">관리자<br>xxx</div>
                <div class="board-out">

                    <div id="board"><a href="">공지사항</a></div>

                    <div id="counseling"><a href="">상담예약</a></div>
                    <div id="customer"><a href="">고객센터</a></div>
                    <div id="accusation">관리</div>
                    <div class="suteOption" style="margin-top: 0;">
                        <div class="suteBoard"><a href="">신고 대기</a></div>
                        <div class="suteRrepeat"><a href="">신고 완료</a></div>
                    </div>
                    <div id="calory"><a href="">인바디</a></div>

                </div>
            </td>

            <td class="section2">
                <div style="display: grid">
                    <div class="dropdown" style="text-align: -webkit-right;">
                        <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" style="margin-bottom: 10px;">
                          카테고리
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">전체</a>
                          <a class="dropdown-item" href="#">자유게시판</a>
                          <a class="dropdown-item" href="#">PT 후기</a>
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
                                    <th>종류</th>
                                    <th>작성자</th>
                                </tr>
        
                            <!-- 첨부파일 -->
                            <form action="" method="">
                                <tr class="tr-title" data-toggle="collapse" data-target="#reBoard1"> 
                                    <td class="table-number">1</td>
                                    <td class="table-title">여기서 똥싸도 되요.</td>
                                    <td>자유게시판</td>
                                    <td>test1</td>
                                </tr>
        
                                <tr id="reBoard1" class="collapse">
                                    <td colspan="5">
                                        <div class="collapseitem">
                                            <fieldset>
                                                <legend><u>세부사항</u></legend>
                                                <ul>
                                                    <li>글 번호 : 152</li>
                                                    <li>카테고리: 욕설</li>
                                                    <li>신고자: admin1</li>
                                                    <li>신고일: 24-03-22</li>
                                                </ul>
                                            </fieldset>
                                            <textarea cols="150" rows="5" readonly> 저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.</textarea>
                                            <legend><u>보고서</u></legend>
                                            <textarea cols="150" rows="5"></textarea>
                                            <br><br>
                                            <div style="width: 100%; display: flex; justify-content: space-between;">
                                                <a download="" href="">오리지널 파일 이름</a>
                                                <div>
                                                    <button type="submit" class="btn btn-outline-secondary btn-sm">요청 철회</button>
                                                    <button type="submit" class="btn btn-outline-danger btn-sm">신고 확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </form>


                            <!-- 사진 -->
                            <form action="" method="">
                                <tr class="tr-title" data-toggle="collapse" data-target="#rePicture1"> 
                                    <td class="table-number">1</td>
                                    <td class="table-title">여기서 똥싸도 되요.</td>
                                    <td>PT 후기</td>
                                    <td>test1</td>
                                </tr>
        
                                <tr id="rePicture1" class="collapse">
                                    <td colspan="5">
                                        <div class="collapsePicture">
                                           
                                                <fieldset style="text-align: start;">
                                                    <legend><u>세부사항</u></legend>
                                                    <ul>
                                                        <li>글 번호 : 152</li>
                                                        <li>카테고리: 욕설</li>
                                                        <li>신고자: admin1</li>
                                                        <li>신고일: 24-03-22</li>
                                                    </ul>
                                                    <textarea cols="75" rows="8" readonly>저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.</textarea>
                                                    <legend><u>보고서</u></legend>
                                                    <textarea cols="75" rows="8"></textarea>
                                                </fieldset>
                                                <!-- 사진 미리보기 -->
                                                <div id="demo" class="carousel slide" data-ride="carousel">

                                                    <!-- Indicators -->
                                                    <ul class="carousel-indicators">
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="0" class="active"></li>
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="1"></li>
                                                      <li style="background-color: black;" data-target="#demo" data-slide-to="2"></li>
                                                    </ul>
                                                    
                                                    <!-- The slideshow -->
                                                    <div class="carousel-inner">
                                                      <div class="carousel-item active">
                                                        <img src="/src/main/webapp/resources/img/common/MZYMProduct.png" width="500px" height="500px">
                                                      </div>
                                                      <div class="carousel-item">
                                                        <img src="/src/main/webapp/resources/img/icon/logo-sm-170x100.png" width="500px" height="500px">
                                                      </div>
                                                      <div class="carousel-item">
                                                        <img src="/src/main/webapp/resources/img/icon/logo-sm-170x100.png" width="500px" height="500px">
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
                                            <button type="submit" class="btn btn-outline-secondary btn-sm">요청 철회</button>
                                            <button type="submit" class="btn btn-outline-danger btn-sm">신고 확인</button>
                                        </div>
                                    </td>
                                </tr>
                            </form>
                            
                            </table>



                        </div>
                        <!-- 게시글 -->
                        <div class="tab-pane container fade" id="comment">
                            <table id="boardcontent" class="table">
                                <tr id="theader" style="background-color: rgb(224, 224, 224);">
                                    <th class="table-number">번호</th>
                                    <th class="table-title">제목</th>
                                    <th>신고자</th>
                                    <th>작성자</th>
                                </tr>
        
        
                            <form action="" method="">
                                <tr class="tr-title" data-toggle="collapse" data-target="#reComment1">
                                    <td class="table-number">1</td>
                                    <td class="table-title">여기서 똥싸도 되요.</td>
                                    <td>PT 후기</td>
                                    <td>test1</td>
                                </tr>
        
                                <tr id="reComment1" class="collapse">
                                    <td colspan="5">
                                        <div class="collapseitem">
                                            <fieldset style="text-align: start;">
                                                <legend><u>세부사항</u></legend>
                                                <ul>
                                                    <li>글 번호 : 152</li>
                                                    <li>카테고리: 욕설</li>
                                                    <li>신고자: admin1</li>
                                                    <li>신고일: 24-03-22</li>
                                                </ul>
                                            </fieldset>
                                            <textarea cols="150" rows="5" readonly> 저희 집 안마당에서 강아지 똥 치워주 실 멍청이 구합니다.</textarea>
                                            <legend><u>보고서</u></legend>
                                            <textarea cols="150" rows="5"></textarea>
                                            <br><br>
                                            <div style="text-align: -webkit-right;">
                                                <button type="submit" class="btn btn-outline-secondary btn-sm">요청 철회</button>
                                                <button type="submit" class="btn btn-outline-danger btn-sm">신고 확인</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </form>
                            
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
                <ul class="pagination" >
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>

                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>

                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
            </td>
            
            <td class="section3 ">
                <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModal">이동</button>
                <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deletModal" >삭제</button>
            </td>
        </tfoot>
        <!-- tfoot :  페이징 바 및 작성 과 삭제 버튼 영역 -->

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
        <div class="in-line" style="text-align: center;">
            <h5>현재 선택된 게시글</h5> 
            <div style="font-size: 15px;"><input type="text" class="board-data" value="152">번</div>
            <div class="modal-body" style="text-align: center; font-size: 15px; ">
                게시물을 정말로 삭제 하시겠습니까?
            </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-outline-danger btn-sm" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
</div>


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
    <form action="">
        <div class="modal-body">
        <div class="in-line">
            <h5>현재 선택된 게시글</h5> 
            <div style="font-size: 15px;"><input type="text" class="board-data" value="152">번</div>
            <div style="font-size: 20px;">현재 위치 : 자유 게시판</div>
            <br>
            <div style="font-size: 20px; display: flex"> 이동 위치 선택
                <ul class="moving-category" style="font-size: 15px;">
                    <li>공지사항</li>
                    <li>자유게시판</li>
                    <li>질문게시판</li>
                    <li>PT 및 헬스장 후기</li>
                    <li>운동 모임</li>
                </ul>
            </div>
            <input type="text" class="outmove">
        </div>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">이동</button>
            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
        </div>
    </div>
    </form>

    <script>
        $(function(){
            $(".moving-category>li").click(function(){
                const $move = $(this).text();
                console.log($move)
                $(".outmove").val($move);
            })
        })

    </script>
  
      </div>
    </div>
  </div>



  </table>
   
</body>
</html>