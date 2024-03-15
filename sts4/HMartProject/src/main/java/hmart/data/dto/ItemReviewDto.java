package hmart.data.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="item_review")
public class ItemReviewDto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_idx")
	private long reviewIdx;

	@ManyToOne
	@JoinColumn(name = "user_idx")
	private HMartMemberDto membership;
	
	@ManyToOne
	@JoinColumn(name = "item_idx")
	private ItemDto item;
	
	@Column(name = "write_date")
	private Timestamp writeDate;
	
	@Column(name = "delete_yn")
	private boolean delenteYN;
	
	@Column(name = "item_review")
	private String itemReview;
	

}
