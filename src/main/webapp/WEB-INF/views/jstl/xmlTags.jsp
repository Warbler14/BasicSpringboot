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
	
	<c:set var = "book">
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
			
			<book>
				<name>Practical Guide for JSP Programmers</name>
				<author>Morgan Kaufmann</author>
				<price>2004</price>
			</book>
		</books>
	</c:set>
	
		
		
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:parse&gt;, &lt;x:out&gt;</span></p>
		<hr/>
		
		<x:parse xml = "${book}" var="output"/>

		<b>The title of the first book is</b>:
		<x:out select = "$output/books/book[1]/name"/>
		<br>
	
		<b>The price of the second book</b>:
		<x:out select = "$output//book[2]/price"/>
		
		<hr/> <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		
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
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:set&gt;, &lt;x:if&gt;</span></p>
		<hr/>
		
		<x:parse xml="${book}" var="output" />
		<x:set var="fragment" select = "$output/books/book[2]/price"/>
		
		<b>The price of Great Mistry</b>: 
     	<x:out select = "$fragment" />
     	
     	<x:if select = "$output//book">
     		<span>Document has a least on &lt;book&gt; element.</span>
     	</x:if>
     	
     	<x:if select = "$output/books/book[2]/price > 1000">
     		<span>Book prices are ofver 1,000</span>
     	</x:if>
      
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:forEach&gt;</span></p>
		<hr/>
		
		<ul class =  "list">
			<x:forEach select = "$output/books/book/name" var = "item">
				<li>Book Name : <x:out select = "$item" /></li>
			</x:forEach>
		</ul>
      
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:choose&gt;, &lt;x:when&gt;, &lt;x:otherwise&gt;</span></p>
		<hr/>
		
		<x:choose>
			<x:when select = "$output//book/author = 'Morgan Kaufmann'">
				Book is written by Morgan Kaufmann
			</x:when>
			
			<x:when select = "$output//book/author = 'MUHA'">
				Book is written by MUHA
			</x:when>
			
			<x:otherwise>
				Unknown auther.
			</x:otherwise>
		
		</x:choose>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:transform&gt;</span></p>
		<hr/>
		
		<c:import url = "/static/xsl/style.xsl" var = "xslt"/>
		<x:transform xml = "${output}" xslt = "${xslt}"/>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;x:transform&gt;, &lt;x:param&gt;</span></p>
		<hr/>
		
		<c:import url = "/static/xsl/style2.xsl" var = "xslt"/>
		<x:transform xml = "${output}" xslt = "${xslt}">
			<x:param name = "bgColor" value = "grey"/>
		</x:transform>
		
	</div>
	

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function(){

	
});
	
</script>
	
</body>
</html>