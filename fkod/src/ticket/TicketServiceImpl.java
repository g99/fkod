package ticket;

import java.util.List;

import global.Constants;
import global.DatabaseFactory;
import global.Vendor;


public class TicketServiceImpl implements TicketService {

	private static TicketService instance = new TicketServiceImpl();
	private TicketServiceImpl() {}
	public static TicketService getInstance(){
		return instance;
	}
	
	ScheduleDAO scheduleDAO = ScheduleDAOImpl.getInstance();
	
	@Override
	public List<String> getRateList() {
		return scheduleDAO.selectMovieRateAll();
	}
	@Override
	public List<String> getAscList() {
		return scheduleDAO.selectMovieAscAll();
	}
	@Override
	public List<String> getTheaterList() {
		return scheduleDAO.selectTheaterAll();
	}
	@Override
	public List<String> getShowDateList() {
		return scheduleDAO.selectDateAll();
	}
}
