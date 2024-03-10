package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

@Repository
public class CarMemberDao implements CarMemberInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfCarMember");
	}

	@Override
	public List<CarMemberDto> getAllCarmembers() {
		// TODO Auto-generated method stub
		return session.selectList("getAllListOfCarMember"); 
	}

	@Override
	public void insertCarMember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfCarMember", dto);
	}

	@Override
	public void deleteCarMember(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfCarMember", num); 
	}

	@Override  //getData를 해야 dao에서 값을 받아올 수 있음
	public CarMemberDto getData(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("getDataOfCarMember", num);
	}

	@Override
	public void update(@ModelAttribute CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfCarMember", dto);
	}

	

	
// interface를 쓰는 이유? 나중에 어떤 method를 썼는지 쉽게 확인하기 위함

	

}
