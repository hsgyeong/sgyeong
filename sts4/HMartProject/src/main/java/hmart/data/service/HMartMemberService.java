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
		Optional<HMartMemberDto> loginId = hmartMemberDaoInter.findById(id);
		Optional<HMartMemberDto> loginPass = hmartMemberDaoInter.findByPassword(password);
	
		boolean idMatch = id.equals(loginId);
		boolean passMatch = password.equals(loginPass);
		
		return passMatch && idMatch ? 1:0;
	}
	
	public Optional<HMartMemberDto> getMemberInforById(String id)
	{
		return hmartMemberDaoInter.findById(id);
	}

	
}
