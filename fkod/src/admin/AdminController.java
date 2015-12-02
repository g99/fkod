package admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import global.DispatcherServlet;
import global.Seperator;

@WebServlet("/admin/Admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminService service = AdminServiceImpl.getInstance();
	List<AdminVO> list = new ArrayList<AdminVO>();
	Gson gson = new Gson();
 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "Admin":
			System.out.println("어드민 메인 진입");
			break;
		case "member_list":
		System.out.println("회원목록 진입");
		list = service.getMemberList();
		JsonElement element = gson.toJsonTree(list, new TypeToken<List>() {}.getType());
		JsonArray memberList = element.getAsJsonArray();
		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(memberList);
		return;
		case "movie":
			System.out.println("영화 목록 진입");
			return;
		default:break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
