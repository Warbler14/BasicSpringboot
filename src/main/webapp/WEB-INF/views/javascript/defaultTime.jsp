<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default Time</title>
</head>
<body>

	<h1>default Time</h1>
	
	<br/>
	<span id="currentTime">test</span>
	
	
	
	
	
	
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
//window.addEventListener('DOMContentLoaded', (event) => {

	let setTime = function() {
		var element = document.getElementById("currentTime");

		var date = new Date();

		element.innerText 
			= date.getFullYear() + "." + date.getMonth() + "." + date.getDate()
				+ " " + date.getHours() + "." + date.getHours() + "." + date.getMinutes();
			
	}

	let test01 = function() {
		return new Promise(function(resolve, reject) {
			//resolve("data");

			//reject(new Error("Error call"));			//Uncaught (in promise) Error: Error call
			//reject("Error call");						//Uncaught (in promise) Error call
			//throw new Error('Uncaught Exception!');	//Uncaught (in promise) Error: Uncaught Exception!

			setTimeout(() => {
				reject("reject+++");	//Uncaught (in promise) reject
			}, 1000);
		});
	}

	test01().then(function(data) {
		console.log(data);
		return data + "10";
	}).then(function(data) {
		console.log(data);
		return data + "20";
	}).then(function(data) {
		console.log(data);
	}).catch(function(err){
		console.log(">>" + err);
		console.log(err.message);
	});
	
	
	setTime();
	test01();

	
});
	
</script>
	
</body>
</html>