package global;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet {
	private static DispatcherServlet instance = new DispatcherServlet(); 

	public static DispatcherServlet getInstance() {
		return instance;
	}
	
	public DispatcherServlet() {
	}

	public void runDispatcher(HttpServletRequest request, HttpServletResponse response, String view) { // 실행
		RequestDispatcher dis;
		System.out.println("리퀘스트 : " + view + "\n");
		dis = request.getRequestDispatcher(view);
		try {
			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
