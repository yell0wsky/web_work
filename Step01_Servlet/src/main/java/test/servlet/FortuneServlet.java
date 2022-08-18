package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//3. 요청 맵핑 (처리할 요청 경로를 작성한다) 반드시 / 로 시작을 해야 하고 프로젝트명은 쓰지 않는다.
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{//1. HttpServlet 클래스를 상속 받는다.
	
	/*
	 * 	FortuneServlet 객체가 언제 생성이 되지?
	 * 	생성이 된다면 여러개가 생성이 될까?
	 * 	아니면 하나만 생성해서 사용이 될까?
	 */
	public FortuneServlet() {
		//최초 요청시 객체가 생성이 되고 그 이후에는 생성된 객체를 다시 사용한다.
		System.out.println("FortuneServlet 객체 생성됨!");
	}
		
	//2. service() 메소드 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("요청이 오네?");
		
		req.setCharacterEncoding("utf-8");
		
		// msg 라는 파라미터명으로 전송되는 문자열 읽어오기
		String a=req.getParameter("msg");
		
		System.out.println("감상평:"+a);
		
		String[] list = {"로또사기 좋은날!", "서쪽에서 귀인이 온다.", "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서...편지를 보내세요."
		, "물을 조심해라", "망했어요~"};
		//0~4 사이의 랜덤한 정수를 얻어내기
		int ranNum=new Random().nextInt(5);
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		resp.setContentType("text/html; charset=utf-8");
		
		//요청을 한 클라이언트에게 문자열을 응답할 객체 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세</title>");
		pw.println("<style>");
		pw.println("#fortune {color:red};");
		pw.println("</style>");		     
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p id='fortune'>오늘의 운세 : "+list[ranNum]+"</p>");
		pw.println("<p><a href=\"/Step01_Servlet/index.html\">돌아가기</p></a>");
		pw.println("<form action=\"/Step01_Servlet/fortune\" method=\"post\">");
		pw.println("<input type=\"text\" name=\"msg\" placeholder=\"운세에 대한 평가를 해주세요\"/>");
		pw.println("<button type=\"submit\">전송</button>");
		pw.println("</form>");
		pw.println("<script>");
		pw.println("</script>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.flush();//방출
		pw.close();//닫아주기 (auto flush)
		
	}
}