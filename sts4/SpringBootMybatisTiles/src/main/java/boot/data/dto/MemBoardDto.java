package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("memboard")
public class MemBoardDto {

	private String num;
	private String name;
	private String myid;   // name 만들어주면 편하지만 dto에서 불러와도 되기 때문에 안 만들어줘도 됨.
	private String subject;
	private String content;
	private String uploadfile;
	private MultipartFile upload;   //multipart할 때 이름 form에 있는 이름과 맞춰줘야 함
									//인자값 미리 만들어 놓은 것
	private int readcount;
	private Timestamp writeday;
	
}
