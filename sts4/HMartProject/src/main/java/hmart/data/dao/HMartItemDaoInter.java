package hmart.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import hmart.data.dto.ItemDto;

public interface HMartItemDaoInter extends JpaRepository<ItemDto, Long>{

}
