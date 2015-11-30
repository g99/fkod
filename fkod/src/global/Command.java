package global;

public class Command {
	/**
	 * URL => http://localhost:9000/jsp-programming2/rps/main.do?rps=rock&page=rps_reuslt
	 * URI(get) => /jsp-programming2/rps/main.do?rps=rock&page=rps_reuslt
	 * URI(post) => /jsp-programming2/rps/main.do
	 * 	== 포스트방식은 쿼리스트링이 없다.
	 * 쿼리스트링 => rps=rock&page=rps_reuslt
	 * 
	 * URI는 프로젝트 내부에서는 유링한값(ID) 이어야 하며,
	 * 이를 분해해서 서블릿에 명령을 내리는 구조로 이루어져있다.
	 */
	private static Command instance = new Command();
	private String directory, view, page;
	
	public static Command getInstance() {
		return instance;
	}
	
	private Command() {
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public String getView() {
		return view;
	}

	public void setView() {
		this.view = Constants.VIEW + directory + "/" + page + ".jsp";
	}
}
