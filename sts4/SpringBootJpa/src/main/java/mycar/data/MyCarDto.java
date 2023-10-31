package mycar.data;

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
@Table(name="mycar")  //자동으로 mycar라는 table이 mysql에 만들어짐 
@Data
public class MyCarDto {

	@Id  //각 엔터티를 구별할 수 있는 식별 아이디를 갖도록 설계(시퀀스)  //업데이트 할 때 아이디가 있냐 없냐로 판단
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;				//위는 식별자. 기본키를 설정하는 것
	
	@Column(name = "carname") //각각의 컬럼이라는 것을 표시
	private String carname;
	
	@Column //이름 같으면 생략 가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String carguip;
	
	@CreationTimestamp  //엔터티가 생성되는 시점의 시간 자동등록
	@Column(updatable = false)  //수정시 이 컬럼은 수정하지 않겠다는 뜻
	//updatable = false 없을시 날짜가 null로 찍힐 것
	private Timestamp guipday;

	@Column
	private String carphoto;
}

