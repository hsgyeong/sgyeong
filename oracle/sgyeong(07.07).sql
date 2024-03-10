--복습문제
--Q1.emp에서 job 종류별로 직업군을 한번씩만 출력해보세요
select DISTINCT job 직업군 from emp ;

--Q2.emp테이블에서 사원명이 A나 S로 시작하는 사람만 출력해보세요(사원번호 사원명)
select deptno 사원번호,ename 사원명 from emp where ename like 'A%' or ename like 'S%';

--Q3.emp에서 deptno가 10인 부서만 출력하시오(사원명 부서번호)
select ename 사원명,deptno 부서번호 from emp where deptno ='10';

--Q4.emp에서 급여(sal)가 평균보다 더 높은 사람만 사원명 급여를 출력하시오(6)
select ename 사원명,sal 급여 from emp where sal>(select avg(sal) from emp);

--Q5.SCOTT의 급여와 동일하거나 더 많이 받는 사람의 사원명과 급여를 출력하시오(3)
select ename 사원명,sal 급여 from emp where  sal>=(select sal from emp where ename='SCOTT');

--Q6.emp에서 hiredate에서 월이 5월인 사람만 사원명 입사일자 출력하시오(to_char사용)
select ename 사원명,hiredate 입사일자 from emp where to_char(hiredate,'mm')='05';


--7월 7일
--1.테이블 생성
--primary key는 기본키를 의미 not nul+unique를 의미한다

--test 테이블
create table test(num number(5) primary key,
name varchar2(20),score number(6,2),birth date);

desc test;  --test table의 구조 보기
select*from test;

--test에 전체데이터 insert
insert into test values(1,'손석구',67.2,'1997-07-11');
--test에 일부데이터 insert
insert into test (num,name) values (2,'강호동');

--insert 에러
insert into test values(4,'나문희',72.32,'1970-04-20');

--sysdate현재날짜 의미
insert into test values(5,'한지민',92.32,sysdate);

--alter
--나이를 저장할 컬럼 추가, 무조건 null로 추가
--ALTER TABLE 테이블명 ADD 추가할 컬럼명 데이터타입;

alter table test add age number(5);

--주소를 저장할 컬럼을 추가하는데 초기값을 강남구라고 지정
alter table test add addr varchar2(30) default '강남구';

--insert into test values(4,'나문희',72.32,'1970-04-20',43,'서울시 강남구 어쩌구 저쩌구 어디가 좋을까 배고픈데 오늘 구내식당 맛있는거 나왔으면 좋겠지만 비빔밥이 나온다는데 비빔밥은 소스가 중요한데 고추장이 맛있어야 함 3239-2312'

--주소 저장컬럼 30=>50
--ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입;
alter table test modify addr varchar2(50);

--age 타입을 문자열(10)으로 변경하고 초기값을 20으로 설정하기
--기존 null은 그대로 있고 새로 insert하는 것부터 초기값 들어감
alter table test modify age varchar2(10) default '20';
insert into test (num,name) values(10,'강호동');

--num의 오름차순 출력
select * from test order by num; --asc

--이름의 내림차순 검색
select * from test order by name desc;

--drop
--ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼명
--age라는 컬럼을 삭제
alter table test drop column age;
--addr라는 컬럼을 삭제
alter table test drop column addr;

--컬럼명 변경
--ALTER TABLE 테이블명 RENAME COLUMN OLD 컬럼명 TO NEW컬럼명;
--score==>jumsu
alter table test rename column score to jumsu;
--birth==>birthday
alter table test rename column birth to birthday;

--테이블 삭제 test
drop table test;





--시퀀스 생성
--시퀀스 기본으로 생성,1부터 1씩 증가하는 시퀀스 생성됨
create sequence seq1;

--전체시퀀스 확인
select * from seq;

--다음 시퀀스값을 발생 콘솔에 출력
select seq1.nextval from dual;

--현재 마지막 발생한 시퀀스값
select seq1.currval from dual;

--seq1 삭제
drop sequence seq1;

--10부터 5씩 증가하는 시퀀스 생성 - cache값 없애기
create sequence seq2 start with 10 increment by 5 nocache;

--시퀀스 발생
select seq2.nextval from dual;

--seq2 삭제
drop sequence seq2;

--seq1: 시작값:5 증가값:2 끝값:30 캐시:no, cycle:y
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;

--seq2: 시작값:1 증가값:1 cache:n
create sequence seq2 start with 1 increment by 1 nocache;
--create sequence seq2 nocach;
--기본이 1로 시작하기 때문에 start with 1 안써도 됨

--seq3: 시작값:1 증가값:2 cache:n
create sequence seq1 start with 1 increment by 2 nocache;

select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--전체 삭제
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

------------------------------------------------시퀀스 1개 생성, 테이블 생성
create sequence seq_start nocache;

create table personinfo (num number(5) primary key,
name varchar2(20),
job varchar2(30),
gender varchar2(20),
age number(5),
hp varchar2(20),
ipsaday date);

desc personinfo;

--birthday==>ipsaday
alter table personinfo rename column birthday to ipsaday;

--insert 
insert into personinfo values (seq_start.nextval,'이제훈','엔지니어','남자',29,'010-3241-2034','2023-02-01');
insert into personinfo values (seq_start.nextval,'이강인','운동선수','남자',24,'010-3422-2344','2023-05-01');
insert into personinfo values (seq_start.nextval,'한효주','배우','여자',30,'010-2112-2234','2023-04-01');
insert into personinfo values (seq_start.nextval,'김태형','가수','남자',34,'010-3241-2034','2023-05-11');
insert into personinfo values (seq_start.nextval,'안유진','아나운서','여자',29,'010-3041-2745','2023-07-21');
insert into personinfo values (seq_start.nextval,'이효리','요리사','여자',38,'010-3341-2554','2023-02-22');
insert into personinfo values (seq_start.nextval,'이정민','교사','남자',42,'010-3253-2214','2023-01-12');
insert into personinfo values (seq_start.nextval,'김주현','엔지니어','여자',32,'010-3321-2224','2023-05-02');
commit;

--최종인원확인
select count(*) from personinfo;
--조회연습
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5 asc;  --컬럼번호도 가능

select * from personinfo order by gender,age desc;
select * from personinfo order by gender,name;

select job from personinfo;
select distinct job from personinfo;


select * from personinfo;

--성이 김씨만 
select * from personinfo where name like '김%';
--이름이 두번째 글자가 강인사람
select * from personinfo where name like '_강%';

--핸드폰 마지막 자리가 2224인사람
select * from personinfo where hp like '%2224';

--입사일자가 3월인 사람 출력
select * from personinfo where to_char(ipsaday,'mm')='02';

--입사일자가 2023년인 사람 출력
select * from personinfo where to_char(ipsaday,'yyyy')='2023';

--나이가 20~30사이 출력
select * from personinfo where age>=20 and age<=30;

--직업이 배우이거나 가수인 사람
select * from personinfo where job in('배우','가수');

--직업이 배우이거나 가수가 아닌 사람
select * from personinfo where job not in('배우','가수');

--평균나이, 소수점 한자리로 구하기
select round (avg(age),1) from personinfo;

--내용수정(update)
--UPDATE 테이블명 SET 컬럼='변경할데이터' WHERE 컬럼2='데이터값';
--3번 직업 나이 수정하기,조건이 없으면 모든  데이터가 수정된다 조건필수
update personinfo set job='간호사',age=35;
--잘못수정한데이터 원래대로 돌리기
rollback;
--3번만
update personinfo set job='간호사',age=35 where num=3;

--이씨이면서 요리사인 사람의 젠더를 남자로 수정하기
update personinfo set gender='남자' where name like '이%' and job='요리사';

--num이 8번인 사람의 직업을 모델로 입사일을 2000-12-25일로 수정하시오
update personinfo set job='모델', ipsaday='2000-12-25' where num=16;


select * from personinfo;
commit;

--삭제
--delete from 테이블명

delete from personinfo;
rollback;

--9번만 삭제
delete from personinfo where num=9;

--여자중에서 나이가 25세 이상만 모두 삭제
delete from personinfo where gender='여자' and age>=25;

--핸드폰을 ***-****-**** 수정
update personinfo set hp ='***-****-****';

--테이블 삭제
--시퀀스 삭제
drop table personinfo;
drop sequence seq_start;


--dept에서 30번 부서를 시애틀로 변경하시오
update dept set loc='SEATTLE' where deptno='30';

update dept set dname= 'SALES' where deptno='30';

--emp테이블에 TotalSal열을 하나 더 추가하시오
alter table emp add TotalSal number(20);

--emp테이블 TotSal에 sal과 comm을 합한 가격을 더한 가격을 수정하시오
update emp set Totalsal=sal+nvl(comm,0);

select * from emp;

--emp에서 WARD 삭제하시오
delete from emp where ename='WARD';

--product 테이블에서 100번을 초코파이로 수정하시오
update product set p_name= '초코파이' where p_code='100';


--Groub by
--professor에서 학과별로 교수들의 평균급여를 출력하시오
select deptno 학과,avg(pay)"평균 급여"
from professor 
group by deptno;

--select절에 사용된 그룹함수 이외의 컬럼이나 표현식은 반드시 group by에 사용되어야함
--professor에서 직급별 평균 보너스를 출력하시오

select position 직급, avg(NVL(bonus,0)) "평균 보너스"
from professor group by position;

--학과별 직급별로 교수들의 평균급여
select deptno,position,avg(pay) "평균 급여"
from professor
group by deptno,position;

--student에서 학년별 최고키와 최고몸무게 출력
select grade, max(height) 최고키,max(weight) 최고몸무게 
from student
group by grade;

--교수의 직급별 총급여와 최고보너스를 구하시오
select position 직급,sum(pay) 총급여,max(bonus) 최고보너스
from professor
group by position;

--emp에서 동일한 직업끼리의 사원수를 구하시오
--직무 사원수
select job 직업, count(*) 사원수 
from emp
group by job;

--Having절_조건주고 검색하기_반드시 group by 뒤에...
--emp에서 평균급여가 2000이상인 부서의 부서번호와 평균급여를 구하시오
--where절은 그룹함수의 비교조건으로 쓸 수 없다
select deptno,avg(sal) 
from emp
group by deptno
having avg(sal)>2000;

--professor에서 평균급여가 300 이상인 학과의 학과번호와 평균급여를 구하시오
select deptno 학과번호, avg(pay) 평균급여 
from professor 
group by deptno
having avg(pay)>=300;

select deptno 학과번호, avg(pay) 평균급여 
from professor 
where deptno not in(101)
group by deptno 
having avg(pay)>=300
order by deptno desc;

--emp에서 job별로 sal의 평균급여를 구하시오
select job 직업,avg(sal) 평균급여
from emp
group by job;

--professor에서 직급별 총급여를 구하시오
select position 직급, sum(pay) 총급여
from professor
group by position;

--emp에서 직업별 인원수 최대급여 최소급여를 출력하세요(job의 오름차순)
select job,count(job),max(sal),min(sal) 
from emp
group by job 
order by job; 

--emp에서 입사년도 그룹별로 출력(입사년도,인원수,급여평균(소수점없이)_입사년도의 오름차순)
select to_char(hiredate,'yyyy') 입사년도, count(*) 인원수,round(avg(sal),0) 평균급여
from emp 
group by to_char(hiredate,'yyyy')
order by to_char(hiredate,'yyyy');

--Rollup함수
--자동으로 소계/합계 구해주는 함수
--group by절에 주어진 조건으로 소계값을 구해준다

select deptno 학과번호,position 직위,sum(pay) 총급여
from professor
group by position,rollup(deptno);

select deptno 학과번호,position 직위,sum(pay) 총급여
from professor
group by deptno,rollup(position);

--count
select position,count(*),sum(pay)
from professor
group by rollup(position);

--cube함수
--rollup처럼 각소계에 전체총계까지 구해준다
select deptno,position,count(*),sum(pay)
from professor
group by cube(deptno,position);

--오늘의 총복습
--Q1.emp에서 평균연봉이 2000이상인 부서의 부서번호와 평균급여를 구하시오
select deptno 부서번호,avg(sal) 평균급여
from emp
group by deptno
having avg(totalsal)>=2000;

--Q2.emp에서 deptno별 인원수는?
select deptno 부서번호,count(*) 인원수
from emp 
group by deptno;

--Q2.emp에서 job별 deptno가 10,20인 부서의 개수는?
select job 직업, deptno 부서번호, count(*) 부서
from emp 
group by job, deptno
having deptno=10 or deptno=20;

--Q3.emp에서 job별 인원수를 구하시오(단 인원이 2명보다 많은 곳만 구할것)
select job 직업, count(*) 인원수
from emp 
group by job
having count(*)>2;

--Q4.emp에서 job별 급여합계를 구하는데(president는 제외할것) 급여합계가 5000 이상만 구하고 급여합계가 높은순으로 출력하시오
--job 급여총계
select job 직업군,sum(sal)급여합계
from emp
where job not in('PRESIDENT') --PRESIDENT 제외
group by job -- job그룹별로
having sum(sal)>=5000 --급여합계가 5000 이상
order by sum(sal) desc;  --급여합계 내림차순



--제약조건
--테이블생성
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar2(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('홍보부','인사부','교육부')),
pay number(10) default 2000000);

--시퀀스생성
create sequence seq_sawon nocache;

--데이타 10정도 insert
--체크 제약조건 위배
--insert into sawon values(seq_sawon.nextval,'이영미','여자','게임개발부',3500000);
insert into sawon values(seq_sawon.nextval,'이영미','여자','홍보부',3500000);
insert into sawon values(seq_sawon.nextval,'김영준','남자','인사부',2700000);
insert into sawon values(seq_sawon.nextval,'한재혁','남자','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'김수영','남자','교육부',2900000);
insert into sawon values(seq_sawon.nextval,'이윤지','여자','홍보부',3000000);
insert into sawon values(seq_sawon.nextval,'김재현','남자','인사부',2700000);
insert into sawon values(seq_sawon.nextval,'서인아','여자','교육부',2800000);
insert into sawon values(seq_sawon.nextval,'김현재','남자','인사부',2700000);
insert into sawon values(seq_sawon.nextval,'이윤아','여자','인사부',3500000);
insert into sawon values(seq_sawon.nextval,'한상진','남자','홍보부',2700000);
commit;

--부서별 인원수와 최고급여, 최저급여 조회
select buseo 부서, count(*) 인원수,max(pay) 최고급여,min(pay) 최저급여
from sawon
group by buseo;

--위의 쿼리문에서 최고급여, 최저급여에 화폐단위 붙이고 3자리 컴마도 나오게 하세요
select buseo 부서, count(*) 인원수,to_char(max(pay),'L999,999,999') 최고급여,to_char(min(pay),'L999,999,999') 최저급여
from sawon
group by buseo;

--성별 인원수와 평균급여를 출력하시오(인원수 뒤에 명 이라고 나오도록 하세요)
select gender 성별, count(*)||'명' 인원수, round(avg(pay),0) 평균급여
from sawon 
group by gender;

--부서별 인원수와 평균급여를 구하되 인원이 4명 이상인 경우에만 출력하도록 하세요
select buseo 부서명,count(buseo) 인원수,avg(pay) 평균급여
from sawon
group by buseo
having count(buseo)>=4;


select * from sawon;

drop table sawon;
drop sequence seq_sawon;
