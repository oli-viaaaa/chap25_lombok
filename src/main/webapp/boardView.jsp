<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 보기</title>
	<style>
		*{
			font-size:9px;
		}
		.btn_align{
			width:600px;
			text-align:right;
		}
		table tbody tr th{
			background-color:gray;
		}
	</style>

</head>
<body>
	<h3>게시판 상세 보기 화면</h3>
	<hr>
	<table border="1" summary="게시판 상세조회">
		<caption>게시글 상세보기</caption>
		<colgroup>
			<col width="100"/>
			<col width="500"/>
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td>${board.subject}</td>
			</tr>
			<tr>
				<th align="center">작성자/조회수</th>
				<td>${board.writer}/${board.hit}<tr>
			</tr>
			<tr>
				<td colspan="2">${board.contents}</td>
			</tr>
		</tbody>
	</table>
	<p class="btn_align">
		<input type="button" value="글 목록으로 가기" onclick="location.href='boardList'"/>
		<input type="button" value="글 수정으로 가기" onclick="location.href='boardModify?no=${board.no}'"/>
		<input type="button" value="삭제하기" onclick="location.href='boardDelete?no=${board.no}'"/>
	</p>
</body>
</html>