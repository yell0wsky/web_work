package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 회원 한명의 정보를 읽어오는 비즈니스 로직 수행 했다고 가정
		MemberDto dto=new MemberDto(1, "김구라", "노량진");
		
		//2. 로직 수행 결과 데이터를 HttpServletRequest 객체에 "dto" 라는 키값으로 담고
		req.setAttribute("dto", dto);
		//3. /test/member.jsp 페이지로 응답을 위임 시켜서 회원 한명의 정보를 응답하기
		RequestDispatcher rd=req.getRequestDispatcher("/test/member.jsp");
		rd.forward(req, resp);
	}
}















