package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.HMartMemberDto;

public interface HMartMemberDaoInter extends JpaRepository<HMartMemberDto, Long> {

}
