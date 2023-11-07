package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {

	public int getMaxNum(); // maxnum이 없으면 시작할 수 없음. maxnum보다 1이 큰 값이 group number가 됨
	public int getTotalCount(String searchcolumn, String searchword);  //searchcolumn, search word
	//public List<ReboardDto> getPagingList(Map<String, Object> map);  
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage); //string 과 int를 함께 넘기기 때문에 object 사용
	public void insertReboard(ReboardDto dto);
	//public void updateRestep(Map<String, Integer> map);  string은 map을 생성하면 앞의 key값은 무조건 string이되고, value값은 int넘기기 때문에 integer
	public void updateRestep(int regroup, int restep);
	public void updateReadCount(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
	public ReboardDto getData(int num);
}
