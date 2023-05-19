<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">ID重複確認</h2>
<form action="../userentry/idCheck.html" name="frm">
ID : <input type="text" name="USER_ID" value="${ID }"><input type="submit" value="重複検査"><br>
<c:if test="${DUP == 'YES' }">
	<script type="text/javascript">
		opener.document.frm.USER_ID.value = "";//入力されたIDを消す
	</script>
${ID }は既に使用中です。
</c:if>
<c:if test="${DUP == 'NO'}">
${ID }は使用できます。
<input type="button" value="使用" onclick="idOk()">
</c:if>
</form>
<script type="text/javascript">
	function idOk(){
		opener.document.frm.id.value = document.frm.USER_ID.value;//openerは親を呼ぶ命令語
		opener.document.frm.idChecked.value = "OK";
		opener.document.frm.id.readOnly = true;
		self.close();
	}
</script>
</body>
</html>