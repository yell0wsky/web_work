<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//DB 에서 삭제
	boolean isSuccess=CafeDao.getInstance().delete(num);
	
	//글 목록 보기로 리다일렉트 이동 ( 특정 경로로 요청을 다시하라고 클라이언트에게 강요하기)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>    
