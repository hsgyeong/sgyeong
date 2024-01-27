package hmart.data.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import hmart.data.dto.productDto;

@Repository
public class HMartDao {

	@Autowired
	HMartDaoInter hmartDaoInter;
	
	public void insertHMart(productDto dto)
	{
		hmartDaoInter.save(dto);
	}
	
	public List<productDto> getAllDatas()
	{
		return hmartDaoInter.findAll(Sort.by(Sort.Direction.ASC, "price"));
	}
	
	
	

}
