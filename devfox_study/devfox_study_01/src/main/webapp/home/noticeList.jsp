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
<c:if test="${empty noticeList }">
	<h2>登録されたお知らせが存在しません。</h2>
</c:if>
<c:if test="${ ! empty noticeList }">
	<h2>お知らせリスト</h2>
	<table>
	<tr><th>番　号</th><th>タイトル</th><th>作成者</th><th>作成日</th></tr>
	<c:forEach items="${noticeList }" var="bbs">
	<tr><td>${bbs.seqno }</td>
		<td><a href="../notice/noticeRead.html?SEQNO=${bbs.seqno }">${bbs.title }</a></td>
		<td>${bbs.id }</td>
		<td>${bbs.notice_date }</td></tr>
	</c:forEach>
	</table>
	<c:set var="startPage" value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1}"/>
	<c:set var="endPage" value="${startPage + 9 }"/>
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount }"/>
	</c:if>
	<c:if test="${startPage > 10 }">
		<a href="">[以前]</a>
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="pageNo">
		<c:if test="${currentPage == pageNo }">
			<font size="6">
		</c:if>
		<a href="../notice/noticeList.html?PAGE_NO=${pageNo }">${pageNo }</a>
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










