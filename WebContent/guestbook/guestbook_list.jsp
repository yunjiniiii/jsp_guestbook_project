<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록 보기</title>
<link rel="stylesheet" type="text/css" href="css/guestbook.css">
<script>
function check(gb_id){
	pwd=prompt("수정/삭제하려면 비번을 입력하세요?", " ");
	document.location.href="guestbook_control.jsp?action=edit&gb_id="+gb_id+"&upasswd="+pwd;
// form method방식 / get/post 방식
//get 방식 : url주소?변수명=값&변수명=값
}
</script>
</head>
<body>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
<!-- request.setAttributes(datas, datas)를 이용해서 리스트에 저장된 정보를 가져옴 -->
<div id="wrap">
<h2>방명록 : 목록 보기</h2>
<hr>
<table border="1">
<tr>
<th> 번호 </th>
<th> 이름 </th>
<th> 제목 </th>
<th> 내용 </th>
<th> 날짜 </th>
</tr>
<%
     for(GuestBook gb : (ArrayList<GuestBook>) datas) {     
%>
<tr>
<td> <a href="javascript:check(<%=gb.getGb_id() %>)">
<!-- a href="guestbook_edit_form.jsp?action=edit" --> 
<%=gb.getGb_id() %></a></td>
<td><%=gb.getGb_name() %></td>
<td><%=gb.getGb_title() %></td>
<td><%=gb.getGb_comment() %></td>
<td><%=gb.getGb_date() %></td>
</tr>
<%
     }
%>
</table>
<a href="guestbook_form.jsp"> 주소록 등록 </a>
</div>
</body>
</html>