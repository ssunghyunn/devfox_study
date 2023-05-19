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
<h2>投稿リスト</h2>
<c:if test="${empty LIST }">
	<h3>登録された投稿が存在しません。</h3>
</c:if>
<c:if test="${! empty LIST }">
	<table width="100%" border="1">
		<tr><th>イメージ</th><th>番号</th><th>タイトル</th><th>ユーザー</th><th>作成日</th></tr>
		<c:forEach items="${LIST }" var="bbs">
			<tr><td><img alt="" src="${pageContext.request.contextPath }/upload/${bbs.image_name }" width="50" height="50"></td>
			<td>${bbs.writing_id }</td>
			<td><a href="../image/imageRead.html?W_ID=${bbs.writing_id}">${bbs.title }</a></td>
			<td>${bbs.id }</td>
			<td>${bbs.reg_date }</td></tr>
		</c:forEach>
	</table>
	<c:set var="startPage" value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1 }"/>
	<c:set var="endPage" value="${startPage + 9 }"/>
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }"/>
	</c:if>
	<c:if test="${startPage > 10}">
		<a href="">[以前]</a>
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="pageNo">
		<c:if test="${currentPage == pageNo }">
			<font size="6">
		</c:if>
		<a href="../image/imageList.html?PAGE_NO=${pageNo }">${pageNo }</a>
		<c:if test="${currentPage == pageNo }">
			</font>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < pageCount }">
		<a href="">[次]</a>
	</c:if>
</c:if>
</div>
</body>
</html>