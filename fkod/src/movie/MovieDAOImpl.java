package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MovieDAOImpl implements MovieDAO{
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static MovieDAO instance = new MovieDAOImpl();
	public static MovieDAO getInstance(){
		return instance;
	}
	private MovieDAOImpl(){
		
	}
}
