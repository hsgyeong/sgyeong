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
	  
	 public HMartMemberDto idPassCheck(String id, String password)
	 {
		Optional<HMartMemberDto> loginId = hmartMemberDaoInter.findById(id);
		Optional<HMartMemberDto> loginPass = hmartMemberDaoInter.findByPassword(password);
		
		if(loginId.isPresent() && loginPass.isPresent()) {
			
			return loginPass.get();
		}else {
			
			return null;
		}
	 }
	 
	 public Optional<HMartMemberDto> getMemberInfoById(String id, String addr, String email)
	 {
		 return hmartMemberDaoInter.findByNameAndAddrAndEmail(id, addr, email);
	 }
	 
}
