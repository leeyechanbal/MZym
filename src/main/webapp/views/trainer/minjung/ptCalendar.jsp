<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	//Member loginUser = (Member)request.getAttribute("longinUser");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PT일정등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/src/main/webapp/resources/css/ptCalendar_minjung/ptCalendar_minjung.css">
    
    <!-------------------- fullcalendar script --------------------->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.11/index.global.min.js'></script>
    <!--------------------- fullcalendar script --------------------->
   
    <!-- calendar 생성 script -->
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {

            headerToolbar : {
                left : 'prev, next today',
                conter : 'title',
                right : 'dayGridMonth, timeGridWeek, timeGridDay'
            },
            locale : 'ko',
            selectable : true,
            selectMirror : true,
            eventLimit : 'more',
            initialView: 'dayGridMonth',
            eventAdd : function(e){     // 이벤트가 추가되면 발생하는 이벤트
                console.log(e);
            },
            
            events:[{title: 'Meeting', start: new Date() }] //test

            });

            
            calendar.render();
        });
    
        </script>
        <!-- calendar 생성 script -->


</head>


</head>
<body>

<div class="wrap">

    <!--headr start-->   
    <header class="header-top-section">
        
           
                
        <nav class="header_nav">

            <div class="main_back" style="cursor: pointer;">
                <a href=""><img src="../../../resources/img/common/뒤로가기.png" style="width: 50px; "></a>
                </div>
           
            <div class="main_logo" >
                <a href=""><img src="../../../resources/img/common/MZYM_logo_272x167.png" style="width: 170px;"></a>
              </div>

            <div class="main_item">
            <a href="" class=""></a>
            </div>

    </header>

    <!--headr end-->
    
    <!--section start-->    
    <section class="main_content">

        <!-- side menu start -->
        <div  class="side_menu">

            <div class="side_login">
                <img src="../../../resources/img/common/profile_icon_512x512.png" style="width: 75px"> <br>
                xxx 트레이너
            </div>
            <div class="side_list" >
                
                <div class="user_search">
                    <div class="btn btn-light" data-toggle="modal" data-target="#myModal" style="font-weight: bold;">회원 조회</div>
                </div>
                <div class="user_search">
                    <div class="btn btn-light" data-toggle="modal" data-target="#myModal2" style="font-weight: bold;">PT일정 등록</div>
                </div>

            </div>

        </div> 



        <!-- -------------------------------------section modal start-------------------------------------- -->
        
            <!-- 회원별 조회 모달  start ----------------------------------------------------------------------- -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><b>조회메뉴</b></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                    <!-- Modal body -->
                <div class="modal-body">
                    <form action="" name="">
                        <ul>
                            <li>
                                <label >조회할 회원 핸드폰 번호</label> <br>
                                <input type="text" name="phone" style="width: 325px;" required> 
                            </li><br>
                            <li>
                                <label>조회할 회원 이름</label> <br>
                                <input type="text" name="userName" style="width: 325px;" required>
                            </li><br>
                            <li>
                                <label>조회할 기간</label> <br>
                                <input type="text" name="period" style="width: 325px;" required>
                            </li>
                        </ul>
                    </form>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                <button type="button" id= "modal-footer-btn"class="btn btn-danger" data-dismiss="modal">조회</button>
                </div>
        
                    </div>
                </div>
                </div>  
            <!-- 회원별 조회 모달  end ----------------------------------------------------------------------- -->
    
            <!-- PT일정 추가 모달  start ------------------------------------------------------------------------>
            
                    <!-- The Modal -->
                <div class="modal" id="myModal2">
                    <div class="modal-dialog">
                    <div class="modal-content modal-userInsert">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title"><b>PT 일정</b></h4>
                    <button type="submit" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%= contextPath %>/insert.cal" method="post">
                            <table>
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label style="width: 100px;">회원이름</label>
                                    </td>
                                    <td>
                                        <input type="text" required name="userName">
                                    </td>
                                    <td colspan="2">
                                        <input type="color" style="margin-bottom: 15px; margin-top: 15px;" required name="calColor">
                                    </td> 
                                </tr >
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>시작일</label>
                                    </td>
                                    <td>
                                        <input type="text" required name="startDate">
                                    </td>
                                    <td >
                                        <label style="width: 70px;">종료일</label>
                                    </td>
                                    <td>
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="endDate">
                                    </td>
                                </tr>
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>핸드폰번호</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="phone">
                                    </td>
                                </tr>

                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>작성자</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="writer">
                                        
                                        <!-- 로그인한 트레이너 회원번호 넘기기 -->
                                        <!--  
                                        <input type="hidden" name="trNo" value="">
                                        -->
                                    </td>
                                </tr>
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td >
                                        <label>제목</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px; width: 530px;" required name="title">
                                    </td>
                                </tr>                                
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>내용</label>
                                    </td>
                                    <td colspan="3">
                                        <textarea  style="margin-bottom: 15px; margin-top: 15px;" cols="70" rows="8" required name="content">
                                        </textarea></td>
                                </tr>
    
                            </table>
                        </form>
    
                    </div>
    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" id= "insert_btn"class="btn btn-danger" data-dismiss="modal">추가</button>
                            </div>
                    
                                </div>
                            </div>
                        </div>
            <!-- PT일정 추가 모달  end ------------------------------------------------------------------------>
    
    
           <!-- PT일정 수정, 삭제 모달  start --------------------------------------------------------------------------->
                    <!-- The Modal -->
                    <div class="modal" id="myModal3">
                        <div class="modal-dialog">
                        <div class="modal-content modal-userInsert">
                
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title"><b>PT 일정</b></h4>
                        <button type="submit" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="" name="">
                                <table>
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label style="width: 100px;">회원이름</label>
                                        </td>
                                        <td>
                                            <input type="text" required>
                                        </td>
                                        <td colspan="2">
                                            <input type="color" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td> 
                                    </tr >
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>시작일</label>
                                        </td>
                                        <td>
                                            <input type="text" required>
                                        </td>
                                        <td >
                                            <label style="width: 70px;">종료일</label>
                                        </td>
                                        <td>
                                            <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>핸드폰번호</label>
                                        </td>
                                        <td colspan="3">
                                            <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td>
                                    </tr>

                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>작성자</label>
                                        </td>
                                        <td colspan="3">
                                            <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td >
                                            <label>제목</label>
                                        </td>
                                        <td colspan="3">
                                            <input type="text" style="margin-bottom: 15px; margin-top: 15px; width: 530px;" required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>내용</label>
                                        </td>
                                        <td colspan="3">
                                            <textarea  style="margin-bottom: 15px; margin-top: 15px;" cols="70" rows="8" required>
                                            </textarea></td>
                                    </tr>
        
                                </table>
                            </form>
        
                        </div>
        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" id= "update_btn"class="btn btn-danger" data-dismiss="modal">수정</button>
                                    <button type="submit" id= "delete_btn"class="btn btn-danger" data-dismiss="modal">삭제</button>
                                </div>
                        
                                    </div>
                                </div>
                            </div>
           <!-- PT일정 수정, 삭제 모달  start --------------------------------------------------------------------------->
    
                       
    
                        
                
        
    
    
            <!-- -------------------------------------section modal end-------------------------------------- -->
                    
    
    
            <!--side menu end-->



        <!-- content start -->
        <div class="cal_content">
            <div id='calendar' ></div>
        </div>

        <script>



            // 회원별 조회 모달창 조회 클릭시 실행될 이벤트



            // PT일정등록 모달창 등록 클릭시 실행될 이벤트
            /*
            $("#insert_btn").on("click", function(){ 

                var title = $('#title').val();

                if(title){
                    calendar.addEvent({
                        organizer : '회원이름',                 // 보통은 일정작성자 이름
                        backgroundColor : 'pink',              // 일정 배경색
                        start : '2024-03-15',                  // 시작일 시간도 입력 가능 ex)'13:00' or 'T13:00'
                        end : '2024-03-17',                    // 종료일
                        location : '010-1111-1111',            // 보통은 장소 또는 위치
                        title : title,                        // 제목
                        description : '내용'
                    });
                }
            })

           */

            // 기존에 등록된 일정 클릭후 수정, 삭제버튼 클릭시 실행될 이벤트  
           /*
            eventClick : function(plan){
                // 삭제확인 모달창 or alert창 띄우기
                plan.event.remove();
            }
            */

        </script>

        <!-- content end -->

       

    </section>
    <!--section end-->

    <!--footer start-->    

        <ul class="footer_copyright">
           
    </footer>
    <!--footer end-->


</div>

</body>
</html>