package spring.mvc.json;

public class PhotoDto {

	private String name;
	private String photo;
	
	public PhotoDto(String name,String photo)  //생성과 동시에 넣는 것. 쉽게 하기 위함
	{
		super();
		this.name=name;
		this.photo=photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
}
