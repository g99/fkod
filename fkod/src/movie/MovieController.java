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
import javafx.print.JobSettings;

/**
 * Servlet implementation class MovieController
 */
@WebServlet("/movie/Movie.do")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService service = MovieServiceImpl.getInstance();
	MovieVO movie = new MovieVO();
	
	MovieDAO dao = MovieDAOImpl.getInstance();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	JSONObject json = new JSONObject();
	List list = new ArrayList<>();
	List list2 = new ArrayList<>();
	String filmName, filmNumber, jsonString;
    public MovieController() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		
		HttpSession session = request.getSession();
		switch (Seperator.command.getPage()) {
		case "Movie":break;
		case "movie_info":
			System.out.println("movie_info case진입");
			list = service.getList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>(){}.getType());
			JsonArray movieList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(movieList);
			System.out.println(movieList);
			return;
		case "movie_name" : 
			filmNumber = request.getParameter("filmNumber");
			System.out.println("film넘버 : "+filmNumber);
			movie = service.searchByName(filmNumber);
			
			System.out.println("영화제목 : "+movie.getFilmName());
			/*obj.put("filmName", movie.getFilmName());
			System.out.println("obj : "+ obj);
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(obj);*/
			jsonString = gson.toJson(movie);
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(jsonString);
			return;
		case "movie_Cut": 
			filmNumber = request.getParameter("filmNumber");
			System.out.println("movieCut의 filmNumber : " + filmNumber);
			movie = service.searchByName(filmNumber);
			String cut = movie.getCut();
			String[]arr = cut.split("/");
			for (int i = 0; i < arr.length; i++) {
				System.out.println(arr[i]);
			}
			jsonString = gson.toJson(arr);
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(jsonString);
			return;
		case "movie_Tra": 
			filmNumber = request.getParameter("filmNumber");
			System.out.println("movieTra의 filmNumber : " + filmNumber);
			movie = service.searchByName(filmNumber);
			String tra = movie.getTrailer();
			System.out.println("getTrailer : "+ tra);
			String[]arrt = tra.split("/");
			for (int i = 0; i < arrt.length; i++) {
				System.out.println("트레일러 : "+arrt[i]);
			}
			jsonString = gson.toJson(arrt);
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(jsonString);
			return;
		case "movie_Basic" : 
			filmNumber = request.getParameter("filmNumber");
			System.out.println("movieBasic의 film넘버 : "+filmNumber);
			movie = service.searchByName(filmNumber);
			System.out.println("movieBasic컷의영화제목 : "+movie.getFilmName());
			jsonString = gson.toJson(movie);
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(jsonString);
			return;
		case "movie_Chart" : 
			System.out.println("movie_chart case진입");
			list = service.getList();
			
			
			JsonElement element2 = gson.toJsonTree(list, new TypeToken<List>(){}.getType());
			JsonArray movieList2 = element2.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(movieList2);
			System.out.println(movieList2);
			return;

		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}

}
