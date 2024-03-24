package boot.data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.SmartDto;
import boot.data.mapper.SmartMapperInter;

@Service
public class SmartService implements SmartServiceInter {

	@Autowired
	SmartMapperInter mapperInter;
	
	@Override
	public void insertSshop(SmartDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertSshop(dto);
	}

	@Override
	public List<SmartDto> getAllSangpums(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllSangpums(num);
	}

	@Override
	public SmartDto getSdata(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getSdata(num);
	}

	@Override
	public void updateSshop(SmartDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateSshop(dto);
	}

	@Override
	public void deleteSshop(int num) {
		// TODO Auto-generated method stub
		mapperInter.deleteSshop(num);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public List<SmartDto> getList(int startPage, int perPage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startPage", startPage);
		map.put("perPage", perPage);
		
		return mapperInter.getList(map);
	}

}
