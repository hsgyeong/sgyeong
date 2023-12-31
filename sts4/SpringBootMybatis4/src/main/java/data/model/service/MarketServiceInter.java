
package data.model.service;

import java.util.List;

import data.model.dto.MarketDto;

public interface MarketServiceInter {

	public int getTotalCount();			//() 안은 parameter type
	public List<MarketDto> getAllSangpums();
	public void insertMarket(MarketDto dto);
	public MarketDto getData(String num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(String num);
}
