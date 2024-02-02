package hmart.data.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hmart.data.dto.HMartMemberDto;

@Repository
public interface HMartMemberDaoInter extends JpaRepository<HMartMemberDto, Long> {

	Optional<HMartMemberDto> findById(String id);
	Optional<HMartMemberDto> findByPassword(String password);
	Optional<HMartMemberDto> findByNameAndAddrAndEmail(String id, String addr, String email);
	


	
}
