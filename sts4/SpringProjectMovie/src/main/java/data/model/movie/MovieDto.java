package data.model.movie;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("dto")
public class MovieDto {

	public String mv_num;
	public String mv_title;
	public String mv_poster;
	public String mv_director;
	public String mv_opendate;
	
}
