<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.*" %>
<%@ page import="java.util.*" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 입력 화면</title>
<script>
   function delcheck() {
	result = confirm("정말로 삭제하시겠습니까?")
	//확인 : true /취소: false
	if(result == true){
		document.form1.action.value="delete";
		//name으로 접근 ==> action="delete"로 변경
		document.form1.submit(); //서버로 전송
	}else{
		return;
	}
	
}
</script>
<link rel="stylesheet" type="text/css" href="css/guestbook.css">
</head>
<body>
<jsp:useBean id="gb" scope="request" class="guestbook.GuestBook"/>
<h2> 편집화면 </h2>
<hr>
<form name= "form1" method= "post" action="guestbook_control.jsp">
<input type= "hidden" name= "gb_id" value= "<%=gb.getGb_id()%>">
<input type= "hidden" name= "action" value= "update">
<table border="1">
<tr>
    <th>이름</th>
    <td> <input type= "text" name= "gb_name" value= "<%=gb.getGb_name()%>"></td>
</tr>

<tr>
    <th>제목</th>
    <td> <input type= "text" name= "gb_title" value= "<%=gb.getGb_title()%>"></td>
</tr>

<tr>
    <th>내용</th>
    <td> <input type= "text" name= "gb_comment" value= "<%=gb.getGb_comment()%>" style="height:300px;"></td>
</tr>

<tr>
    <th>날짜</th>
    <td> <input type= "date" name= "gb_date" value= "<%=gb.getGb_date()%>"></td>
</tr>
<tr>
    <td colspan="2">
     <input type= "submit" value= "수정하기">
     <input type= "reset" value= "취소">
     <input type= "button" value= "삭제" onclick="delcheck()">
    </td>
</tr>
</table>
</form>
<a href="guestbook_control.jsp?action=list">전체목록 보기</a> 
</body>
</html>