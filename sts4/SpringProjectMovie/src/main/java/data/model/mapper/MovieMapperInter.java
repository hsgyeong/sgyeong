package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.movie.MovieDto;

@Mapper
public interface MovieMapperInter {

	public int getTotalCount();
	public List<MovieDto> getAllMovies();
	public void insertMovie(MovieDto dto);
	public MovieDto getData(int num);
	public void deleteMovie(int num);
	public void updateMovie(MovieDto dto);
}
