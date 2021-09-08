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
	<a href="./test02">test page 2</a>
	
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
	
	<c:set var="code" value="data"/>
	<c:if test="${code eq 'data'}" var="code" scope="session">
		<p>~<c:out value="${code}"/>
	</c:if>
	<c:out value="${session.session}" /> 
	
	<p>https://starkying.tistory.com/entry/Servlet-JSP의-4가지-Scope</p>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){

	
	
});
	
</script>
	
</body>
</html>