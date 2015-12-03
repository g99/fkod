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

	MemberService service = MemberServiceImpl.getInstance();
	MemberVO member = new MemberVO();
	HttpSession session = null;
	JSONObject json = new JSONObject();
	String id, password, name, birth, addr, gender, email, phone;

	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "provision":
			break;
		case "join_member":
			System.out.println("조인으로 들어옴");
			id = request.getParameter("id");
			System.out.println("id는 정상으로 들어왓나?"+id);
			return;
		case "join_Result":
			
			
			break;
		case "logout":
			System.out.println("Member : 로그아웃 진입");
			session.invalidate();
			json.put("result", "success");
			response. setContentType("application/x-json; charset=utf-8");
            response. getWriter().println(json);
            json.clear();
			return;
		case "login":
			System.out.println("Member : 로그인 진입");
			id = request.getParameter("id");
            password = request.getParameter ("pw") ;
            System. out.println ("유저아이디 : " + id );
            System. out.println ("유저비  번 : " + password );
            member = service.login(id, password);
            //로그인 실패시
            if(member==null){
            	json.put("result", "fail");
            } else {
            //f로그인 성공시
            	session = request.getSession();
                session.setAttribute("user",member);
                json.put("result", "success");
                json.put("id", id);
                json.put("pw", password);
                if (id.equals("choa")) {
    				json.put("admin","yes");
    			} else {
    				json.put("admin","no");
    			}
            }
			response. setContentType("application/x-json; charset=utf-8");
            response. getWriter().println(json);
            json.clear();
			return;
		default:
			break;
		}
		/*DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());*/
	}

}
