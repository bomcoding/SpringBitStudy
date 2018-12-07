<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/ckeditor5/11.1.1/classic/ckeditor.js"></script>
</head>
<body>
	<div class="container">
		<form action="write" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<label for="bUsername">작성자</label>
				<input type="text" class="form-control" id="bUsername" name="bUsername" />
			</div>
			<div class="form-group">
				<label for="btitle">글 제목</label>
				<input type="text" class="form-control" id="bTitle" name="bTitle" />
			</div>			
			<div class="form-group">
				<label for="bContent">글 내용</label>
				<textarea name="bContent" id="bContent" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<label for="bFile">파일 업로드</label>
				<input type="file" name="uploadfile" id="bFile" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">글쓰기</button>
			<a class="btn btn-default" href="list" >목록</a>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>