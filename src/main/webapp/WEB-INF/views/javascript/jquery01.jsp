<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery01</title>
</head>
<body>

	<h1>jquery01</h1>
	
	<br/>
	<span id="currentMs">test</span>
	<br/>
	<span id="currentTime">test</span>
	
	
	
	
	
	
	<script type="text/javascript" src="/js/jquery/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){

			var date = new Date();
			
			$("#currentMs").html(Date.now());
			$("#currentTime").html(
					date.getFullYear() + "." + date.getMonth() + "." + date.getDate()
					+ " " + date.getHours() + "." + date.getHours() + "." + date.getMinutes()
			);
			
		});
	</script>
	
</body>
</html>