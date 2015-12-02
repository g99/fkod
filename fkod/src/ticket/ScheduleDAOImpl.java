package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DatabaseFactory;
import global.Vendor;

public class ScheduleDAOImpl implements ScheduleDAO {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private List<ScheduleVO> list = new ArrayList<ScheduleVO>();
	private ScheduleVO schedule = new ScheduleVO();
	
	private static ScheduleDAO instance = new ScheduleDAOImpl();
	public static ScheduleDAO getInstance(){
		return instance;
	}
	private ScheduleDAOImpl() {
		con = DatabaseFactory
				.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
				.getConnection();
	}
	
	@Override
	public int insert(ScheduleVO o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> selectMovieRateAll() {
		List<String> list = new ArrayList<String>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select distinct movie.film_name as moviename from schedule, movie where schedule.film_number = movie.film_number order by movie.film_name asc");
			while (rs.next()) {
				list.add(rs.getString("moviename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<String> selectMovieAscAll() {
		List<String> list = new ArrayList<String>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select distinct movie.film_name as moviename from schedule, movie where schedule.film_number = movie.film_number order by movie.film_name asc");
			while (rs.next()) {
				list.add(rs.getString("moviename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<String> selectTheaterAll() {
		List<String> list = new ArrayList<String>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select distinct theater_name from schedule order by theater_name asc");
			while (rs.next()) {
				list.add(rs.getString("theater_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<String> selectDateAll() {
		List<String> list = new ArrayList<String>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select distinct show_date from schedule order by show_date asc");
			while (rs.next()) {
				list.add(rs.getString("show_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public ScheduleVO selectOneBy(String filmNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countBy(String filmNumber) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ScheduleVO o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String filmNumber) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
