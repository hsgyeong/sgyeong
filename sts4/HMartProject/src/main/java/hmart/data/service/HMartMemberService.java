package hmart.data.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;

@Service
public class HMartMemberService implements HMartMemberServiceInter {

	@Autowired 
	private HMartMemberDaoInter hmartMemberDaoInter;
	
	public Optional<HMartMemberDto> getUserNameById(String id){
		return hmartMemberDaoInter.findById(id);
	}
	
	public int getSearchId(String id){
		Optional<HMartMemberDto> memberDto = hmartMemberDaoInter.findById(id);
		
		if(memberDto.isPresent()){
			String usedID = hmartMemberDaoInter.findById(id).get().getId();
			boolean idMatch = hmartMemberDaoInter.findById(id).get().getId().equals(id);
		
			return idMatch? 1:0;
		}else{
			return 0;
		}
	}
	
	public int idPassCheck(String id, String password){
		Optional<HMartMemberDto> memberDto = hmartMemberDaoInter.findById(id);
		
		if(memberDto.isPresent()){
			String pass = hmartMemberDaoInter.findById(id).get().getPassword();
			boolean passMatch = hmartMemberDaoInter.findById(id).get().getPassword().equals(password);
		
			return passMatch? 1:0;
		}else{
			return 0;
		}
	}
	
	public Optional<HMartMemberDto> getMemberInfoById(String id){
		return hmartMemberDaoInter.findById(id);
	}
}
