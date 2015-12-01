package ticket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import global.DispatcherServlet;
import global.Seperator;

@WebServlet("/ticket/Ticket.do")
public class TicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
