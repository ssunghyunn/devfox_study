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
<div align="center">
<h3>投　稿　詳　細</h3>
<form:form action="../image/delete.html" method="post" modelAttribute="imageBBS" onsubmit="return check(this)">
	<form:hidden path="writing_id" value="${imageBBS.writing_id }"/>
	<table border="1" width="100%">
		<tr><th>番　号</th><td>${imageBBS.writing_id }</td></tr>
		<tr><th>タイトル</th><td>${imageBBS.title }</td></tr>
		<tr><th>ユーザー</th><td>${imageBBS.id }</td></tr>
		<tr><th>パスワード</th><td><form:password path="password" size="10"/></td></tr>
		<tr><th>イメージ</th><td><img alt="" width="250" height="200"
			src="${pageContext.request.contextPath }/upload/${imageBBS.image_name}"></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="削除">
			<input type="reset" value="キャンセル"></td></tr>
	</table>	
</form:form>
<script type="text/javascript">
	function check(frm){
		if(frm.password.value == ""){
			alert("パスワードを入力してください。"); frm.password.focus(); return false;
		}
		if(! confirm("削除しますか？")) return false;
	}
	
</script>
</div>
</body>
</html>