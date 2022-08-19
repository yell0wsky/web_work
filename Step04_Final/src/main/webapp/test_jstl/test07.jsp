<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
	//sample 데이터
	request.setAttribute("msg", "abcde구라1234");
	request.setAttribute("str", "<div></div> 는 문단을 나타내는 요소 입니다.");
	request.setAttribute("content", "하나\n두울\n세엣");
	request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test07.jsp</title>
</head>
<body>
	<h1>JSTL function (EL 코드 블럭 안에서 사용하는 함수) 활용</h1>
	<p> "구라" 가 포함되어 있는지 여부 : ${fn:contains(msg, '구라')}</p>
	<c:if test="${fn:contains(msg,'구라') }">
		<p>메세지에 "구라" 가 포함되어 있군요!</p>
	</c:if>
	<p>${str }</p>
	<p>${fn:escapeXml(str) }</p>
	<p>${content }</p>
	<%-- content 문자열에서 개행 기호를  <br> 로 바꾸서 출력 --%>
	<p>${fn:replace(content, newLine, '<br>') }</p>
</body>
</html>







