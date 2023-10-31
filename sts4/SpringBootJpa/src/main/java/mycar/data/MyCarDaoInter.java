package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;
								//jparepository로부터 알아서 extends 받는다
public interface MyCarDaoInter extends JpaRepository<MyCarDto, Long>{
										// 추상클래스
										//추상클래스를 extends 하면 무조건 overriding 받아야함

}
