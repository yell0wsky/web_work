package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test/save")
public class SaveServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String nick=req.getParameter("nick");
		
		//HttpSession 객체에 "nick" 이라는 키값으로 입력한 닉네임을 저장하려고 하는데...
		HttpSession session=req.getSession();
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		//근데 html 응답하기가 구찮네... ㄷ ㄷ
		
		//jsp 페이지한테 대신 응답하라고 떠넘기자!
		
		//forward 이동은 보안되는 폴더인 /WEB-INF/ 안에 있는 jsp 페이지로도 가능하다 
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/monkey.jsp");
		rd.forward(req, resp);
	}

}












