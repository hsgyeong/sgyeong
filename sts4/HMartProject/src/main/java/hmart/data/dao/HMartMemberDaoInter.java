package hmart.data.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.HMartMemberDto;

public interface HMartMemberDaoInter extends JpaRepository<HMartMemberDto, Long> {

	Optional<HMartMemberDto> findById(String id);
	Optional<HMartMemberDto> findByPassword(String password);
//	public int idPassCheck(String id, String pass);
	
}
