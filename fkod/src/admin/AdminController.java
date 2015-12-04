package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import global.DispatcherServlet;
import global.Seperator;
import member.MemberService;
import member.MemberServiceImpl;
import member.MemberVO;
import movie.MovieService;
import movie.MovieServiceImpl;
import movie.MovieVO;

@WebServlet("/admin/Admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = MemberServiceImpl.getInstance();
	MovieService movie	= MovieServiceImpl.getInstance();
	List<MemberVO> list;
	List<MovieVO> movie_list;
	String id, password, email, addr, phone, filmName, film_Name, story, key;
	int result;
	JSONObject json = new JSONObject();
	MemberVO member;
	MovieVO movie_Name;
	Gson gson = new Gson();
 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "Admin":
			System.out.println("어드민 메인 진입");
			break;
		case "movie_list":
			System.out.println("영화목록 진입");
			movie_list = movie.getList();
			JsonElement element2 = gson.toJsonTree(movie_list, new TypeToken<List>() {}.getType());
			JsonArray movieList = element2.getAsJsonArray();
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(movieList);
			return;
		case "member_list":
			System.out.println("회원목록 진입");
			list = service.getList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>() {}.getType());
			JsonArray memberList = element.getAsJsonArray();
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(memberList);
		return;
		case "member_profile":
			System.out.println("개인 프로필 진입");
			id = request.getParameter("id");
			System.out.println("가져온 아이디 "  + id);
			member = service.selectById(id);
			request.setAttribute("member", member);
			break;
		case "movie_profile":
			System.out.println("영화 목록 진입");
			filmName = request.getParameter("filmName");
			System.out.println("가져온 영화 제목 "  + filmName);
			movie_Name = movie.searchByName(filmName);
			System.out.println("서치된 이름"  + filmName);
			request.setAttribute("movie_Number", movie_Name);
			break;
		case "insert":
			System.out.println("인서트 진입");
			id = request.getParameter("id");
			password = request.getParameter("password");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			addr = request.getParameter("addr");
			System.out.println("아이디 " +id);
			System.out.println("비번 " +password);
			System.out.println("이메일" +email);
			System.out.println("폰 " +phone);
			System.out.println("주소 " +addr);
			member = service.selectById(id);
			member.setPassword(password);
			member.setEmail(email);
			member.setPhone(phone);
			member.setAddr(addr);
			result = service.change(member);
			json.put("result", id + " 님의 정보수정을 완료했습니다.");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		case "insert2":
			System.out.println("인서트 진입");
			filmName = request.getParameter("filmName");
			System.out.println("영화 이름 " +filmName);
			story = request.getParameter("story");
			System.out.println("중거리" + story);
			movie_Name = movie.searchByName(filmName);
			movie_Name.setStory(story);
			result = movie.change(movie_Name);
			json.put("result", filmName + " 정보수정을 완료했습니다.");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		case "delete":
			id = request.getParameter("id");
			service.remove(id);
			json.put("result", id + " 님의 탈퇴를 완료했습니다. ");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		default:break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
