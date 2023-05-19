<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${! empty param.id }">
	<script type="text/javascript">
		alert("修正に失敗しました。 パスワードを確認してください。");
		location.href="../image/imageRead.html?W_ID="+${param.id};
	</script>
</c:if>
<c:if test="${empty paramn.id }">
		<script type="text/javascript">
		alert("修正が完了しました。");
		location.href="../image/imageList.html";
	</script>
</c:if>
</body>
</html>