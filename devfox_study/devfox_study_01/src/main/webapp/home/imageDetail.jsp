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
		<h3>投　稿　詳　細</h3>
		<table border="1" width="100%">
			<tr><th>番　号</th><td>${BBS.writing_id }</td></tr>
			<tr><th>タイトル</th><td>${BBS.title }</td></tr>
			<tr><th>ユーザー</th><td>${BBS.id }</td></tr>
			<tr><td colspan="2" align="center"><img alt="" width="250" height="200" 
					src="${pageContext.request.contextPath }/upload/${BBS.image_name}"></td></tr>
			<tr><th>内　容</th><td>${BBS.content }</td></tr>
			<tr><td colspan="2">
					<a href="../image/imageList.html">[リスト]</a>
			</td></tr>
		</table>
	</div>
</body>
</html>