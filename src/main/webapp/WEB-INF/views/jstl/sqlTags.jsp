<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL Tags</title>
</head>
<body>

	<h1>JSTL sql:setDataSource Tag</h1>
	
	<sql:setDataSource var = "sqliteTestDatabase" driver = "org.sqlite.JDBC"
		url ="jdbc:sqlite:/Users/kook/workspaces/webserver/data/test.db"/>
		
	<sql:query dataSource = "${sqliteTestDatabase }" sql = "select id ,name, address, city, state , zip from test" var = "testList" />
	
	<table border = "1" >
		<tr>
		   <th>ID</th>
		   <th>Name</th>
		   <th>Address</th>
		   <th>City</th>
		</tr>
         
		<c:forEach var = "row" items = "${testList.rows}">
		   <tr>
		      <td> <c:out value = "${row.id}"/></td>
		      <td> <c:out value = "${row.name}"/></td>
		      <td> <c:out value = "${row.address}"/></td>
		      <td> <c:out value = "${row.city}"/></td>
		   </tr>
		</c:forEach>
	</table>
      
     
     
	<c:out value="${ipAddress }" />
	
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate var="datetime" value="${now}" pattern="yyyyMMdd HH:mm:ss" />
	
	<%-- <sql:transaction dataSource ="${sqliteTestDatabase}"> --%>
		
		<sql:update dataSource="${sqliteTestDatabase}" var="deleteOldHistory">
		   delete from access_history
			where rowid = (select rowid
			from access_history ah 
			order by regist_date
			limit 1);
		</sql:update>
	
		<sql:update dataSource="${sqliteTestDatabase}" var="newHistory">
		   	INSERT INTO access_history (client_ip_address, regist_date) values (?, ?);
		    <sql:param value="${ipAddress}" />
		    <sql:param value="${datetime}" />
		</sql:update>
	
	<%-- </sql:transaction> --%>
		
	
	<sql:query dataSource = "${sqliteTestDatabase }" sql = "select client_ip_address ,regist_date from access_history" var = "accessHistoryList" />
	
	<table border = "1" >
		<tr>
		   <th>Ip Address</th>
		   <th>Regist Date</th>
		</tr>
         
		<c:forEach var = "row" items = "${accessHistoryList.rows}">
		   <tr>
		      <td> <c:out value = "${row.client_ip_address}"/></td>
		      <td> <c:out value = "${row.regist_date}"/></td>
		   </tr>
		</c:forEach>
	</table>
	
	
     
     <p>https://www.codejava.net/java-ee/jstl/jstl-sql-tag-update</p>
     <p>https://jakarta.ee/specifications/tags/2.0/jakarta-tags-spec-2.0.html#sqlupdate</p>
<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function(){

	
});
	
</script>
	
</body>
</html>