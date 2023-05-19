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
   <c:choose>
      <c:when test="${NOLOGIN=='YES' }">
         <script type="text/javascript">
            alert("ログインできませんでした。")
         </script>
      </c:when>
      <c:when test="${LOGIN=='YES' }">
         <c:choose>
            <c:when test="${sessionScope.ADMIN !=null }">
            <script type="text/javascript">
            var msg = "ようこそ~"+"${sessionScope.ADMIN.id}"+"様~";
            alert("ログインされました。"+msg);
         </script>
            </c:when>
            <c:when test="${sessionScope.LoginUser !=null }">
            <script type="text/javascript">
            var msg = "ようこそ~"+"${sessionScope.LoginUser.id}"+"様~";
            alert("ログインされました。"+msg);
            </script>
         </c:when>
         </c:choose>
         
      </c:when>
   </c:choose>
</body>
</html>