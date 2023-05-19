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
	<form action="../notice/noticeModify.html" method="post" onSubmit="return check()">
	<input type="hidden" name="SEQNO" value="${notice.seqno }"/>
	<table>
		<tr><th>番　号</th><td>${notice.seqno }</td></tr>
		<tr><th>ユーザー</th><td>${notice.id }</td></tr>
		<tr><th>タイトル</th><td><input type="text" name="TITLE"
			value="${notice.title }"/></td></tr>
		<tr><th>作成日</th><td>${notice.notice_date }</td></tr>
		<tr><th>内　容</th><td><textarea rows="5" cols="40"
			name="CONTENT">${notice.content }</textarea></td></tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="修整" name="BTN"/>
			<input type="submit" value="削除" name="BTN"/></td></tr>
	</table>
	</form>
</c:if>
</div>
<script type="text/javascript">
function check(){
	if( ! confirm("作業を進めますか？")) return false;
}
</script>
</body>
</html>









