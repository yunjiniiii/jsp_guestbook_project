<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.*" %> 
<%@ page import="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="guestbook" class= "guestbook.GuestBook"/>
<jsp:setProperty property="*" name="guestbook"/>
<jsp:useBean id="gb" class="guestbook.GuestBean" scope="application"/>

<%
   String action = request.getParameter("action"); 
   //hidden 혹은 url 주소
   //insert ==> hidden name=action value-insert
   //url ==> guestrbook_control.jsp?action=값

   if(action.equals("list")){
	   // 전체보기 ==>getDBList
	   ArrayList<GuestBook> datas=gb.getDBList();
	   //select * from guestbook 정보를 가져다가 datas 넣어줌
	   request.setAttribute("datas", datas); //datas를 datas로 넣어줌
	   //조회한 정보를 다른 페이지에서 사용하기 위해서 datas이름으로 속성 설정
	   pageContext.forward("guestbook_list.jsp");
	   
   }else if(action.equals("insert")){
	   //삽입 ==> insertDB호출
		if(gb.insertDB(guestbook)){
		response.sendRedirect("guestbook_control.jsp?action=list");
			//목록보기로 이동
		//	System.out.print("삽입성공");
			
		}else{
			throw new Exception("DB입력오류"); 
		}
   }else if(action.equals("edit")){
	   //편집 모드
	   GuestBook gbook = gb.getDB(guestbook.getGb_id());
	   //select ==> id가 같은 필드값 가져옴
		if(!request.getParameter("upasswd").equals("1234")){	   
			out.println("<script> alert('비번틀림');history.go(-1);</script>");
		}else{
			request.setAttribute("gb", gbook); // 공통을 사용할 속성값 설정
			pageContext.forward("guestbook_edit_form.jsp");
		//	out.println("편집화면으로 이동");
		}
	   
   }else if(action.equals("update")){
	   if(gb.UpdateDB(guestbook)){
		   response.sendRedirect("guestbook_control.jsp?action=list");
	   }else{
		   out.println("DB오류");
	   }
   }else if(action.equals("delete")){
	   if(gb.deleteDB(guestbook.getGb_id())){
		   //id값을 기준으로 삭제
		   response.sendRedirect("guestbook_control.jsp?action=list");
	   }else{
		   out.println("DB오류");
	   }
   }else{
	out.println("<script>alert('action값 확인')</script>");
	   //action의 잘못들어 왔을 때...
   }
%>
</body>
</html>