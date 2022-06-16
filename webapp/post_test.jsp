<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="insert" method="post" action="insertBoard" enctype="multipart/form-data">
	board<input name="board">
	title<input name="title">
	subject<select name="subject">
		<option value="test1">test1</option>
		<option value="test2">test2</option>
		<option value="test3">test3</option>
	</select>
	writer<input name="writer">
	content<textarea name="content"></textarea>
	file<input type="file" name="fileName" size="50" maxlength="50">
	<input type="submit" value="submit">
</form>
</body>
</html>