package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public void deleteMember(String num);
	public String getName(String id);
	public int loginPassCheck(Map<String, String> map);
	public MemberDto getDataByid(String id);
	public MemberDto getMemberData(String num);
	public void updatePhoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
	public MemberDto getDataByNum(String num);
}
