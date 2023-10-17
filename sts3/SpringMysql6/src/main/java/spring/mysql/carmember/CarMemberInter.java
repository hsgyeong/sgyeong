package spring.mysql.carmember;

import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;

public interface CarMemberInter {

	public int getTotalCount();
	public List<CarMemberDto> getAllCarmembers();
	public void insertCarMember(@ModelAttribute CarMemberDto dto);
	public void deleteCarMember(String num);
	public CarMemberDto getData(String num); 
	public void update(@ModelAttribute("dto") CarMemberDto dto);
	 
	
	
	//insert
	//allselect
	//getdata
	//update
	//delete
}
