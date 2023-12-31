package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSerchId(String id);
	public String getName(String id);
	public int loginPassCheck(String id, String pass);
	public void deleteMember(String num);
	public MemberDto getDataByid(String id);
	public void updatePhoto(String num, String photo);
	public void updateMember(MemberDto dto);
	public MemberDto getDataByNum(String num);
}
