<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01</title>
</head>
<body>

	<h1>jstl test01</h1>
	
	<br/>
	
	<span id="currentTime">test</span>
	
	<table border="1">
	    <tr>
	        <td>번호</td>
	        <td>이름</td>
	        <td>이메일</td>
	    </tr>
	    <c:forEach var="user" items="${users}">
	    <tr>
	        <td>${user.user_id}</td>
	        <td>${user.name}</td>
	        <td>${user.email}</td>
	        
	    </tr>  
	    </c:forEach>
	</table>
	
	
	

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){

	
	
});
	
</script>
	
</body>
</html>