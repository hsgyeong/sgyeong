package hmart.data.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="order")
@Data
public class OrderDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long order_idx;
	
	@Column
	private long num;
	
	@Column
	private int price;
	
	@Column
	private int delivery_fee;
	
	@Column
	private int item_discount;
	
	@Column
	private int coupon_discount;
	
	@Column
	private String received_name;
	
	@Column
	private String recipient_phone;
	
	@Column
	private String deliver_method;
	
	@Column
	private String deliver_address;
	
	@Column
	private String entrance_method;
	
	@Column
	private String notify_time;
	
	@Column
	private String orderer;
	
	@Column
	private String sender;
	
	
	
}
