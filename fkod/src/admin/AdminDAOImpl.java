package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DQL;
import global.DatabaseFactory;
import global.Vendor;

public class AdminDAOImpl implements AdminDAO {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private List<AdminVO> list = new ArrayList<AdminVO>();
	private AdminVO admin = new AdminVO();
			
	private static AdminDAO instance = new AdminDAOImpl();
	public static AdminDAO getInstance(){
		return instance;
	}
	public AdminDAOImpl() {
		con = DatabaseFactory
				.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
				.getConnection();
	}
	@Override
	public List<AdminVO> selectAll() {
		List<AdminVO> list = new ArrayList<AdminVO>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(DQL.serchAll("member"));
			
			while (rs.next()) {
				AdminVO temp = new AdminVO();
				temp.setUserid(rs.getString("userid"));
				temp.setPassword(rs.getString("password"));
				temp.setName(rs.getString("name"));
				temp.setBirth(rs.getString("birth"));
				temp.setAddr(rs.getString("addr"));
				temp.setGender(rs.getString("gender"));
				temp.setEmail(rs.getString("email"));
				temp.setPhone(rs.getString("phone"));
				list.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int update(AdminVO member) {
		int result = 0;
		try {
			String sql = "update member set password = ?, addr = ?, email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getAddr());
			pstmt.setString(4, member.getEmail());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
