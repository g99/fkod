package movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import global.DispatcherServlet;
import global.Seperator;

/**
 * Servlet implementation class MovieController
 */
@WebServlet("/movie/Movie.do")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService service = MovieServiceImpl.getInstance();
	MovieVO movie = new MovieVO();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	List list = new ArrayList<>();
    public MovieController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		
		HttpSession session = request.getSession();
		switch (Seperator.command.getPage()) {
		case "movie":break;
		case "movie_info":
			System.out.println("movie_info case진입");
			list = service.getList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>(){}.getType());
			JsonArray movieList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(movieList);
			return;
			

		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
