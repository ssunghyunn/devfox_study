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
<div align="center">
<c:if test="${ empty notice }">
	<h2>存在しない投稿です。</h2>
</c:if>
<c:if test="${ ! empty notice }">
	<h2>投　稿　詳　細</h2>
	<table>
		<tr><th>番　号</th><td>${notice.seqno }</td></tr>
		<tr><th>ユーザー</th><td>${notice.id }</td></tr>
		<tr><th>タイトル</th><td>${notice.title }</td></tr>
		<tr><th>作成日</th><td>${notice.notice_date }</td></tr>
		<tr><th>内　容</th>
			<td><textarea rows="5" cols="40"
			readOnly="readonly">${notice.content }</textarea></td></tr>
	</table>
</c:if>
</div>
</body>
</html>









