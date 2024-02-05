package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.productDto;

public interface HMartAdminDaoInter extends JpaRepository<productDto, Long> {

}


