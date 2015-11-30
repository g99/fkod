package global;

import javax.servlet.http.HttpServletRequest;

public class Seperator {
	public static Command command;
	public static void init(HttpServletRequest request) {
		String path = request.getServletPath();
		String page = request.getParameter("page");
		command = CommandFactory.getInstance().createCommand(path, page);
	}
}

