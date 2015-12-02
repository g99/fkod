package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
