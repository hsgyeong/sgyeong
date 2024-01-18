package data.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.mapper.LoginMapperInter;

@Service
public class LoginService implements LoginServiceInter {

	@Autowired
	LoginMapperInter mapperInter;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

}
