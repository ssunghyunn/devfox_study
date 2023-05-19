<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../logout/logout.html">
		<c:choose>
			<c:when test="${sessionScope.ADMIN != null }">				
				こんにちは 、${sessionScope.ADMIN.id }様。<br> 	
			</c:when>
			<c:when test="${sessionScope.LoginUser != null }">
				こんにちは、 ${sessionScope.LoginUser.id }様。<br> 	
			</c:when>
		</c:choose>
		<input type="submit" value="ログアウト">
	</form>
</body>
</html>