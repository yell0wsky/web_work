package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/member/List")
public class MemberServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// DB에서 불러온 회원 목록이라고 가정하자
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라", "노량진"));
		list.add(new MemberDto(2, "해골", "행신동"));
		list.add(new MemberDto(3, "원숭이", "상도동"));

		/*
		 * 회원 목록을 table 형식으로 클라이언트에게 응답해보세요.
		 */

		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐츠 설정
		resp.setContentType("text/html; charset=utf-8");

		// 요청을 한 클라이언트에게 문자열을 응답할 객체 얻어오기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>회원 목록 페이지</title>");
		pw.println("<style>");
		pw.println("</style>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>회원목록 페이지 입니다</h1>");
			pw.println("<table border='1'>");
				pw.println("<tr>");
					pw.println("<th>번호</th>");
					pw.println("<th>이름</th>");
					pw.println("<th>주소</th>");
				pw.println("</tr>");
			//반복문 돌면서 tr 만들기
			for (MemberDto tmp : list) {
				pw.println("<tr>");
					pw.println("<td>" + tmp.getNum() + "</td>");
					pw.println("<td>" + tmp.getName() + "</td>");
					pw.println("<td>" + tmp.getAddr() + "</td>");
				pw.println("</tr>");
			};
			pw.println("</table>");
		pw.println("<script>");
		pw.println("</script>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}