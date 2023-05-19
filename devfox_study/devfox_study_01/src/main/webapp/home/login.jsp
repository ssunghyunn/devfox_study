<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
		<a href="../userentry/entry.html">会員登録</a>
	</div>
	<form:form action="../login/home.html" method="post" modelAttribute="loginUser">
		ID : <form:input path="id" size="10" placeHolder="IDを入力してください"/><br>
		<font color="red"><form:errors path="id"/></font><br>
		パスワード : <form:password path="pwd" size="10"/>
		<font color="red"><form:errors path="pwd"/></font><br>
		<input type="submit" value="ログイン">
		<input type="reset" value="キャンセル">
	</form:form>
</body>
</html>