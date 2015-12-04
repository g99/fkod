package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
	String id, password, name, birth, addr, gender, email, phone, my_Theater;
	JSONObject obj;

	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "provision":
			break;
		case "join_member":
			System.out.println("조인_멤버로 들어옴");
			id = request.getParameter("id");
			password = request.getParameter("password");
			name = request.getParameter("name");
			birth = request.getParameter("birth");
			addr = request.getParameter("addr");
			gender = request.getParameter("gender");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			
			System.out.println("가입 id: "+id);
			System.out.println("가입 패스워드: "+password);
			System.out.println("가입 이름: "+name);
			System.out.println("가입 생년: "+birth);
			System.out.println("가입 주소: "+addr);
			System.out.println("가입 성별: "+gender);
			System.out.println("가입 이메일: "+email);
			System.out.println("가입 전화번호: "+phone);
			
			member.setId(id);
			member.setPassword(password);
			member.setName(name);
			member.setBirth(birth);
			member.setAddr(addr);
			member.setGender(gender);
			member.setEmail(email);
			member.setPhone(phone);
			
			int result1 = service.join(member);
			if (result1 == 1) {
				obj = new JSONObject();
				System.out.println("회원가입 성공");
				obj.put("result", "success");
				obj.put("name", member.getName());
				System.out.println(obj);
				response.setContentType("application/x-json; charset=utf-8");
				response.getWriter().print(obj);
			} else {
				System.out.println("회원가입 실패");
				obj.put("result", "fail");
				response.setContentType("application/x-json; charset=utf-8");
				response.getWriter().print(obj);
			}
			return;
		case "join_Result":
			break;
		case "logout":
			System.out.println("Member : 로그아웃 진입");
			session.invalidate();
			obj.put("result", "success");
			response. setContentType("application/x-json; charset=utf-8");
            response. getWriter().println(obj);
            obj.clear();
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
            	obj.put("result", "fail");
            } else {
            //f로그인 성공시
            	session = request.getSession();
                session.setAttribute("user",member);
                obj.put("result", "success");
                obj.put("id", id);
                obj.put("pw", password);
                if (id.equals("choa")) {
                	obj.put("admin","yes");
    			} else {
    				obj.put("admin","no");
    			}
            }
			response. setContentType("application/x-json; charset=utf-8");
            response. getWriter().println(obj);
            obj.clear();
			return;
		case "check_Overlap":
			System.out.println("컨트롤러 / 중복체크로 진입");
			id = request.getParameter("id");
			obj = new JSONObject();
			if (service.selectById(id).getId() == null) {
				obj.put("result", "usable");
				obj.put("id", id);
				response.setContentType("application/x-json; charset=utf-8");
				response.getWriter().print(obj);
			} else {
				obj.put("result", "unusable");
				obj.put("id", id);
				response.setContentType("application/x-json; charset=utf-8");
				response.getWriter().print(obj);
			}
			return;
		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
