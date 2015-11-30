package global;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import global.Constants;

public class DatabaseImpl implements Database{
	private String driver, url, userId, password;
	private Connection connection;

	public DatabaseImpl(String driver, String url, String userId, String password) {
		this.driver = driver;
		this.url = url;
		this.userId = userId;
		this.password = password;
		String server = "192.168.0.1";
	}
	@Override
	public Connection getConnection() {
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, userId, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
