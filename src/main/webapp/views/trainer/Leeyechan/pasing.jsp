<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mzymPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	 <td class="section2" id="paging" >
                <ul class="pagination" >
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>

                    <li class="page-item active"><a class="page-link" href="<%=mzymPath%>/paging.trainer?page=1&board=notice">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>

                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
            </td>
	
	
</body>
</html>