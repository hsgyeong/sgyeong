package boot.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemBoardDto;

@Mapper
public interface MemBoardMapperInter {

	public int getTotalCount();
	public void updatereadcount(String num);
	public void insertBoard(MemBoardDto dto);
	public MemBoardDto getData(String num);
	public int getMaxNum();  //2번 글이 있을 때 글을 쓰면 3번글로 들어가기 때문에 maxnum 필요
							//insert 시킬때 content detail로 가면 어떤 num으로 가는지 알기 위함
							//예를 들어 현재 글이 2일때 3번 글로 가기 위해서 maxnum 필요
	public List<MemBoardDto> getList(HashMap<String, Integer> map);
	public void updateBoard(MemBoardDto dto);
	public void deleteBoard(String num);
}
