<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mzym.member.model.vo.Member"%>    
  
<%@ page import="com.mzym.board.vo.Board"%>    
<%
List<Member> trList = (List<Member>)request.getAttribute("trList"); 
List<Board> List1 = (List<Board>)request.getAttribute("List1"); 
List<Board> List2 = (List<Board>)request.getAttribute("List2"); 

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
    .homePage_content{ /*메인 영역*/
    border: 2px solid #1ABC9C;
    width: 100%;
    margin: auto;
    margin-top: 50px;
    min-height: 1200px;
    padding: 50px;
    border-radius: 10px;
    display: flex;
  }
    .trainerInfo{
    
    width: 100%;
    height: 100%;
    margin: 50px auto;
    min-height: 1200px;
    padding: 50px;
    }
    .boardInfo{
    width: 100%;
    height: 100%;
    margin: auto;
    min-height: 1200px;
    padding: 50px;
    }

    .boardInfo tr{
      width: 100%;
      text-align: center;
      font-size: small;
      vertical-align: middle;
    }
    .noticeArea{
      
      width: 100%;
      height: 100%;
      margin: 50px auto;
      min-height: 600px;
     
    }

    .boardArea{
      
      width: 100%;
      height: 100%;
      margin: 50px  auto;
      min-height: 600px;
   
    }
    .trainerArea{
      border: 2px solid #1ABC9C;
      width: 100%;
      height: 100%;
      margin: auto;
      min-height: 1200px;
      border-radius: 10px;
      display: flex;
      flex-direction: column;
      padding: 50px;
    }
    .trainerTitle{
      margin: 10px;
      width: 100%;
      text-align: center;
    }
   .trainer-wrapper{
    width: 100%;
    height: 100%;
    overflow: hidden;
    min-height: 1200px;
    border-radius: 10px;

   }
   .trainerImg img{
    min-height: 1200px;
   }
   .text-area li{
    list-style: none;
    display: flex;
    flex-direction: column;
    text-align: right;
    
   }
   .text-area h5{
      text-align: right;
      margin-left: 20px;
      margin-top: 50px;
   }
   .text-area h3{
      text-align: left;
      margin-left: 20px;
      margin-top: 50px;
   }
  
  tbody tr:hover {
    background-color: #1abc9c;
    cursor: pointer;
  }
  </style>
</head>
<body>
	
	<div class="wrap">

        <%@ include file="/views/common/Mzym_header.jsp" %>
        <%@ include file="/views/common/Mzym_banner.jsp" %>
	
	      
      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          <div class="homePage_content">
            <div class="trainerInfo">
             
              <div class="trainerArea">

                <div class="trainerTitle"><span><h3>퍼스널 트레이너 소개</h3></span></div>
                 
                <div class="trainer-wrapper">

                <div id="trainer" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
					<ul class="carousel-indicators">
					    <% for(int i = 0; i < trList.size(); i++) { %>
					        <li data-target="#trainer" data-slide-to="<%= i %>" class="<%= i == 0 ? "active" : "" %>"></li>
					    <% } %>
					</ul>
					
					<!-- The slideshow -->
					<div class="carousel-inner trainerImg">
					    <% for(int i = 0; i < trList.size(); i++) { %>
					        <div class="carousel-item <%= i == 0 ? "active" : "" %>">
					            <img src="<%= contextPath %>/resources/img/common/트레이너 이미지 샘플.png" alt="트레이너 이미지1">
					            <!--<img src="<%= contextPath + "/" + trList.get(i).getImageURL() %>" alt="트레이너 이미지">-->
					            <div class="carousel-caption d-none d-md-block text-area">
					                <h3><%= trList.get(i).getUserName() %> 트레이너</h3>
					                <div>
					                    <h5>자격증 및 수료증</h5>
					                    <ul>
					                        <li><%= trList.get(i).getCertificate() %></li>
					                    </ul>
					                    <ul>
					                        <li><%= trList.get(i).getTrCareer() %></li>
					                    </ul>
					                </div>
					            </div>
					        </div>
					    <% } %>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#trainer" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#trainer" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					</a>
                </div>
                </div>
              </div>
            </div>
            <div class="boardInfo">
                <div class="noticeArea">
                  <div style="text-align: center; margin-bottom: 50px;"><span><h3>자유게시판</h3></span></div>
                  <table class="table" id="freeBoard_list">
                    <thead>
                      <tr>
                      <th width="15%">글번호</th>
                      <th width="40%">글제목</th>
                      <th width="15%">작성자</th>
                      <th width="15%">조회수</th>
                      <th width="15%">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%for(Board b: List1){ %>
                      <tr>
                        <td><%=b.getBoardNo() %></td>
                        <td><%=b.getBoardTitle() %></td>
                        <td><%=b.getBoardMember() %></td>
                        <td><%=b.getCount() %></td>
                        <td><%=b.getRegist_Date() %></td>
                      </tr>
                     <%} %>
                    </tbody>

                  </table>
        			   <script>
			            $(function(){
			                $("#freeBoard_list>tbody>tr").click(function(){
			                	location.href = "<%=contextPath%>/freedetail.bo?no=" + $(this).children().eq(0).text();
			                })
			            })
			            </script>
                </div>
                
                <div class="boardArea">
                  <div style="text-align: center; margin-bottom: 50px;"><span><h3>질문게시판</h3></span></div>
                  <table class="table">
                    <thead>
                      <tr>
                      <th width="15%">글번호</th>
                      <th width="40%">글제목</th>
                      <th width="15%">작성자</th>
                      <th width="15%">조회수</th>
                      <th width="15%">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%for(Board b: List2){ %>
                      <tr>
                        <td><%=b.getBoardNo() %></td>
                        <td><%=b.getBoardTitle() %></td>
                        <td><%=b.getBoardMember() %></td>
                        <td><%=b.getCount() %></td>
                        <td><%=b.getRegist_Date() %></td>
                      </tr>
                     <%} %>
                    </tbody>

                  </table>
                
                </div>
            
              </div>

        </div>
      </section>
      <!--section end-->

        <%@ include file="/views/common/Mzym_footer.jsp" %>

    </div>
</body>
</html>