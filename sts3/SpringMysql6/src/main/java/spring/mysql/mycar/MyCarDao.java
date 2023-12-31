package spring.mysql.mycar;

import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

@Repository
public class MyCarDao {
	
	@Autowired  //자동주입
	private SqlSession session;
	
	String namespace="spring.mysql.mycar.MyCarDao";
	
	public int getTotalCount()
	{
		return session.selectOne(namespace+".getTotalCount");//아이디값 넣어주기
	}
	
	//insert
	public void insertCar(@ModelAttribute MyCarDto dto)
	{
		session.insert("insertOfMyCar", dto);	
	}
	
	//전체목록
	public List<MyCarDto> getAllCars()
	{
		return session.selectList("getAllListOfMyCar");
	}
	
	//getdata
	public MyCarDto getData(String num)
	{
		return session.selectOne("getDataOfMyCar", num);
		
	}
	
	//update
	public void updateCar(@ModelAttribute MyCarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
	
	//delete
	public void deleteCar(String num)
	{
		session.delete("deleteOfMyCar", num);
	}
	
}
