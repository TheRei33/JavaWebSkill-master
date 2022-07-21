<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="articlesList" value="${articlesMap.articlesList }" />
<c:set var="totArticles" value="${articlesMap.totArticles}" />
<c:set var="section" value="${articlesMap.section}" />
<c:set var="pageNum" value="${articlesMap.pageNum}" /> 
    
<!DOCTYPE html>
<html>
<head>
<style>
	.no-uline{text-decoration: none;}
	.sel-page{text-decoration: none;color: red;}
	.cls1 {
		text-decoration: none;
	}
	.cls2 {
		font-size: : 30px;
		text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>		
		</tr>
		<c:choose>
			<c:when test="${articlesList == null }">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${articlesList != null }">
				<c:forEach var="article" items="${articlesList }" varStatus="aricleNum">
				<tr align="center">
					<td width="5%">${articleNum.count }</td>
					<td width="10%">${article.id }</td>
					<td align="left" width="35%">
						<span style="padding-right: 30px;"></span>
						<c:choose>
							<c:when test="${article.level > 1 }">
								<c:forEach begin="1" end="${article.level }" step="1">
									<span style="padding-left: 20px;"></span>
								</c:forEach>
								<span style="font-size: 12px;">[답변]</span>
								<a class="cls1" href="${contextPath}/board/viewArticle.do?
									articleNO=${article.articleNO}">
									${article.title}
								</a>
							</c:when>
							<c:otherwise>
								<a class="cls1" href="${contextPath}/board/viewArticle.do?
												articleNo=${article.articleNO}">
									${article.title}
								</a>
							</c:otherwise>
						</c:choose>	
					</td>
					<td width="10%">
						<fmt:formatDate value="${article.writeDate }"/>
					</td>
				</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div class="txt_center">
		<c:if test="${totArticles != null }">
			<c:choose>
				<c:when test="${totArticles >100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section >1 && page==1 }">
							<a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}">
								&nbsp;pre
							</a>
						</c:if>
						<a class="un-uline" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">
							${(section-1)*10+page}
						</a>
						<c:if test="${page == 10 }">
							<a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">
								&nbsp;next
							</a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totArticles ==100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline" href="#">${page }</a>
					</c:forEach>
				</c:when>
				
				<c:when test="${totArticles<100 }">
					<c:forEach var="page" begin="1" end="${totArticles/10+1 }" step="1">
						<c:choose>
							<c:when test="${page==pageNum }">
								<a class="sel-page" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">
									${page }
								</a>
							</c:when>
							<c:otherwise>
								<a class="no-nline" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">
									${page }
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	
	<a class="cls1" href="#">
		<p class="cls2">글쓰기</p>	
	</a>
</body>
</html>