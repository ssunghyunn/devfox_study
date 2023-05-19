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
<h2>お知らせを書く</h2>
<form:form action="../notice/postNotice.html" method="post" modelAttribute="notice" onsubmit="return check(this)">
<table>
	<tr><th>タイトル</th><td><form:input path="title"/></td></tr>
	<tr><th>内　容</th><td><form:textarea rows="6" cols="40" path="content" cssClass="content"></form:textarea></td></tr>
	<tr><td colspan="2"><input type="submit" value="登　録">
	<input type="reset" value="キャンセル"></td></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function check(frm){
	if (frm.title.value == '') {
		alert("タイトルを入力してください。");  frm.title.focus(); return false;
	}else {
		if (frm.title.value.length > 30) {
			alert("タイトルは30文字以内で入力してください。");  frm.title.focus(); return false;
		}
	}
	if (frm.content.value == '') {
		alert("内容を入力してください。");  frm.content.focus(); return false;
	}else {
		if (frm.content.value.length > 100) {
			alert("内容は100文字以内で入力してください。");  frm.content.focus(); return false;
		}
	}
	if (! confirm("登録しますか？")) return false;
}
</script>
</body>
</html>