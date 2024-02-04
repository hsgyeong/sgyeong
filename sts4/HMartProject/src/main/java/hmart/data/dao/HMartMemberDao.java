package hmart.data.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hmart.data.dto.HMartMemberDto;

@Repository
public class HMartMemberDao {

	@Autowired
	HMartMemberDaoInter hmartMemberDaoInter;
	
	public void insertMember(HMartMemberDto dto)
	{
		hmartMemberDaoInter.save(dto);
	}
	  
	 public int idPassCheck(String id, String password) //아이디에 대한 값 반환
	 {
		Optional<HMartMemberDto> loginId = hmartMemberDaoInter.findById(id);
		//Optional<HMartMemberDto> loginPass = hmartMemberDaoInter.findByPassword(password);
		
		String storedId = loginId.get().getId();
		String storedPass = loginId.get().getPassword();
		System.out.println(storedId+"이게 나오려나????");
		
		if(storedId.equals(id) && storedPass.equals(password)) {
			
			return 1;
		}else {
			
			return 0;
		}
	 }
	 
}
