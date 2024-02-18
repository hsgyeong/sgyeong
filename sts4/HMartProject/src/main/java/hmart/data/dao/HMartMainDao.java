package hmart.data.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import hmart.data.dto.productDto;

@Repository
public class HMartMainDao {

	@Autowired
	HMartMainDaoInter hmartMainDaoInter;
	
	public List<productDto> getAllDatas()
	{
		return hmartMainDaoInter.findAll(Sort.by(Sort.Direction.ASC, "price"));
	}
}
