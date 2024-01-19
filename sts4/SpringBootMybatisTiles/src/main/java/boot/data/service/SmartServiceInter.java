package boot.data.service;

import java.util.List;

import boot.data.dto.SmartDto;

public interface SmartServiceInter {

	public void insertSshop(SmartDto dto);
	public int getTotalCount();
	public List<SmartDto> getAllSangpums(int num);
	public List<SmartDto> getList(int startPage, int perPage);
	public SmartDto getSdata(int num);
	public void updateSshop(SmartDto dto);
	public void deleteSshop(int num);
}
