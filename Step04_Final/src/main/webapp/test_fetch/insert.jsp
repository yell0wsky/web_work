<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//DB 에 저장
	
	//응답
%>    
{"isSuccess":true}