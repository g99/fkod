package global;

public class Constants {
	/**
	 * 벤더(Vendor : 공급업체) 가 제공하는 low-level의 접속값 이므로 상수처리
	 */
	public static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String ORACLE_ID = "movie";
	public static final String ORACLE_PASSWORD = "movie";
	public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
	public static final String MYSQL_URL = "jdbc:mysql://localhost:3306/DB_NAME";
	public static final String MSSQL_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	public static final String MSSQL_URL = "jdbc:sqlserver://localhost:1433";
	public static final String MARIA_DRIVER = "org.mariadb.jdbc.Driver";
	public static final String MARIA_URL = "jdbc:mariadb://localhost:3306/test_db";
	public static final String VIEW = "/WEB-INF/view/";
}

