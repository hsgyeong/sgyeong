package hmart.data.dao;

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
}
