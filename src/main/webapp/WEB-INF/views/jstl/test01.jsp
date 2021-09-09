<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01</title>
</head>
<body>

	<h1>jstl test01</h1>
	
	<c:out value="${session.session}" />
	
	
	<div style="width: 1000px;">
		<hr/>
		<p>Core Tags</p>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:out&gt;, &lt;c:set&gt;, &lt;c:if&gt;</span></p>
		<hr/>
		
		<c:set var="code" value="data"/>
		<c:if test="${code eq 'data'}" var="code" scope="session">
			<p>~<c:out value="${code}"/><p>
		</c:if>
		<p><a href="./test02">test page 2</a></p>
		
	</div>

	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:remove&gt;</span></p>
		<hr/>
	
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
		<p>Before Remove Value: <c:out value = "${year}"/></p>
		<c:remove var="year"/>
		<p>After Remove Value: <c:out value = "${year}"/></p>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:catch&gt;</span></p>
		<hr/>
		
		<c:catch var="catchException">
			<% int x = 5/0; %>
		</c:catch>
		
		<c:if test = "${catchException != null }">
			<p>The exception is : ${catchException } <br/>
			There is an exception : ${catchException.message }</p>
		</c:if>
	
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:choose&gt;, &lt;c:when&gt;, &lt;c:otherwise&gt;</span></p>
		<hr/>
		
		<fmt:formatDate var="minute" value="${now}" pattern="mm" />
		
		<c:choose>
			<c:when test="${ (minute % 10) < 2 }">
				<p>
					<span style="color: #FFA07A;">
						<c:out value="${minute}"/>
					</span>
				</p>
			</c:when>
			<c:when test="${ (minute % 10) < 4 }">
				<p>
					<span style="color: #E9967A;">
						<c:out value="${minute}"/>
					</span>
				</p>
			</c:when>
			<c:when test="${ (minute % 10) < 6 }">
				<p>
					<span style="color: #FA8072;">
						<c:out value="${minute}"/>
					</span>
				</p>
			</c:when>
			<c:when test="${ (minute % 10) < 8 }">
				<p>
					<span style="color: #F08080;">
						<c:out value="${minute}"/>
					</span>
				</p>
			</c:when>
			<c:when test="${ (minute % 10) < 10 }">
				<p>
					<span style="color: #CD5C5C;">
						<c:out value="${minute}"/>
					</span>
				</p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:import&gt;, &lt;c:param&gt;</span></p>
		<hr/>
	
		<div>
			<c:import var ="jsonTestValue" url="https://jsonplaceholder.typicode.com/todos/1"/>
			<c:out value="${jsonTestValue }!!"/>
			
		</div>
		<div>
			<c:import url="/jstl/importPage">
				<c:param name="string" value="text string"/>
				<c:param name="number" value="10000"/>
				<c:param name="json" value="${jsonTestValue }"/>
			</c:import>
		</div>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:forEach&gt;</span></p>
		<hr/>
	
		<ul>
		<c:forEach var="idx" begin="0" end="3" >
			<li><c:out value="${idx }"/></li>
		</c:forEach>
		</ul>
		
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
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:forTokens&gt;</span></p>
		<hr/>
	
		<ul>
		<c:forTokens items="Ape,Beaver,Crab,Deer,Eagle,Frog,Goat,Horse" delims="," var="names" >
			<li><c:out value="${names }"/></li>
		</c:forTokens>
		</ul>
		
	</div>

	<%-- 
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:redirect&gt;</span></p>
		<hr/>
		<c:redirect url="/jstl/test02"/>
	</div>
	--%>

	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;c:url&gt;</span></p>
		<hr/>
	
		<c:url value="/testUrl" var="testURL">
			<c:param name="id" value="id01"/>
		</c:url>
		<c:out value="${testURL }"/>
	<%-- 
		<c:out value="${pageContext.request.contextPath }"/>
		<c:out value="${pageContext.serveltContext.contextPath }"/>
	--%>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p>참고</p>
		<hr/>
		<p>https://www.tutorialspoint.com/jsp/jsp_standard_tag_library.htm</p>
		<p>https://starkying.tistory.com/entry/Servlet-JSP의-4가지-Scope</p>
		<hr/>
	</div>

<script type="text/javascript">
var entityMap = {
		  '&': '&amp;',
		  '<': '&lt;',
		  '>': '&gt;',
		  '"': '&quot;',
		  "'": '&#39;',
		  '/': '&#x2F;',
		  '`': '&#x60;',
		  '=': '&#x3D;'
		};

function escapeHtml (string) {
  return String(string).replace(/[&<>"'`=\/]/g, function fromEntityMap (s) {
    return entityMap[s];
  });
}

document.addEventListener("DOMContentLoaded", function(){

	//var cOutSet = document.getElementById("cOutSet");
	//var g = escapeHtml("<c : >");
	//cOutSet.innerText = "abc" ;
	
});
	
</script>
	
</body>
</html>