package hmart.data.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name="product")
@Data
public class productDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column(name = "product")
	private String product;
	
	@Column
	private int price;
	
	@Column
	private String seller;
	
	@Column
	private String packingtype;
	
	@Column
	private String photo;
	
	@Column
	private String unit;
	
	@Column
	private String volumn;
	
	@CreationTimestamp
	@Column
	private Timestamp ipgoday;
}
