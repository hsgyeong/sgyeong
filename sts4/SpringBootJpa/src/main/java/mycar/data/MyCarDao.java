package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository //bean에 등록
public class MyCarDao{
	
	@Autowired
	MyCarDaoInter carInter;

	//insert
	public void insertMyCar(MyCarDto dto){
		carInter.save(dto);  //id타입의 유무에 따라 자동으로 insert, 또는 update인지 달라짐
	}						//insert에는 num, seq모르기 때문에 자동으로 됨 / update에는 num,seq존재
	
							//내장톰캣이면 올린 이미지 파일들이 폴더에 올라감

	//전체출력
	public List<MyCarDto> getAllDatas(){
		
		// return carInter.findAll();   //sort는 sql문에서 orderby와 같다
		return carInter.findAll(Sort.by(Sort.Direction.DESC, "carprice")); //가격이 높은순
	}
	
	//num에 대한 값반환(dto)
	public MyCarDto getData(Long num){
		return carInter.getReferenceById(num);
	}
	
	//update
	public void updateMyCar(MyCarDto dto){
		carInter.save(dto);
	}
	
	//delete
	public void deleteMyCar(Long num){
		carInter.deleteById(num);
	}

}
