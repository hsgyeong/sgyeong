package data.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Service  //mapper를 전달해서 받는 역할이 service. 따라서 mapper를 autowired 받아야함
public class MarketService implements MarketServiceInter {
	
	//controller > service > mapper 
	//controller에서 service를 최종적으로 autowired 받아야함 
	//service는 mapper를 보완해주는 기능으로 많이 쓴다. mapper의 자바로직을 보완하기 위한 공간(?)

	@Autowired
	MarketMapperInter mapperInter;	
	
/*	@Autowired
	MarketService service;	*/
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllSangpums() {
		// TODO Auto-generated method stub
		return mapperInter.getAllSangpums();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMarket(dto);
	}

	@Override
	public MarketDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateMarket(dto);
	}

	@Override
	public void deleteMarket(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteMarket(num);
	}

}
