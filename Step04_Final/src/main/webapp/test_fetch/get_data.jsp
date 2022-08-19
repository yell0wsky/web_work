<%@page import="org.json.JSONWriter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 추출
	int num=Integer.parseInt(request.getParameter("num"));
	//num 에 해당하는 회원 정보를 DB 에서 읽어온다.
	
	Map<String, Object> map=new HashMap<>();
	map.put("num", 1);
	map.put("name", "김구라");
	map.put("isMan", true);
	
	//json 문자열 응답하기
%>
<%=JSONWriter.valueToString(map) %>