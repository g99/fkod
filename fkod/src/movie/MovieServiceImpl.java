package movie;

public class MovieServiceImpl implements MovieService{
	private static MovieService instance = new MovieServiceImpl();
	public static MovieService getInstance(){
		return instance;
	}
}
