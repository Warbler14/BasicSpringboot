<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XML Tags</title>
</head>
<body>

	<h1>XML Tags</h1>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:parse&gt;, &lt;x:out&gt;</span></p>
		<hr/>
		
		<c:set var = "xmltext">
			<books>
				<book>
					<name>Padam History</name>
					<author>ZARA</author>
					<price>100</price>
				</book>
				
				<book>
					<name>Great Mistry</name>
					<author>NUHA</author>
					<price>2000</price>
				</book>
			</books>
		</c:set>
		
		<x:parse xml = "${xmltext}" var="output"/>
		<b>The title of the first book is</b>:
		<x:out select = "$output/books/book[1]/name"/>
		<br>
	
		<b>The price of the second book</b>:
		<x:out select = "$output/books/book[2]/price"/>
		
		<hr/>
		
		<c:import var = "bookInfo" url = "http://localhost:8081/jstl/books"/>
		
		<div>
			<c:out value="${bookInfo}"/>		
		</div>
		
		<x:parse xml = "${bookInfo}" var = "output"/>
		<b>The title of the first book is</b>: 
	    <x:out select = "$output/List/item[1]/name" />
	    <br>
	      
	    <b>The price of the second book</b>: 
	    <x:out select = "$output/List/item[2]/price" />
		
		
	</div>
	
	
	

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function(){

	
});
	
</script>
	
</body>
</html>