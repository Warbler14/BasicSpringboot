<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formatting Tags</title>
</head>
<body>

	<h1>Formatting Tags</h1>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:formatNumber&gt;</span></p>
		<hr/>
		
		<c:set var = "balance" value = "120000.2309" />
         
		<p>Formatted Number (1): <fmt:formatNumber value = "${balance}" 
		   type = "currency"/></p>
		   
		<p>Formatted Number (2): <fmt:formatNumber type = "number" 
		   maxIntegerDigits = "3" value = "${balance}" /></p>
		   
		<p>Formatted Number (3): <fmt:formatNumber type = "number" 
		   maxFractionDigits = "3" value = "${balance}" /></p>
		   
		<p>Formatted Number (4): <fmt:formatNumber type = "number" 
		   groupingUsed = "false" value = "${balance}" /></p>
		   
		<p>Formatted Number (5): <fmt:formatNumber type = "percent" 
		   maxIntegerDigits="3" value = "${balance}" /></p>
		   
		<p>Formatted Number (6): <fmt:formatNumber type = "percent" 
		   minFractionDigits = "10" value = "${balance}" /></p>
		   
		<p>Formatted Number (7): <fmt:formatNumber type = "percent" 
		   maxIntegerDigits = "3" value = "${balance}" /></p>
		   
		<p>Formatted Number (8): <fmt:formatNumber type = "number" 
		   pattern = "###.###E0" value = "${balance}" /></p>
		   
		<p>Currency in USA :
		   <fmt:setLocale value = "en_US"/>
		   <fmt:formatNumber value = "${balance}" type = "currency"/>
		</p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:parseNumber&gt;</span></p>
		<hr/>
		
		<c:set var = "balance" value = "1250003.350" />

		<fmt:parseNumber var = "i" type = "number" value = "${balance}" />
		<p>Parsed Number (1) : <c:out value = "${i}" /></p>
		<fmt:parseNumber var = "i" integerOnly = "true" 
		   type = "number" value = "${balance}" />
		<p>Parsed Number (2) : <c:out value = "${i}" /></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:formatDate&gt;</span></p>
		<hr/>
		
		<c:set var = "now" value = "<%= new java.util.Date()%>" />

		<p>Formatted Date (1): <fmt:formatDate type = "time" value = "${now}" /></p>
		
		<p>Formatted Date (2): <fmt:formatDate type = "date" value = "${now}" /></p>
		
		<p>Formatted Date (3): <fmt:formatDate type = "both" value = "${now}" /></p>
		
		<p>Formatted Date (4): <fmt:formatDate type = "both" 
		   dateStyle = "short" timeStyle = "short" value = "${now}" /></p>
		
		<p>Formatted Date (5): <fmt:formatDate type = "both" 
		   dateStyle = "medium" timeStyle = "medium" value = "${now}" /></p>
		
		<p>Formatted Date (6): <fmt:formatDate type = "both" 
		   dateStyle = "long" timeStyle = "long" value = "${now}" /></p>
		
		<p>Formatted Date (7): <fmt:formatDate pattern = "yyyy-MM-dd" 
		   value = "${now}" /></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:parseDate&gt;</span></p>
		<hr/>
		
		<c:set var = "now" value = "14-09-2021" />
		
		<fmt:parseDate value = "${now}" var = "parsedEmpDate" pattern = "dd-MM-yyyy" />
		<p>Parsed Date: <c:out value = "${parsedEmpDate}" /></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:bundle&gt;</span></p>
		<hr/>
		
		<fmt:bundle basename = "com.tutorialspoint.Example" prefix = "count.">
			<fmt:message key = "one"/><br/>
			<fmt:message key = "two"/><br/>
			<fmt:message key = "three"/><br/>
		</fmt:bundle>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:setLocale&gt;</span></p>
		<hr/>
		
		<fmt:bundle basename = "com.tutorialspoint.Example">
			<fmt:message key = "count.one"/><br/>
			<fmt:message key = "count.two"/><br/>
			<fmt:message key = "count.three"/><br/>
		</fmt:bundle>
		
		<!-- Change the Locale -->
		<fmt:setLocale value = "es_ES"/>
		<fmt:bundle basename = "com.tutorialspoint.Example">
			<fmt:message key = "count.one"/><br/>
			<fmt:message key = "count.two"/><br/>
			<fmt:message key = "count.three"/><br/>
		</fmt:bundle>

	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:setBundle&gt;</span></p>
		<hr/>
		
		<fmt:setLocale value = "en"/>
		<fmt:setBundle basename = "com.tutorialspoint.Example" var = "lang"/>
		
		<fmt:message key = "count.one" bundle = "${lang}"/><br/>
		<fmt:message key = "count.two" bundle = "${lang}"/><br/>
		<fmt:message key = "count.three" bundle = "${lang}"/><br/>

	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:requestEncoding&gt;</span></p>
		<hr/>
		
		<fmt:requestEncoding value = "UTF-8" />
		<fmt:setLocale value = "es_ES"/>
		<fmt:setBundle basename = "com.tutorialspoint.Example" var = "lang"/>
		
		<fmt:message key = "count.one" bundle = "${lang}"/><br/>
		<fmt:message key = "count.two" bundle = "${lang}"/><br/>
		<fmt:message key = "count.three" bundle = "${lang}"/><br/>

	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span id="cOutSet">&lt;fmt:timeZone&gt;</span></p>
		<hr/>
		
		<c:set var = "now" value = "<%= new java.util.Date()%>" />
		
		<table border = "1" width = "100%">
         <tr>
            <td width = "100%" colspan = "2" bgcolor = "#0000FF">
               <p align = "center">
                  <b>
                     <font color = "#FFFFFF" size = "4">Formatting:
                        <fmt:formatDate value = "${now}" type = "both"
                        timeStyle = "long" dateStyle = "long" />
                     </font>
                  </b>
               </p>
            </td>
         </tr>

         <c:forEach var = "zone"
            items = "<%= java.util.TimeZone.getAvailableIDs()%>">
            <tr>
               <td width = "51%">
                  <c:out value = "${zone}" />
               </td>
               <td width = "49%">
                  <fmt:timeZone value = "${zone}">
                  <fmt:formatDate value = "${now}" timeZone = "${zn}"
                     type = "both" />
                  </fmt:timeZone>
               </td>
            </tr>
         </c:forEach>
      </table>

	</div>

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function(){

	
});
	
</script>
	
</body>
</html>