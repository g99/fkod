package movie;

import java.util.List;

public class MovieServiceImpl implements MovieService{
	private static MovieService instance = new MovieServiceImpl();
	public static MovieService getInstance(){
		return instance;
	}
	MovieDAO dao = MovieDAOImpl.getInstance();
	@Override	//영화등록
	public int register(MovieVO o) {
		return dao.insert(o);
	}
	@Override	//영화수정
	public int change(MovieVO o) {
		return dao.update(o);
	}
	@Override	//영화삭제
	public int remove(String filmNumber) {
		return dao.delete(filmNumber);
	}
	@Override	//영화제목으로 검색
	public MovieVO searchByName(String filmName) {
		return dao.selectNameBy(filmName);
	}
	@Override	//영화전체목록
	public List<MovieVO> getList() {
		return dao.selectAll();
	}
	@Override
	public List<MovieVO> getFilmNum() {
		return dao.selectChart();
	}
	
}
