<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    import="java.util.*, sec01.ex01.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="id" value="hong" scope="page" />
<c:set var="pwd" value="1234" scope="page" />
<c:set var="name" value="${'홍길동'}" scope="page" />
<c:set var="age" value="${22}" scope="page" />
<c:set var="height" value="${177 }" scope="page" />
<c:remove var="age"/>
<c:remove var="height"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr align="center" bgcolor="#99ccff">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">키</td>
		</tr>
		<tr align="center">
				<td>
					${id }
				</td>
				<td>
					${pwd }
				</td>
				<td>
					${name }
				</td>
				<td>
					${age }
				</td>
				<td>
					${height }
				</td>
		</tr>
	</table>
</body>
</html>