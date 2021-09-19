<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Functions</title>
</head>
<body>

	<h1>JSTL Functions</h1>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:contains</span></p>
		<hr/>
	
		<c:set var = "testString" value = "I am a test String"/>
		
		<c:if test = "${fn:contains(testString, 'test')}">
			<span>Found test string</span>
		</c:if>
		
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:containsIgnoreCase</span></p>
		<hr/>
	
		<c:set var = "testString" value = "I am a test String"/>
		
		<c:if test = "${fn:containsIgnoreCase(testString, 'test')}">
			<span>Found test string</span>
		</c:if>
		
		<c:if test = "${fn:containsIgnoreCase(testString, 'TEST')}">
			<span>Found TEST string</span>
		</c:if>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:containsIgnoreCase</span></p>
		<hr/>
	
		<c:set var = "testString" value = "I am a test String 123"/>
		
		<c:if test = "${fn:endsWith(testString, '123')}">
			<span>Found test string</span>
		</c:if>
	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:containsIgnoreCase</span></p>
		<hr/>
	
		<c:set var = "string1" value = "This is first String."/>
		<c:set var = "string2" value = "This <abc>is second String.</abc>"/>
		
		<p>With escapeXml() Function:</p>
		<p>string (1) : ${fn:escapeXml(string1)}</p>
		<p>string (2) : ${fn:escapeXml(string2)}</p>
		
		<p>Without escapeXml() Function:</p>
		<p>string (1) : ${string1}</p>
		<p>string (2) : ${string2}</p>

	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:indexOf</span></p>
		<hr/>
	
		<c:set var = "string1" value = "This is first String."/>
		<c:set var = "string2" value = "This <abc>is second String.</abc>"/>
		<p>Index (1) : ${fn:indexOf(string1, "first")}</p>
		<p>Index (2) : ${fn:indexOf(string2, "second")}</p>

	</div>
	
	<div style="width: 1000px;">
		<hr/>
		<p><span>fn:split, fn:join</span></p>
		<hr/>
	
		<c:set var = "string1" value = "This is first String" />
		<c:set var = "string2" value = "${fn:split(string1, ' ') }"/>
		<c:set var = "string3" value = "${fn:join(string2, '-') }"/>
		<p>Final String : ${string3 }</p>

	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:length</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String" />
		<c:set var = "string2" value = "This is second String" />
		<p>Length of String (1) : ${fn:length(string1) }</p>
		<p>Length of String (2) : ${fn:length(string2) }</p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:replace</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String" />
		<c:set var = "string2" value = "${fn:replace(string1, 'first', 'second') }" />
		<p>String1 : ${string1 }</p>
		<p>String2 : ${string2 }</p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:replace</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String" />
		
		<c:if test = "${fn:startsWith(string1, 'This') }">
			<p>String starts with This</p>
		</c:if>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:substring</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String." />
		<c:set var = "string2" value = "${fn:substring(string1, 7, 13) }" />
		
		<p><span><c:out value="${string1}"/></span></p>
		<p><span><c:out value="${string2}"/></span></p>
		<p><span><c:out value="${fn:substring(string1, 0, fn:length(string1))}"/></span></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:substringAfter</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String." />
		<c:set var = "string2" value = "${fn:substringAfter(string1, 'is') }" />
		
		<p><span><c:out value="${string1}"/></span></p>
		<p><span><c:out value="${string2}"/></span></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:substringBefore</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String." />
		<c:set var = "string2" value = "${fn:substringBefore(string1, 'first') }" />
		
		<p><span><c:out value="${string1}"/></span></p>
		<p><span><c:out value="${string2}"/></span></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:toLowerCase</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String." />
		<c:set var = "string2" value = "${fn:toLowerCase(string1) }" />
		
		<p><span><c:out value="${string1}"/></span></p>
		<p><span><c:out value="${string2}"/></span></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:toUpperCase</span></p>
		<hr/>
		
		<c:set var = "string1" value = "This is first String." />
		<c:set var = "string2" value = "${fn:toUpperCase(string1) }" />
		
		<p><span><c:out value="${string1}"/></span></p>
		<p><span><c:out value="${string2}"/></span></p>
		
	</div>
	
	<div style="width: 1000px;">
		<hr>
		<p><span>fn:trim</span></p>
		<hr/>
		
		<c:set var = "string1" value = "    This is first String.   " />
		<p><span><c:out value="${string1}"/></span><span>${fn:length(string1) }</span></p>

		<c:set var = "string2" value = "${fn:trim(string1) }" />		
		<p><span><c:out value="${string2}"/></span><span>${fn:length(string2) }</span></p>
		
	</div>

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function(){

	
});
	
</script>
	
</body>
</html>