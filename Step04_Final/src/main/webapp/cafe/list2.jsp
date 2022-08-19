<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=CafeDao.getInstance().getCount();
	
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
	
	//CafeDto 객체에 startRowNum 과 endRowNum 을 담아서 
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//글 목록을 얻어온다. 
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	
	// list 라는 키값으로 request scope 에 담기 
	request.setAttribute("list", list);
	// 페이징 처리에 필요한 값을 request scope 에 담기
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>글 목록 입니다.</h1>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td><a href="detail.jsp?num=${tmp.num }">${tmp.title }</a></td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination">
			
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<li class="page-item active">
								<a class="page-link" href="list.jsp?pageNum=${i }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="list.jsp?pageNum=${i }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
				
			</ul>
		</nav>
				
		<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">새글 작성</a>
	</div>
</body>
</html>








