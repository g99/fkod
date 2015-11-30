package global;

import java.sql.Connection;

import global.Constants;

public class DatabaseFactory {
	public static Database getDatabase(Vendor vendor, String id, String pass) {
		String driver = null, url = null;
		
		switch (vendor) {
		case ORACLE:
			driver = Constants.ORACLE_DRIVER;
			url = Constants.ORACLE_URL;
			break;
		case MYSQL:
			driver = Constants.MYSQL_DRIVER;
			url = Constants.MYSQL_URL;
			break;
		case MSSQL:
			driver = Constants.MSSQL_DRIVER;
			url = Constants.MSSQL_URL;
			break;
		case MARIADB:
			driver = Constants.MARIA_DRIVER;
			url = Constants.MARIA_URL;
			break;
	
		default:
			break;
		}
		return new DatabaseImpl(driver, url, id, pass);
	}
}
