<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUSTBOARD</title>
<style type="text/css">
#bodywrap {
	width: 80%;
	margin: 10px auto;
}

table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.pagelist a {
	text-decoration: none;
	color: black;
}

.pagelist a:hover, .pagelist .pagecolor {
	text-decoration: underline;
	color: red
}
</style>
</head>
<body>
	<div id="boadywrap">
		<form id="frm" name="frm" method="get" action="write.do">
			<input type="submit" id="btnWrite" value="글쓰기" />
		</form>

		<table>
			<tr>
				<th width="5%">번호</th>
				<th width="45%">제목</th>
				<th width="20%">글쓴이</th>
				<th width="5%">조회수</th>
			</tr>

			<c:forEach items="${aList}" var="dto">
       <tr>
         <td>${dto.num}</td>
         <td>
          <c:url var="path" value="view.do">
            <c:param name="currentPage" value="${pv.currentPage}" />
            <c:param name="num" value="${dto.num}" />
          </c:url>
          <c:if test="${dto.re_level>0}"> <!-- if : 현재 가지고 온 것이 답변글이라면 -->
           <img src="resources/images/level.gif" width="${20*dto.re_level}" height="15" /> <!-- 들여쓰기 효과 -->
           <img src="resources/images/re.gif" /> <!-- 답변 이미지 -->
          </c:if>
           <a href="${path}">${dto.subject}</a>
         </td>
         <td>${dto.writer}</td>
         <td>${dto.readcount}</td>
       </tr>     
     </c:forEach>
		</table>

		<div class="pageList">
			<!-- 이전 출력 -->
			<c:if test="${pv.startPage>1}">
				<a href="list.do?currentPage=${pv.startPage - pv.blockPage}">이전</a>
			</c:if>

			<!-- 페이지 출력 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<span> <c:url var="currPage" value="list.do">
						<c:param name="currentPage" value="${i}" />
					</c:url> <c:choose>
						<c:when test="${i==pv.currentPage}">
							<a href="${currPage}" class="pagecolor">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="${currPage}">${i}</a>
						</c:otherwise>
					</c:choose>
				</span>
			</c:forEach>

			<!-- 다음 출력 -->
			<c:if test="${pv.endPage<pv.totalPage}">
				<a href="list.do?currentPage=${pv.startPage + pv.blockPage}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>