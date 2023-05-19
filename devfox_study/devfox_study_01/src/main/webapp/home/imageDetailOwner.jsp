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
					<a href="javascript:goReply()">[答文]</a>
					<a href="../image/imageModifyForm.html?WID=${BBS.writing_id }">[修正]</a>
					<a href="../image/imageDeleteForm.html?WID=${BBS.writing_id }">[削除]</a>
					<a href="../image/imageList.html">[リスト]</a>
			</td></tr>
		</table>
		<form name="frm">
			<input type="hidden" name="id" value="${BBS.writing_id }">
			<input type="hidden" name="parentid" value="${BBS.writing_id }">
			<input type="hidden" name="groupid" value="${BBS.group_id }">
		</form>
		<script type="text/javascript">
			function goReply(){
				document.frm.action="../image/imageReplyForm.html";//formの actionをここで繋がる
				document.frm.submit();//サブミットボタン押した時の効果がここで行われる
			}
		</script>
	</div>
</body>
</html>