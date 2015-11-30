package global;

import java.util.StringTokenizer;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();

	public static CommandFactory getInstance() {
		return instance;
	}

	private CommandFactory() {
		// TODO Auto-generated constructor stub
	}

	public Command createCommand(String path, String page) {
		System.out.println("패    스 : " + path); // global.Main.do
		StringTokenizer token = new StringTokenizer(path, "/");
		String directory = token.nextToken(); // global
		String action = token.nextToken(); // Main.do
		System.out.println("디렉토리 : " + directory);
		System.out.println("액    션 : " + action);
		Command command = Command.getInstance();
		if (page == null) { // 메인화면일경우
			page = "Main";
		}
		command.setDirectory(directory); // 디렉토리 세팅
		command.setPage(page); // 페이지를 세팅하고
		command.setView();
		System.out.println("페 이 지 : " + page);
		return command;
	}
}
