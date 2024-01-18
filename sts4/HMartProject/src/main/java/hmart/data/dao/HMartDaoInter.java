package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.HMartDto;

public interface HMartDaoInter extends JpaRepository<HMartDto, Long> {

}
