package ticket;

import java.util.List;

public interface ScheduleDAO {
	// C
		public int insert(ScheduleVO o);
		
		// R
		public List<String> selectMovieRateAll();
		public List<String> selectMovieAscAll();
		public List<String> selectTheaterAll();
		public List<String> selectDateAll();
		public ScheduleVO selectOneBy(String filmNumber);
		public int countBy(String filmNumber);
		public int count();
		
		// U
		public int update(ScheduleVO o);
		
		// D
		public int delete(String filmNumber);
}
