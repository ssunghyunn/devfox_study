<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>投　稿　登　録</h2>
	<form:form action="../image/upload.html" method="post" enctype="multipart/form-data" onsubmit="return check(this)" modelAttribute="imageBBS">
	<form:hidden path="order_no" value="${imageBBS.order_no + 1 }"/>
	<c:if test="${! empty imageBBS.group_id }">
		<form:hidden path="group_id" value="${imageBBS.group_id }"/>
	</c:if>
	<c:if test="${! empty imageBBS.parent_id }">
		<form:hidden path="parent_id" value="${imageBBS.parent_id }"/>
	</c:if>
	<table>
		<tr><th>タイトル</th><td><form:input path="title" value="${ title}"/></td></tr>
		<tr><th>パスワード</th><td><form:password path="password"/></td></tr>
		<tr><th>イメージ</th><td><input type="file" name="IMAGENAME"></td></tr>
		<tr><th>内　容</th><td><form:textarea path="content" rows="8" cols="40"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="登録"><input type="reset" value="キャンセル"></td></tr>
	</table>
</form:form>
</div>
<script type="text/javascript">
	function check(frm){
		if(frm.title.value == ""){
			alert("タイトルを入力してください。"); frm.title.focus(); return false;
		}else{
			if(frm.title.value.length > 30){
				alert("タイトルは30文字以内に入力してください。"); frm.title.focus(); return false;
			}
		}
		if(frm.password.value == ""){
			alert("パスワードを入力してください。"); frm.password.focus(); return false;
		}else{
			if(frm.password.value.length > 20){
				alert("パスワードは20文字以内に入力してください。"); frm.password.focus(); return false;
			}
		}
		if(frm.IMAGENAME.value == ""){
			alert("ファイルを選択してください。"); frm.IMAGENAME.focus(); return false;
		}
		if(frm.content.value == ""){
			alert("内容を入力してください。"); frm.content.focus(); return false;
		}else{
			if(frm.content.value.length > 150){
				alert("内容は150字以内に作成してください。"); frm.content.focus(); return false;
			}
		}
		if(! confirm("登録しますか？")) return false;
	}
</script>
</body>
</html>