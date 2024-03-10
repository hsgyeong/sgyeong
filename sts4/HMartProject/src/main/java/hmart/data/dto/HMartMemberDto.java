package hmart.data.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="membership")
@Data
public class HMartMemberDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column
	private String id;
	
	@Column
	private String password;
	
	@Column
	private String name;
	
	@Column
	private String email;
	
	@Column
	private String address;
	
	@Column
	private String extraAddress;
	
	@Column
	private String detailAddress;
	
	@Column
	private String postcode;
	
}
