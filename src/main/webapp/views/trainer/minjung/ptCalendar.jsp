<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.member.model.vo.Member" %>
<%@ page import="com.mzym.calendar.vo.Calendar" %>
<%
	String contextPath = request.getContextPath();
//	Member loginUser = (Member)request.getSession().getAttribute("longinUser");
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	Calendar clist = (Calendar)request.getAttribute("clist");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PT일정등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/ptCalendar_minjung/ptCalendar_minjung.css">
    
    <!-------------------- fullcalendar script --------------------->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.11/index.global.min.js'></script>
    <!--------------------- fullcalendar script --------------------->
   
    <script>
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
      });
    calendar.render();
    });

  </script>


</head>
<body>

<div class="wrap">

    <!--headr start-->   
    <header class="header-top-section">
        
           
                
        <nav class="header_nav">
			
            <div class="main_back" style="cursor: pointer;">
                <a href="#" onclick="history.back(); return false;"><img src="<%=contextPath %>/resources/img/common/뒤로가기.png" style="width: 50px; "></a>
                </div>
           
            <div class="main_logo" >
                <a href=""><img src="<%=contextPath %>/resources/img/common/MZYM_logo_272x167.png" style="width: 170px;"></a>
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
                <img src="<%=contextPath %>/resources/img/common/profile_icon_512x512.png" style="width: 75px"> <br>
                <%=loginUser.getUserName() %> 트레이너
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
                <h4 class="modal-title"><b>회원 조회</b></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                    <!-- Modal body -->
                <div class="modal-body">
                    <form action="" name="">
                        <ul>
                            <li>
                                <label >조회할 회원 핸드폰 번호(-포함)</label> <br>
                                <input type="text" name="searchPhone" style="width: 325px;" required> 
                            </li><br>
                            <li>
                                <label>조회할 회원 이름</label> <br>
                                <input type="text" name="searchUserName" style="width: 325px;" required>
                            </li><br>
                            <li>
                                <label>조회할 기간</label> <br>
                                <input type="text" name="searchStartDate" style="width: 150px;" required placeholder=" ex) 01/01/2024"> ~ 
                                <input type="text" name="searchEndDate" style="width: 150px;" required placeholder=" ex) 01/31/2024">
                            </li>
                        </ul>
                    </form>
                </div>
        

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
                    	<input type="hidden" id="calNo"> 
                            <table>
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label style="width: 100px;">회원이름</label>
                                    </td>
                                    <td>
                                        <input type="text" required name="ptUserName">
                                    </td>
                                    <td>
                                        <label style="width: 100px;">일정색상</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="calColor" placeholder=" ex)red">
                                    </td> 
                                </tr >
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>시작일</label>
                                    </td>
                                    <td>
                                        <input type="text" required name="startDate" placeholder="ex)01/01/2024">
                                    </td>
                                    <td >
                                        <label style="width: 70px;">종료일</label>
                                    </td>
                                    <td>
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="endDate" placeholder="ex)12/31/2024">
                                    </td>
                                </tr>
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>핸드폰번호</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="userPhone" placeholder="ex)010-9999-9999(-포함)">
                                    </td>
                                </tr>

                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>작성자</label>
                                    </td>
                                    <td colspan="3">
                                    	<input type="hidden" name="trNo" value="">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required name="writer" value="<%=loginUser.getUserName()%>">
                                        
                                    </td>
                                </tr>
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td >
                                        <label>제목</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px; width: 530px;" required name="title" placeholder="제목을 입력해주세요">
                                    </td>
                                </tr>                                
    
                                <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                    <td>
                                        <label>내용</label>
                                    </td>
                                    <td colspan="3">
                                        <textarea  style="margin-bottom: 15px; margin-top: 15px;" cols="70" rows="8" required name="content" placeholder="내용을 입력해주세요.">
                                        </textarea></td>
                                </tr>
    
                            </table>
                            
                            <div class="modal-footer">
                                <button type="submit" id="insert_btn"class="btn btn-danger" data-dismiss="modal">추가</button>
                            </div>
    
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
                                        	<input type="hidden" id="calNo">
                                            <input type="text" required id="calUserName">
                                        </td>
                                        <td>
                                        <label style="width: 100px;">일정색상</label>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" style="margin-bottom: 15px; margin-top: 15px;" required id="calColor" placeholder=" ex)red"> 
                                    </tr >
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>시작일</label>
                                        </td>
                                        <td>
                                            <input type="text" id="startDate" required>
                                        </td>
                                        <td >
                                            <label style="width: 70px;">종료일</label>
                                        </td>
                                        <td>
                                            <input type="text" id="endDate" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>핸드폰번호</label>
                                        </td>
                                        <td colspan="3">
                                            <input type="text" id="calPhone" style="margin-bottom: 15px; margin-top: 15px;" required>
                                        </td>
                                    </tr>

                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>작성자</label>
                                        </td>
                                        <td colspan="3">
                                        	<input type="hidden" >
                                            <input type="text" id="writer" style="margin-bottom: 15px; margin-top: 15px;" readonly required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td >
                                            <label>제목</label>
                                        </td>
                                        <td colspan="3">
                                            <input type="text" id="title" style="margin-bottom: 15px; margin-top: 15px; width: 530px;" required>
                                        </td>
                                    </tr>
        
                                    <tr style="border-bottom: 1px solid rgb(224, 224, 224);">
                                        <td>
                                            <label>내용</label>
                                        </td>
                                        <td colspan="3">
                                            <textarea id="content"  style="margin-bottom: 15px; margin-top: 15px;" cols="70" rows="8" required>
                                            </textarea></td>
                                    </tr>
        
                                </table>
                            </form>
        
                        </div>
        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="submit" id= "update_btn"class="btn btn-outline-success" data-dismiss="modal" onclick="calendarUpdate();">수정</button>
                                    <button type="submit" id= "delete_btn"class="btn btn-outline-danger" data-dismiss="modal" onclick="calendarDelete();">삭제</button>
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
	$(function(){
		ptCalendar();
	})
     
	// 캘린더 일정 조회 함수
        
	function ptCalendar(){
        $.ajax({
        	url:"<%=contextPath%>/list.cal",
        	data:{trNo:<%=loginUser.getUserNo()%>},//{$("#trNo").val()}, //no:15
        	type:"post",
        	success:function(clist){
        		
        		console.log(clist);
        		// 매개변수에 담겨잇는 데이터들에 접근해서 
        		// let 변수 =  [{title:"db로부터조회한일정의제목", start:"일정날짜"}, {title:"db로부터조회한일정의제목", start:"일정날짜"} .. ] 이런형태로 만들기
        		
        		
        		let pt = [];
        		for(let i=0; i<clist.length;i++){
        			pt.push({
        				id : clist[i].calNo,						// 일정번호
        				title : clist[i].calTitle,					// 제목
        				start : clist[i].startDate,					// 시작일
        				end : clist[i].endDate,						// 종료일
        				color : clist[i].calColor,  				// 일정색상
        				phoneNumber : clist[i].calPhone,			// 회원 핸드폰번호
        				organizer : clist[i].writer,   				// 작성자(로그인한트레이너이름)
        				name : clist[i].calUserName,				// pt회원이름 
        				description : clist[i].calContent			// 내용
        				
        			});
        		}
        		
        		
        		
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {

                headerToolbar : {
                    start : 'prev, next today',
                    center : 'title',
                    end : 'dayGridMonth, timeGridWeek, timeGridDay'
                },
                locale : 'ko',
                selectable : true,
                selectMirror : true,
                eventLimit : 'more',
                initialView: 'dayGridMonth',
               // eventAdd : function(e){     // 이벤트가 추가되면 발생하는 이벤트
               //     console.log(e);
               // },
                
                // [{}]안의 구문을 변수에 담아서 넣을 수 있음
                events:pt,
                
                
                eventClick:function(info){
                	let event = info.event; // 클릭한 일정 정보 가져오기
                	
                	console.log(event);
                	let name = event.name; // calUserName
                	let color = event.color;    
                	let start = event.start;
                	let end = event.end;
                	let phoneNumber = event.phoneNumber; // calPhone
                	let id = event.id;                   // calNo
                	let organizer = event.organizer;     // writer
                	let title = event.title;
                	let description = event.description;  // content
                	
                	console.log(calUserName , color , start, end, calPhone, writer, title,content);
                	
                	//if(start != null && end != null){
                		$("#myModal3 input[id='calUserName']").val(event.extendedProps.name);
	                	$("#myModal3 input[id='calColor']").val(event.extendedProps.color);
	                	$("#myModal3 input[id='startDate']").val(start.toLocaleDateString());
	                	$("#myModal3 input[id='endDate']").val(end == null ? start.toLocaleDateString() : end.toLocaleDateString());
	                	$("#myModal3 input[id='calPhone']").val(event.extendedProps.phoneNumber);
	                	$("#myModal3 input[id='writer']").val(event.extendedProps.organizer);
	                	$("#myModal3 input[id='title']").val(title);
	                	$("#myModal3 input[id='calNo']").val(id);
	                	$("#myModal3 textarea[id='content']").val(event.extendedProps.description);
	
	                	// 일정내용모달창 띄우기
	                	$("#myModal3").modal("show");
                	//}
                }
                
                });

                
                calendar.render();
        		
        	},
        	error:function(){
        		console.log("ajax통신실패");
        	}
        })
 	}	
 

            // PT일정등록 모달창 추가 버튼 클릭시 실행될 이벤트
            $("#insert_btn").on("click", function(){ 
            	$.ajax({
            		url:"<%=contextPath%>/insert.cal",
            		data:{
            			ptUserName:$("input[name='ptUserName']").val(),
            			calColor:$("input[name='calColor']").val(),
            			startDate:$("input[name='startDate']").val(),
            			endDate:$("input[name='endDate']").val(),
            			userPhone:$("input[name='userPhone']").val(),
            			writer:"<%=loginUser.getUserName()%>",
            			trNo:"<%=loginUser.getUserNo()%>",
            			title:$("input[name='title']").val(),
            			content:$("textarea[name='content']").val()
            		},
            		type:"post",
            		success:function(result){
            			console.log("pt일정등록 성공");
            			alert("일정 추가 완료되었습니다.");
            		},
            		error:function(){
            			console.log("pt일정등록 ajax 통신실패");
            			alert("일정 추가가 실패하였습니다.");
            		}
            	})
            })


            // 수정버튼 클릭시 실행될 함수
            function calendarUpdate(){
            	
            	$.ajax({
            		url:"<%=contextPath%>/update.cal",
            		data:{
            			calNo:$("#myModal3 input[id='calNo']").val(), // 166
            			calUserName:$("#calUserName").val(),
            			calColor:$("#calColor").val(),
            			startDate:$("#startDate").val(),
            			endDate:$("#endDate").val(),
            			calPhone:$("#calPhone").val(),
            			title:$("#title").val(),
            			contnet:$("#content").val(),
            			trNo:"<%=loginUser.getUserNo()%>"  // 15
            		},
            		type:"post",
            		success:function(result){
            			console.log(result);
            			alert("일정을 수정하였습니다.");
            		},
            		error:function(){
            			console.log("일정수정 ajax 통신 실패");
            		}
            	})
            	
            }
            
            
            
            // 삭제 버튼 클릭시 실행될 함수
				function calendarDelete(){
		            if(confirm("정말로 삭제하시겠습니까?")){
		            	$.ajax({
		            		url:"<%=contextPath%>/delete.cal",
		            		data:{calNo:$("#myModal3 input[id='calNo']").val()}, //{calNo:$("#calNo").val()},  
		            		type:"get",
		            		success:function(result){
		            			console.log(result);
		            				alert("일정을 삭제하였습니다.");
		            		},
		            		error:function(){
		            			console.log("일정삭제 ajax 통신 실패");
		            			alert("일정 삭제에 실패하였습니다.");
		            		}
		            	})
	            }
            } 
            
            // 회원조회 실행 함수
            $("#modal-footer-btn").on("click", function(){
            	$.ajax({
            		url:"<%=contextPath%>/searchList.cal",
            		data:{
            			searchPhone:$("input[name='searchPhone']").val(),
            			searchUserName:$("input[name='searchUserName']").val(),
            			searchStartDate:$("input[name='searchStartDate']").val(),
            			searchEndDate:$("input[name='searchEndDate']").val(),
            			trNo:"<%=loginUser.getUserNo()%>"
            		},
            		type:"post",
            		success:function(searchList){
            			console.log(searchList);
            			
                		let pt = [];
                		for(let i=0; i<searchList.length;i++){
                			pt.push({
                				id : searchList[i].calNo,						// 일정번호
                				title : searchList[i].calTitle,					// 제목
                				start : searchList[i].startDate,				// 시작일
                				end : searchList[i].endDate,					// 종료일
                				color : searchList[i].calColor,  				// 일정색상
                				phoneNumber : searchList[i].calPhone,			// 회원 핸드폰번호
                				organizer : searchList[i].writer,   			// 작성자(로그인한트레이너이름)
                				name : searchList[i].calUserName,				// pt회원이름 
                				description : searchList[i].calContent			// 내용
                				
                			});
                		}
                		
                		
                		
                        var calendarEl = document.getElementById('calendar');
                        var calendar = new FullCalendar.Calendar(calendarEl, {

                        headerToolbar : {
                            start : 'prev, next today',
                            center : 'title',
                            end : 'dayGridMonth, timeGridWeek, timeGridDay'
                        },
                        locale : 'ko',
                        selectable : true,
                        selectMirror : true,
                        eventLimit : 'more',
                        initialView: 'dayGridMonth',

                        events:pt,
                        
                        
                        eventClick:function(info){
                        	let event = info.event; 
                        	
                        	console.log(event);
                        	let name = event.name; // calUserName
                        	let color = event.color;    
                        	let start = event.start;
                        	let end = event.end;
                        	let phoneNumber = event.phoneNumber; // calPhone
                        	let id = event.id;                   // calNo
                        	let organizer = event.organizer;     // writer
                        	let title = event.title;
                        	let description = event.description;  // content
                        	
                        	console.log(calUserName , color , start, end, calPhone, writer, title,content);
                        	
                        	//if(start != null && end != null){
                        		$("#myModal3 input[id='calUserName']").val(event.extendedProps.name);
        	                	$("#myModal3 input[id='calColor']").val(event.extendedProps.color);
        	                	$("#myModal3 input[id='startDate']").val(start.toLocaleDateString());
        	                	$("#myModal3 input[id='endDate']").val(end == null ? start.toLocaleDateString() : end.toLocaleDateString());
        	                	$("#myModal3 input[id='calPhone']").val(event.extendedProps.phoneNumber);
        	                	$("#myModal3 input[id='writer']").val(event.extendedProps.organizer);
        	                	$("#myModal3 input[id='title']").val(title);
        	                	$("#myModal3 input[id='calNo']").val(id);
        	                	$("#myModal3 textarea[id='content']").val(event.extendedProps.description);
        	
        	                	// 모달창 띄우기
        	                	$("#myModal3").modal("show");
                        	//}
                        }
                        
                        });
                        calendar.render();
            			
            		},
            		error:function(){
            			console.log("회원조회 ajax통신 실패");
            		}
            	})
            	
            	
            })
            
            
            
            
            
            
            
            
            

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