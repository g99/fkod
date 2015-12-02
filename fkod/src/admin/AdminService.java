package admin;

import java.util.List;

public interface AdminService {

	// 전체 회원목록
	public List<AdminVO> getMemberList();
	
	public int change(AdminVO member);

}
