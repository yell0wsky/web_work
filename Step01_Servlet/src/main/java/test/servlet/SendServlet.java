package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//3. 요청 맵핑 (처리할 요청 경로를 작성한다) 반드시 / 로 시작을 해야 하고 프로젝트명은 쓰지 않는다.
@WebServlet("/send")
public class SendServlet extends HttpServlet {//1. HttpServlet 클래스를 상속 받는다.

	//2. service() 메소드 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("요청받음");

		req.setCharacterEncoding("utf-8");

		// msg 라는 파라미터명으로 전송되는 문자열 읽어오기
		String a = req.getParameter("msg");
		System.out.println(a);
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		resp.setContentType("text/html; charset=utf-8");

		//요청을 한 클라이언트에게 문자열을 응답할 객체 얻어오기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>응답창</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메세지 잘 받았어! 클라이언트야</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}