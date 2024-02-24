package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.itemDto;

public interface HMartItemDaoInter extends JpaRepository<itemDto, Long>{

}
