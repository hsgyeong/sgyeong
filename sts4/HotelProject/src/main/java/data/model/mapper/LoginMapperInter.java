package data.model.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapperInter {

	public int getTotalCount();
}
