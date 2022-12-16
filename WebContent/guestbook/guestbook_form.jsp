<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 입력 화면</title>
<link rel="stylesheet" type="text/css" href="css/guestbook.css">
<script>
function numberMaxLength(e)
{
    if(e.maxLength < e.value.length)
   {
         alert("글자 제한 수를 넘었습니다");

           // 지정해놓음 최대 글자수로 줄임
         e.value = e.value.slice(0,e.maxLength);

     }

}
</script>
</head>
<body>
<h2>방명록 입력 화면 (from)</h2>
<hr>

<form name= "form1" method= "post" action="guestbook_control.jsp">
<input type= "hidden" name= "action" value= "insert">
<table border="1">
<tr>
    <th>이름</th>
    <td> <input type= "text" name= "gb_name"></td>
</tr>

<tr>
    <th>제목</th>
    <td> <input type= "text" name= "gb_title"></td>
</tr>

<tr>
    <th>내용</th>
    <td> <input type= "text" name= "gb_comment" style="height:300px; width:500px;" maxlength="30" oninput="numberMaxLength(this)"  placeholder="텍스트를 입력하세요.">
        </td>
</tr>

<tr>
    <th>날짜</th>
    <td> <input type= "date" name= "gb_date"></td>
</tr>
<tr>
    <td colspan="2">
     <input type= "submit" value= "저장">
     <input type= "reset" value= "취소">
    </td>
</tr>
</table>
</form>
<a href="guestbook_control.jsp?action=list">전체목록 보기</a> 
</body>
</html>