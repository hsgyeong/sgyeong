package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {
   
   @Autowired
   MemberMapperInter mapperInter;

   @Override
   public void insertMember(MemberDto dto) {
      // TODO Auto-generated method stub
      mapperInter.insertMember(dto);
   }

   @Override
   public List<MemberDto> getAllMembers() {
      // TODO Auto-generated method stub
      return mapperInter.getAllMembers();
   }


   public MemberDto getMemberData(String num) {
      // TODO Auto-generated method stub
      return mapperInter.getMemberData(num);
   }

   @Override
   public void deleteMember(String num) {
      // TODO Auto-generated method stub
      mapperInter.deleteMember(num);
   }

   @Override
   public String getName(String id) {
      // TODO Auto-generated method stub
      return mapperInter.getName(id);
   }

   @Override
   public MemberDto getDataByid(String id) {
      // TODO Auto-generated method stub
      return mapperInter.getDataByid(id);
   }

   @Override
	public int getSerchId(String id) {
	// TODO Auto-generated method stub
	return mapperInter.getSearchId(id);
   }

   @Override
   public int loginPassCheck(String id, String pass) {
	// TODO Auto-generated method stub
	 Map<String, String> map=new HashMap<>();
     
     map.put("id", id);
     map.put("pass", pass);
     
     return mapperInter.loginPassCheck(map);
   }

   @Override
   public void updatePhoto(String num, String photo) {
	// TODO Auto-generated method stub
	
	Map<String,String> map=new HashMap<>();
	
	map.put("photo", photo);
	map.put("num",num);
	
	mapperInter.updatePhoto(map);
   }

   @Override
   public void updateMember(MemberDto dto) {
	// TODO Auto-generated method stub
	
	mapperInter.updateMember(dto);
   }

   @Override
   public MemberDto getDataByNum(String num) {
	// TODO Auto-generated method stub
	return mapperInter.getDataByNum(num);
}

	}