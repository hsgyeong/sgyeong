package boot.dto;

import lombok.Data;

@Data //@Data 있으면 GetterSetter 안 해도 됨
public class PersonDto {

	private String name;
	private String addr;
	private String hp;

}
