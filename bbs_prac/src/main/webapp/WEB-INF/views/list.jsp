<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bId}</td>
					<td><a href="content_view?bId=${list.bId}">${list.bTitle}</a></td>
					<td><fmt:formatDate value="${list.bDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${list.bCount}</td>
					<td><a href="update_view?bId=${list.bId}" class="btn btn-default" role="button">수정하기</a></td>
			
					<!-- 삭제하기 버튼을 클릭하면 해당하는 bId와 함께 delete url을 요청한다 -->
					<td><a href="delete?bId=${list.bId}" class="btn btn-default" role="button">삭제하기</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="write_view" class="btn btn-default" role="button">글쓰기</a>
	</div>
	<br />
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>