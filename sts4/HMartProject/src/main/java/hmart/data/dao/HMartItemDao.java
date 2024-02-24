package hmart.data.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hmart.data.dto.itemDto;

@Repository
public class HMartItemDao {

	@Autowired 
	HMartItemDaoInter hmartItemDaoInter;
	
	public itemDto getData(Long num)
	{
		return hmartItemDaoInter.getReferenceById(num);
	}
}
