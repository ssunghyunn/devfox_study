<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>会員登録</h2>
	<form:form action="../userentry/userEntry.html" method="post" name="frm" modelAttribute="member"
	onsubmit="return check(this)">
		<input type="hidden" name="idChecked">
		お名前 : <form:input path="name" size="20"/><br>
		ID : <form:input path="id" size="5"/><input type="button" value="重複検査" onclick="idCheck()"><br>
		住所  : <form:input path="addr" size="30"/><br>
		連絡先 : <form:input path="phone" size="10"/><br>
		パスワード : <form:password path="pwd" size="10"/><br>
		パスワード確認 : <input type="password" name="CONFIRM" size="10"><br>
		性別 : 男 <form:radiobutton path="gender" value="남"/>, 女 <form:radiobutton path="gender" value="여"/><br>
		メールアドレス : <form:input path="email" size="20"/><br>
		仕事 : <form:select path="job">
				<option>会社員</option>
				<option>学生</option>
				<option>自営業</option>
				<option>他に</option>
			</form:select><br><br>
		<input type="submit" value="会員登録">
		<input type="reset" value="キャンセル">
		<br><br>
	</form:form>>
</div>
<script type="text/javascript">
	function idCheck(){
		if (document.frm.id.value == '') {
			alert("IDを入力してください。"); document.frm.id.focus(); return;
		}
		var url = "../userentry/idCheck.html?USER_ID="+document.frm.id.value;
		window.open(url,"_blank_","width=650, height=200");
	}
	function check(frm) {
		if (frm.name.value == "") {
			alert("お名前を入力してください。"); frm.name.focus(); return false;
		}
		if (frm.idChecked.value == "") {
			alert("IDの重複検査をしてください。"); frm.idChecked.focus(); return false;
		}
		if (frm.id.value == "") {
			alert("IDを入力してください。"); frm.id.focus(); return false;
		}
		if (frm.phone.value == "") {
			alert("連絡先を入力してください。"); frm.phone.focus(); return false;
		}
		if (frm.pwd.value == "") {
			alert("パスワードを入力してください。"); frm.pwd.focus(); return false;
		}
		if (frm.pwd.value != frm.CONFIRM.value) {
			alert("パスワードが合ってません。"); frm.CONFIRM.focus(); return false;
		}
		if (!frm.gender[0].checked && !frm.gender[1].checked) {
			alert("性別を選んでください。"); frm.gender[0].focus(); return false;
		}
		if (!confirm("入力した内容が合ってますか。")) return false;
	}
</script>
</body>
</html>