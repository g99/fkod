package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import global.DispatcherServlet;
import global.Seperator;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/Member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberVO member;
	MemberService service = MemberServiceImpl.getInstance();
	HttpSession session = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "Member":
			break;
		case "header":
			break;
		case "login":
			System.out.println("Member : 로그인 진입");
			String id = request.getParameter( "id");
            String pw = request.getParameter ("pw") ;
            System. out.println ("유저아이디 : " + id );
            System. out.println ("유저비  번 : " + pw );
            member = service.login(id, pw);
            session = request.getSession();
            session.setAttribute("user",member);
            JSONObject json = new JSONObject();
            json.put("id", id);
            json.put("pw", pw);
            if (id.equals("choa")) {
				json.put("admin","yes");
			} else {
				json.put("admin","no");
			}
			response. setContentType("application/x-json; charset=utf-8");
            response. getWriter().println(json);
			return;
		default:
			break;
		}
		/*DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());*/
	}

}
