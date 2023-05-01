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
	<script>
 <!-- 	게시물 삭제 확인 메소드 -->
 	function confirmCheck(no){
 		if(confirm('삭제하시겠습니까?'))
 			location.href="${contextPath}/boardDelete?no"+no;
 		else 
 			return false;
 		
 	}
	</script>
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
		<input type="button" value="글 목록" onclick="location.href='boardList'"/>
		<input type="button" value="글 수정" onclick="location.href='boardModify?no=${board.no}'"/>
<%-- 		<input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?'))location.href='boardDelete?no=${board.no}'"/> --%>
		<input type="button" value="삭제" onclick="confrimCheck(${board.no})">
	</p>
</body>
</html>