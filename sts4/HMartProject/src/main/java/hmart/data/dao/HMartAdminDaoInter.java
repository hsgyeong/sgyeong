package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.ItemDto;

public interface HMartAdminDaoInter extends JpaRepository<ItemDto, Long> {

}


