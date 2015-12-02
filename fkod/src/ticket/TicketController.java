package ticket;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/ticket/Ticket.do")
public class TicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TicketService ticketService = TicketServiceImpl.getInstance();
	List movieListRate = new ArrayList();
	List movieListAsc = new ArrayList();
	List theaterList = new ArrayList();
	List dateList = new ArrayList();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "Ticket":
			break;
		case "movieSelect":
			return;
		case "theaterSelect":
			return;
		case "dateSelect":
			return;
		case "temp":
			movieListRate = ticketService.getRateList();
			movieListAsc = ticketService.getAscList();
			theaterList = ticketService.getTheaterList();
			dateList = ticketService.getShowDateList();
			JsonElement element = gson.toJsonTree(movieListRate, new TypeToken<List>() {}.getType());
			JsonArray movieList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(movieList);
			return;
		/*case "movie_list":
			System.out.println("회원목록케이스진입");
			list = service.getMemberList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>() {}.getType());
			JsonArray memberList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(memberList);
			return;*/
		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}
}
