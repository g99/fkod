package movie;

import java.util.List;

import movie.MovieVO;

public interface MovieDAO {
	public List<MovieVO> selectAll();
	public int insert(MovieVO o);
	public int update(MovieVO o);
	public int delete(String filmNumber);
	public MovieVO selectNameBy(String movieName);
}
