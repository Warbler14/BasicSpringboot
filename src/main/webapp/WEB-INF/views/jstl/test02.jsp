<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02</title>
</head>
<body>

	<h1>jstl test02</h1>
	
	<br/>
	
	<c:choose>
		<c:when test="${sessionResult != null}">
			<p><c:out value="${sessionResult}"/>
		</c:when>
		<c:otherwise>
			<p>sessionResult is empty</p>
		</c:otherwise>
	</c:choose>
	

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){

	
	
});
	
</script>
	
</body>
</html>