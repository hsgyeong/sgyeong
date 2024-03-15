package hmart.data.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="cart_mapping")
@Data
public class CartDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long cart_id;
	
	@ManyToOne
	@JoinColumn(name="user_idx", referencedColumnName = "user_idx")
	private HMartMemberDto membership;
	
	@ManyToOne
	@JoinColumn(name="item_id", referencedColumnName = "item_id")
	private ItemDto item;
}
