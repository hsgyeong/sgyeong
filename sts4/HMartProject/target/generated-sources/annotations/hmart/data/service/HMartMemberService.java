package hmart.data.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hmart.data.dao.HMartMemberDaoInter;
import hmart.data.dto.HMartMemberDto;


@Service						
public class HMartMemberService {

	@Autowired
	private HMartMemberDaoInter hmartMemberDaoInter;
	
	public Optional<HMartMemberDto> getUserNameById(String id)  //Optional을 붙이는 이유: 명시적으로 값이 없을 수 있다고 표현
	{															//NullPointerException 방지
		return hmartMemberDaoInter.findById(id);
	}
	
	public int idPassCheck(String id, String password)
	{
		Optional<HMartMemberDto> memberDto = hmartMemberDaoInter.findById(id);
		
		if(memberDto.isPresent()) {
		String pass = hmartMemberDaoInter.findById(id).get().getPassword();
	//	System.out.println(pass+"비밀번호닷다다랏");
	//	if(memberDto.isPresent()) { 
		boolean passMatch = hmartMemberDaoInter.findById(id).get().getPassword().equals(password);
		
	//	System.out.println(passMatch);
		return passMatch ? 1:0;
		
		}else {
			return 0; 
		} 
	}
	
	public Optional<HMartMemberDto> getMemberInforById(String id)
	{
		return hmartMemberDaoInter.findById(id);
	}

	
}
