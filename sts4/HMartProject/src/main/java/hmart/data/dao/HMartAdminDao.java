package hmart.data.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import hmart.data.dto.productDto;

@Repository
public class HMartAdminDao {

	@Autowired
	HMartAdminDaoInter hmartAdminDaoInter;
	
	public void insertHMart(productDto dto)
	{
		hmartAdminDaoInter.save(dto);
	}
	
	

}
