package admin;

import java.util.ArrayList;
import java.util.List;

public class AdminServiceImpl implements AdminService {
	private static AdminService instance = new AdminServiceImpl();
	public static AdminService getInstance(){
		return instance;
	}
	AdminDAO dao = AdminDAOImpl.getInstance();
	
	
	// 회원목록
	@Override
	public List<AdminVO> getMemberList() {
		List<AdminVO> list = new ArrayList<AdminVO>();
		return list = dao.selectAll();
	}


	@Override
	public int change(AdminVO member) {
		return dao.update(member);
	}

}
