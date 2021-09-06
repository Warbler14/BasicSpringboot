<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mementjs</title>
</head>
<script type="text/javascript">
</script>
<body>

	<h1>mementjs</h1>
	
	<p><span id="moment.locale"></span></p>
	
	<p><span id="moment.LTS"></span></p>
	
	<button id="setInterval">setInterval()</button>
	<button id="clearInterval">clearInterval()</button>
	
	
	<p>https://developer.mozilla.org/en-US/docs/Web/API/setInterval</p>
	
<script type="text/javascript" src="/js/mement/moment.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
	let setTime = function() {
		var momentLocale = document.getElementById("moment.locale");
		momentLocale.innerText = moment.locale();
		
		var momentLTS = document.getElementById("moment.LTS");
		momentLTS.innerText = moment().format('LTS');
	
	}
	
	var nIntervId;
	let startTimer = function() {
		nIntervId = setInterval(setTime, 1000);
	}
	
	let stopTimer = function() {
     	clearInterval(nIntervId);
    }
	
	document.getElementById("setInterval").addEventListener("click", startTimer);
	document.getElementById("clearInterval").addEventListener("click", stopTimer);
	
	setTime();
});
</script>
	
</body>
</html>