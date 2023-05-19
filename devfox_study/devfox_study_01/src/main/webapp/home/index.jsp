<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	height: 100%;
}
table{width:80%; border-collapse:collapse;border: 1px solid blue;
margin-left: 20px; margin-right: 20px; background-color: skyblue;}
td,th{border: 1px solid blue;}
#login {
	width: 80%;
	border: 1px dashed red;
	padding: 10px;
	margin-top: 10px;
	margin-left: 10px;
}

#body {
	width: 100%;
}

#menu {
	margin-top: 10px;
	margin-left: 10px;
}

#content {
	background-color: #CCC;
}

header, footer {
	background-color: lightgray;
}

.main {
	background-color: #CCC;
}
</style>
</head>
<body>
	<div align="center">
		<header>
			<h2>
				<img alt="" src="../img/logo.gif">
			</h2>
		 </header>
      <section>
         <table id="body">
            <tr>
               <td width="30%" height="300" valign="top" class="main">
                  <div id="login">
                     <c:choose>
                     <c:when test="${RELOGIN != null }">
                        <jsp:include page="${RELOGIN}"/>
                     </c:when>
                        <c:when test="${empty sessionScope.ADMIN && 
                                 empty sessionScope.LoginUser}">
                           <jsp:include page="../login/login.html"/>
                        </c:when>
                        <c:otherwise>
                           <jsp:include page="logout.jsp"/>
                        </c:otherwise>
                     </c:choose>
                  </div>
                  <div id="menu">
                     <a href="../home/intro.html?BODY=intro.jsp">紹　介</a><br>   
                     <c:if test="${sessionScope.ADMIN != null}">
                        <a href="../notice/input.html">お知らせを書く</a><br>
                     </c:if>
                     <a href="../notice/noticeList.html">お知らせを見る</a><br>
                     <c:if test="${sessionScope.LoginUser != null }">
                     	<a href="../image/imageForm.html">投稿を書く</a><br>
                     </c:if>
                     <a href="../image/imageList.html">投稿を見る</a><br/>

                  </div>
               </td>
               <td id="content">
                  <c:if test="${BODY != null }">
                     <jsp:include page="${BODY}"/>
                  </c:if>
               </td>
            </tr>            
         </table>
      </section>
      <footer>
         <h3>Copyright 2023. Devfox Study</h3>
      </footer>
   </div>
   <c:if test="${param.NOLOGIN != null }">
      <script type="text/javascript">
         setTimeout(function(){
            alert("投稿するにはログインする必要があります。");
         },100);
      </script>
   </c:if>
</body>
</html>