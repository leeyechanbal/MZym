<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mzym.serviceBoard.vo.ServiceCategory"%>
<%@ page import="java.util.List"%>  
<%

List<ServiceCategory> list = (List<ServiceCategory>)request.getAttribute("list");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 글작성</title>
	<style>
    
        .center{display:flex; justify-content: center; align-items: center;}
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

        .btn1{
            border: 1px solid #eee;
            color: #000;
        }
        .btn2{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
        }
        .btn3{
            border: 1px solid #eee;
            color: #000;
            float: right;
            overflow: hidden;
            margin-right: 10px;
        }

        input[type=file]::file-selector-button {
        width: 100px;
        height: 30px;
        background: #1abc9c;
        border: none;
        color : white;
        cursor: pointer;
        }
       
        
        .category{
            width: 20%;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        
	</style>
</head>

<body>
	<div class="wrap">
	<%@ include file="/views/common/Mzym_header.jsp" %>
	
	      
      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          	<div class="board_content">
            <h2>고객센터</h2>
            <hr>
            <br><br>

            <div class="backgray">             
            <form  action="<%=contextPath %>/insert.service" method="post" enctype="multipart/form-data">

                <select class="category" name="ServiceCategory">
                <%for(ServiceCategory c : list){ %>
                    <option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                <%} %>
                </select>
		
                <input type="text" class="form-control" required placeholder="제목 입력" name="title">
                <table class="table">
                    <tr>
                        <form method="post">
                            <textarea id="summernote" name="content" placeholder="글 내용 입력"></textarea>
                        </form>
                    </tr>
                    <tr>
                        <td>
                            <input type="file" class="form-control-file border" name="upfile">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn1 btn-outline-secondary btn-sm" onclick="history.back();">목록</button>
                            <button type="reset" class="btn2 btn-outline-danger btn-sm">취소</button>
                            <button type="submit" class="btn3 btn-outline-secondary btn-sm">등록</button>
                        </td>
                    </tr>
		                </table>
		            </form>
		        </div>
		    </div>
		     <script>
			        $(document).ready(function () {
			        $('#summernote').summernote({
			            placeholder: '내용을 작성하세요',
			            height: 400,
			            maxHeight: 400
			        });
			    });
    		</script>   	

          
		</section>
        <!-- Section end -->
        
	<%@ include file="/views/common/Mzym_footer.jsp" %>
	</div>
</body>
</html>