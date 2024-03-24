package hmart.data.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hmart.data.dto.ItemDto;

@Repository
public class HMartItemDao {

	@Autowired 
	HMartItemDaoInter hmartItemDaoInter;
	
	public ItemDto getData(Long item_id){
		return hmartItemDaoInter.getReferenceById(item_id);
	}
}
