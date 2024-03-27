<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mzym.mypage.model.vo.Food" %>
<%
	List<Food> list = (List<Food>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단관리</title>
<style>

    /*마이페이지 style*/
    .mypage_content{
        margin: auto;
        width: 90%;
    }

    .food_date{
        margin-left: 28%;
        margin-top: 10%;
    }

    .food_list{
        display: flex;
        flex-direction: row;
        margin-left: 20%;
    }

    .diet_food{
    border: 2px solid #1ABC9C;
    margin: 100px;
    height: 50%;
    padding: 40px;
    border-radius: 10px;
    min-width: 325px;
    }

    .food1>diV{margin-bottom:10%;}
    .food2>div{margin-bottom:10%;}
    .diet_food>ul{list-style: ""; padding-left: 15px;}

    #icon{ background: none; border: none;}
    #icon_large{font-size: x-large;}

    #icon1{
        background: none;
        border: none;
        color: #1ABC9C;
    }

    .ext{
        font-size:x-large;
        margin-left: 10px;
    }

    .kcal{
        display: flex;
        flex-direction: column;
        margin-left: 50%;
        margin-top: 25%;
    }

    .kcal input[type=text]{margin: 10px; width: 35%; margin-right: 150px;}
    .kcal th{font-size: large;}


    /*모달 style*/
    #btn1{
        background: #1ABC9C;
        color: white;
        font-weight: bold;
        border-radius: 5px;
        border: none;
        width: 90px;
        height: 38px;
    }
    #btn2{
        background:#e0e0e0;
        color: black;
        font-weight: bold;
        border-radius: 5px;
        border: none;
        width: 90px;
        height: 38px;
    }
    .modal-body input[type=text]{margin: 15px; height: 50px;}
    .modal-title{font-weight: bold; color: #1ABC9C;} 
</style>
</head>
<body>
  <div class="wrap">

    <%@ include file="/views/common/Mzym_header.jsp"%>
    
    <%@ include file="/views/common/Mzym_sidebar.jsp"%>
    
    <!--section start-->    
    <section class="main_content">

        <%@ include file="/views/common/mypage_sidemenu.jsp"%>

        <div class="mypage_content">
            <form action="<%=contextPath%>/dietmenu.me" method="">  

                <div class="food_date">   
                    <h3>
                        <span id="today"></span>
                    </h3>
                </div>
                
                <script>
	                date = new Date();
			        year = date.getFullYear();
			        month = ('0' + (date.getMonth() +  1 )).slice(-2);
			        day = ('0' + date.getDate()).slice(-2);
			        document.getElementById("today").innerHTML = year + "년 " + month + "월 " + day + "일";
                	
                </script>
               
                <div class="food_list">

                    <div class="food1">

                        <div class="diet_food">
                            <ul id="ul1">
                                <li style="margin-left: 10px;"><i class="fas fa-clock" id="icon_large"><span class="ext">아침식사</span></i></li>
	                            <li>
	                            	<%for(Food f : list) { %>
	                            		<%if(f.getFoodCategory().equals("1")) { %>
		                                    <li name=<%=f.getFoodNo()%>>
		                                    	<%= f.getFoodName()%> <%= f.getFoodCal() %> kcal
		                                    	<button type="button" class="btn fas fa-trash"  id="icon1" onclick="deleteMenu();"></button></li>
	                                	<% } %>
	                                <% } %>
	                            </li>
                            </ul>           
                            <table>
                                <tr>
                                    <td>
                                        <a class="btn fas fa-plus" onclick="setValue1();" id="icon_large"data-toggle="modal" data-target="#plusKcal"></a>
                                        <span class="ext">추가하기</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td> <input type="text" class="form-control" id="totalKcal1" readonly></td>
                                </tr>
                             </table>
                        </div>

                        <div class="diet_food">
                            <ul id="ul2">
                                <li style="margin-left: 10px;"><i class="fas fa-clock" id="icon_large"><span class="ext">저녁식사</span></i></li>
                                <li>
                                	<%for(Food f : list) { %>
                                		<%if(f.getFoodCategory().equals("3")) { %>
		                                	<li name=<%=f.getFoodNo()%>>
			                                	<%= f.getFoodName()%> <%= f.getFoodCal() %> kcal
			                                	<button type="button" class="btn fas fa-trash" id="icon1" onclick="deleteMenu();"></button></li>
	                               		 <% } %>
	                                <% } %>
                                 </li>
                            </ul>
                            <table>
                                <tr>
                                    <td>
                                        <a class="btn fas fa-plus" onclick="setValue3();" id="icon_large"data-toggle="modal" data-target="#plusKcal"></a>
                                        <span class="ext">추가하기</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td> <input type="text" class="form-control" id="totalKcal2" readonly></td>
                                </tr>
                             </table>         
                        </div>

                    </div>

                    <div class="food2">

                        <div class="diet_food">
                            <ul id="ul3">
                                <li style="margin-left: 10px;"><i class="fas fa-clock" id="icon_large"><span class="ext">점심식사</span></i></li>
                                <li>
                                	<%for(Food f : list) { %>
                                		<%if(f.getFoodCategory().equals("2")) { %>
		                                	<li name=<%=f.getFoodNo()%>>
			                                	<%= f.getFoodName()%> <%= f.getFoodCal() %> kcal
			                                	<button type="button" class="btn fas fa-trash" id="icon1" onclick="deleteMenu();"></button></li>
	                               		 <% } %>
	                                <% } %>
                                </li>
                            </ul>
                            <table>    
                                <tr>
                                    <td>
                                        <a class="btn fas fa-plus" onclick="setValue2();" id="icon_large"data-toggle="modal" data-target="#plusKcal"></a>
                                        <span class="ext">추가하기</span>
                                    </td>
                                <tr>
                                    <td><input type="text" class="form-control" id="totalKcal3" readonly></td>
                                </tr>
                             </table>  
                        </div>
    
                        <div class="diet_food">
                            <ul id="ul4">
                                <li style="margin-left: 10px;"><i class="fas fa-clock" id="icon_large"><span class="ext">간식</span></i></li>
                                <li>
                                	<%for(Food f : list) { %>
                                		<%if(f.getFoodCategory().equals("4")) { %>
		                                	<li name=<%=f.getFoodNo()%>>
			                                	<%= f.getFoodName()%> <%= f.getFoodCal() %> kcal
			                                	<button type="button" class="btn fas fa-trash" id="icon1" onclick="deleteMenu();"></button></li>
	                               		 <% } %>
	                                <% } %>
                                </li>
                            </ul>
                            <table>
                                <tr>
                                    <td>
                                        <a class="btn fas fa-plus" onclick="setValue4();" id="icon_large"data-toggle="modal" data-target="#plusKcal"></a>
                                        <span class="ext">추가하기</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td> <input type="text" class="form-control" id="totalKcal4" readonly></td>
                                </tr>
                             </table>  
                        </div>

                    </div>
                
                </div>
                
                <!-- 식단 삭제, 각 총합칼로리 조회와 삭제/추가시 칼로리 업데이트 -->
                <script>
                    function deleteMenu(){
                    	var parentLi = event.target.parentElement;  
                        var liName = parentLi.getAttribute("name");
                    	console.log(liName);
                        $.ajax({
                            url:"<%=contextPath%>/deletemenu.me",
                            data:{
                                foodNo:liName
                            },
                            type:"post",
                            success:function(){
                            	console.log("성공");
                            	parentLi.remove();
                            	calculateTotalKcal();
                            	calculateTodayTotalKcal();
                            },
                            error:function(){
                                console.log("실패");
                            }
                        });
                    }
                    
                    window.onload = function() { //ul 과 input 아이디 불러오기
                        calculateTotalKcal('ul1', 'totalKcal1');
                        calculateTotalKcal('ul2', 'totalKcal2');
                        calculateTotalKcal('ul3', 'totalKcal3');
                        calculateTotalKcal('ul4', 'totalKcal4');
                    };
                    
                    function calculateTotalKcal() {
                    	
                        var uls = ['ul1', 'ul2', 'ul3', 'ul4'];
                        
                        uls.forEach(function(ulId) {
                        	
                            var totalKcal = 0;
                            
                            document.querySelectorAll('#' + ulId + ' li[name]').forEach(function(li) {
                                
                            	var textContent = li.textContent.trim();
                                var kcalMatch = textContent.match(/\d+\s*kcal/);
                                
                                if (kcalMatch !== null) {
                                    var kcal = parseInt(kcalMatch[0].replace(/\D/g, ""));
                                    totalKcal += kcal;
                                }
                            });
                            
                            var inputId = 'totalKcal' + ulId.substr(2);
                            document.getElementById(inputId).value = totalKcal + ' kcal';
                        });
                        
                        
                    }
                    
                    window.onload = function() {
                        calculateTotalKcal(); // 페이지가 로드될 때 총 칼로리 계산
                        calculateTodayTotalKcal(); // 페이지가 로드될 때 오늘 섭취한 총 칼로리 계산
                    };

                    function calculateTodayTotalKcal() {
                        var totalTodayKcal = 0; // 오늘 섭취한 총 칼로리

                        // 각 ul의 총 칼로리를 가져와 더하기
                        document.querySelectorAll('input[id^="totalKcal"]').forEach(function(input) {
                            var kcal = parseInt(input.value.replace(/\D/g, ""));
                            totalTodayKcal += kcal;
                        });

                        document.getElementById('todayKcal').value = totalTodayKcal + ' kcal';
                    }
                    
                </script>
                
             

                <div class="kcal">
                    <table>
                        <tr>
                            <th>오늘의 섭취 칼로리 : </th>
                            <td><input type="text" id="todayKcal" readonly></td>
                        </tr>
                    </table>
                </div>

            </form>
            

            <!-- 추가하기 모달창 -->
            <div class="modal" id="plusKcal">
                <div class="modal-dialog">
                    <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h3 class="modal-title">메뉴명/칼로리 수기입력</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                    	<form action="<%= contextPath%>/insertmenu.me" method="post">
	                        <table align="center">
	                            <tr>
	                                <td><input type="text" class="form-control" name="menu" placeholder="메뉴명"></td>
	                            </tr>
	                            <tr>
	                                <td><input type="text" class="form-control" name="kcal" placeholder="칼로리(숫자만입력하세요)"></td>
	             
	                            </tr>
	                            <tr>
		                            <td><input type="hidden" vlaue="" id="foodcategory" name="category"></td>
		                           
	                            </tr>
	                            <tr>
	                                <td colspan="2" style="text-align: center; padding-top: 10px;">
	                                    <button type="button" data-dismiss="modal" id="btn2">취소</button>
	                                    <button type="submit" id="btn1">입력</button>
	                                </td>
	                            </tr>
	                        </table>
                        </form>
                        
                        <!-- 식단관리 추가부분 script -->
                        <script>
							function setValue1() {
							    document.getElementById("foodcategory").value = 1;
							}
							
							function setValue2() {
							    document.getElementById("foodcategory").value = 2;
							}
							
							function setValue3() {
							    document.getElementById("foodcategory").value = 3;
							}
							
							function setValue4() {
							    document.getElementById("foodcategory").value = 4;
							}
							</script>
							
                    </div>
                </div>
                </div>
            </div>
            
            
        </div>
       

    </section>
    <!--section end-->

    <%@ include file="/views/common/Mzym_footer.jsp"%>


</div>
</body>
</html>