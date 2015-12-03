package ticket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
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
	List timeList = new ArrayList();
	String movie, theater, date;
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seperator.init(request);
		switch (Seperator.command.getPage()) {
		case "Ticket":
			break;
		case "movieSelect":
			movie = request.getParameter("movie");
			theater = request.getParameter("theater");
			date = request.getParameter("date");
			System.out.println("받은영화 : "+movie);
			System.out.println("받은극장 : "+theater);
			System.out.println("받은날짜 : "+date);
			if (theater==null && date!=null) {
				System.out.println("극장널");
				theaterList = ticketService.getTheaterListByMD(movie,date);
			} else if (theater!=null && date==null) {
				System.out.println("날짜널");
				dateList = ticketService.getShowDateListByMT(movie,theater);
			} else if (theater==null && date==null) {
				System.out.println("다널");
				theaterList = ticketService.getTheaterListByM(movie);
				dateList = ticketService.getShowDateListByM(movie);
			} else if (movie!=null&&theater!=null&&date!=null) {
				timeList = ticketService.getTimeList(movie, theater, date);
			}
			List movieSelectList = new ArrayList();
			System.out.println("극장" +theaterList);
			System.out.println("날짜" +dateList);
			movieSelectList.add(theaterList);
			movieSelectList.add(dateList);
			movieSelectList.add(timeList);
			JsonArray movieCheckedList = gson.toJsonTree(movieSelectList, new TypeToken<List>() {}.getType()).getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(movieCheckedList);
			return;
		case "theaterSelect":
			movie = request.getParameter("movie");
			theater = request.getParameter("theater");
			date = request.getParameter("date");
			if (movie==null && date!=null) {
				movieListRate = ticketService.getMovieRateByTD(theater,date);
				movieListAsc = ticketService.getMovieAscByTD(theater,date);
			} else if (movie!=null && date==null) {
				dateList = ticketService.getShowDateListByMT(movie, theater);
			} else if (movie==null && date==null) {
				movieListRate = ticketService.getMovieRateByT(theater);
				movieListAsc = ticketService.getMovieAscByT(theater);
				dateList = ticketService.getShowDateListByT(theater);
			} else if (movie!=null&&theater!=null&&date!=null) {
				timeList = ticketService.getTimeList(movie, theater, date);
			}
			List theaterSelectList = new ArrayList();
			theaterSelectList.add(movieListRate);
			theaterSelectList.add(movieListAsc);
			theaterSelectList.add(dateList);
			theaterSelectList.add(timeList);
			JsonArray theaterCheckedList = gson.toJsonTree(theaterSelectList, new TypeToken<List>() {}.getType()).getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(theaterCheckedList);
			return;
		case "dateSelect":
			movie = request.getParameter("movie");
			theater = request.getParameter("theater");
			date = request.getParameter("date");
			if (movie==null && theater!=null) {
				movieListRate = ticketService.getMovieRateByTD(theater,date);
				movieListAsc = ticketService.getMovieAscByTD(theater,date);
			} else if (movie!=null && theater==null) {
				theaterList = ticketService.getTheaterListByMD(movie,date);
			} else if (movie==null && theater==null) {
				movieListRate = ticketService.getMovieRateByD(date);
				movieListAsc = ticketService.getMovieAscByD(date);
				theaterList = ticketService.getTheaterListByD(date);
			} else if (movie!=null&&theater!=null&&date!=null) {
				timeList = ticketService.getTimeList(movie, theater, date);
			}
			List dateSelectList = new ArrayList();
			dateSelectList.add(movieListRate);
			dateSelectList.add(movieListAsc);
			dateSelectList.add(theaterList);
			dateSelectList.add(timeList);
			JsonArray dateCheckedList = gson.toJsonTree(dateSelectList, new TypeToken<List>() {}.getType()).getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(dateCheckedList);
			return;
		case "initList":
			movieListRate = ticketService.getRateList();
			movieListAsc = ticketService.getAscList();
			theaterList = ticketService.getTheaterList();
			dateList = ticketService.getShowDateList();
			List initList = new ArrayList();
			initList.add(movieListAsc);
			initList.add(movieListAsc);
			initList.add(theaterList);
			initList.add(dateList);
			System.out.println("리스트"+initList);
			JsonArray totalInitList = gson.toJsonTree(initList, new TypeToken<List>() {}.getType()).getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(totalInitList);
			return;
		default:
			break;
		}
		DispatcherServlet.getInstance().runDispatcher(request, response, Seperator.command.getView());
	}
}
