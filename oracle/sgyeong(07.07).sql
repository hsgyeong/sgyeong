--��������
--Q1.emp���� job �������� �������� �ѹ����� ����غ�����
select DISTINCT job ������ from emp ;

--Q2.emp���̺��� ������� A�� S�� �����ϴ� ����� ����غ�����(�����ȣ �����)
select deptno �����ȣ,ename ����� from emp where ename like 'A%' or ename like 'S%';

--Q3.emp���� deptno�� 10�� �μ��� ����Ͻÿ�(����� �μ���ȣ)
select ename �����,deptno �μ���ȣ from emp where deptno ='10';

--Q4.emp���� �޿�(sal)�� ��պ��� �� ���� ����� ����� �޿��� ����Ͻÿ�(6)
select ename �����,sal �޿� from emp where sal>(select avg(sal) from emp);

--Q5.SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� ������ �޿��� ����Ͻÿ�(3)
select ename �����,sal �޿� from emp where  sal>=(select sal from emp where ename='SCOTT');

--Q6.emp���� hiredate���� ���� 5���� ����� ����� �Ի����� ����Ͻÿ�(to_char���)
select ename �����,hiredate �Ի����� from emp where to_char(hiredate,'mm')='05';


--7�� 7��
--1.���̺� ����
--primary key�� �⺻Ű�� �ǹ� not nul+unique�� �ǹ��Ѵ�

--test ���̺�
create table test(num number(5) primary key,
name varchar2(20),score number(6,2),birth date);

desc test;  --test table�� ���� ����
select*from test;

--test�� ��ü������ insert
insert into test values(1,'�ռ���',67.2,'1997-07-11');
--test�� �Ϻε����� insert
insert into test (num,name) values (2,'��ȣ��');

--insert ����
insert into test values(4,'������',72.32,'1970-04-20');

--sysdate���糯¥ �ǹ�
insert into test values(5,'������',92.32,sysdate);

--alter
--���̸� ������ �÷� �߰�, ������ null�� �߰�
--ALTER TABLE ���̺�� ADD �߰��� �÷��� ������Ÿ��;

alter table test add age number(5);

--�ּҸ� ������ �÷��� �߰��ϴµ� �ʱⰪ�� ��������� ����
alter table test add addr varchar2(30) default '������';

--insert into test values(4,'������',72.32,'1970-04-20',43,'����� ������ ��¼�� ��¼�� ��� ������ ����µ� ���� �����Ĵ� ���ִ°� �������� �������� ������� ���´ٴµ� ������� �ҽ��� �߿��ѵ� �������� ���־�� �� 3239-2312'

--�ּ� �����÷� 30=>50
--ALTER TABLE ���̺�� MODIFY �÷��� ������Ÿ��;
alter table test modify addr varchar2(50);

--age Ÿ���� ���ڿ�(10)���� �����ϰ� �ʱⰪ�� 20���� �����ϱ�
--���� null�� �״�� �ְ� ���� insert�ϴ� �ͺ��� �ʱⰪ ��
alter table test modify age varchar2(10) default '20';
insert into test (num,name) values(10,'��ȣ��');

--num�� �������� ���
select * from test order by num; --asc

--�̸��� �������� �˻�
select * from test order by name desc;

--drop
--ALTER TABLE ���̺�� DROP COLUMN ������ �÷���
--age��� �÷��� ����
alter table test drop column age;
--addr��� �÷��� ����
alter table test drop column addr;

--�÷��� ����
--ALTER TABLE ���̺�� RENAME COLUMN OLD �÷��� TO NEW�÷���;
--score==>jumsu
alter table test rename column score to jumsu;
--birth==>birthday
alter table test rename column birth to birthday;

--���̺� ���� test
drop table test;





--������ ����
--������ �⺻���� ����,1���� 1�� �����ϴ� ������ ������
create sequence seq1;

--��ü������ Ȯ��
select * from seq;

--���� ���������� �߻� �ֿܼ� ���
select seq1.nextval from dual;

--���� ������ �߻��� ��������
select seq1.currval from dual;

--seq1 ����
drop sequence seq1;

--10���� 5�� �����ϴ� ������ ���� - cache�� ���ֱ�
create sequence seq2 start with 10 increment by 5 nocache;

--������ �߻�
select seq2.nextval from dual;

--seq2 ����
drop sequence seq2;

--seq1: ���۰�:5 ������:2 ����:30 ĳ��:no, cycle:y
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;

--seq2: ���۰�:1 ������:1 cache:n
create sequence seq2 start with 1 increment by 1 nocache;
--create sequence seq2 nocach;
--�⺻�� 1�� �����ϱ� ������ start with 1 �Ƚᵵ ��

--seq3: ���۰�:1 ������:2 cache:n
create sequence seq1 start with 1 increment by 2 nocache;

select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--��ü ����
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

------------------------------------------------������ 1�� ����, ���̺� ����
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
insert into personinfo values (seq_start.nextval,'������','�����Ͼ�','����',29,'010-3241-2034','2023-02-01');
insert into personinfo values (seq_start.nextval,'�̰���','�����','����',24,'010-3422-2344','2023-05-01');
insert into personinfo values (seq_start.nextval,'��ȿ��','���','����',30,'010-2112-2234','2023-04-01');
insert into personinfo values (seq_start.nextval,'������','����','����',34,'010-3241-2034','2023-05-11');
insert into personinfo values (seq_start.nextval,'������','�Ƴ��','����',29,'010-3041-2745','2023-07-21');
insert into personinfo values (seq_start.nextval,'��ȿ��','�丮��','����',38,'010-3341-2554','2023-02-22');
insert into personinfo values (seq_start.nextval,'������','����','����',42,'010-3253-2214','2023-01-12');
insert into personinfo values (seq_start.nextval,'������','�����Ͼ�','����',32,'010-3321-2224','2023-05-02');
commit;

--�����ο�Ȯ��
select count(*) from personinfo;
--��ȸ����
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5 asc;  --�÷���ȣ�� ����

select * from personinfo order by gender,age desc;
select * from personinfo order by gender,name;

select job from personinfo;
select distinct job from personinfo;


select * from personinfo;

--���� �达�� 
select * from personinfo where name like '��%';
--�̸��� �ι�° ���ڰ� ���λ��
select * from personinfo where name like '_��%';

--�ڵ��� ������ �ڸ��� 2224�λ��
select * from personinfo where hp like '%2224';

--�Ի����ڰ� 3���� ��� ���
select * from personinfo where to_char(ipsaday,'mm')='02';

--�Ի����ڰ� 2023���� ��� ���
select * from personinfo where to_char(ipsaday,'yyyy')='2023';

--���̰� 20~30���� ���
select * from personinfo where age>=20 and age<=30;

--������ ����̰ų� ������ ���
select * from personinfo where job in('���','����');

--������ ����̰ų� ������ �ƴ� ���
select * from personinfo where job not in('���','����');

--��ճ���, �Ҽ��� ���ڸ��� ���ϱ�
select round (avg(age),1) from personinfo;

--�������(update)
--UPDATE ���̺�� SET �÷�='�����ҵ�����' WHERE �÷�2='�����Ͱ�';
--3�� ���� ���� �����ϱ�,������ ������ ���  �����Ͱ� �����ȴ� �����ʼ�
update personinfo set job='��ȣ��',age=35;
--�߸������ѵ����� ������� ������
rollback;
--3����
update personinfo set job='��ȣ��',age=35 where num=3;

--�̾��̸鼭 �丮���� ����� ������ ���ڷ� �����ϱ�
update personinfo set gender='����' where name like '��%' and job='�丮��';

--num�� 8���� ����� ������ �𵨷� �Ի����� 2000-12-25�Ϸ� �����Ͻÿ�
update personinfo set job='��', ipsaday='2000-12-25' where num=16;


select * from personinfo;
commit;

--����
--delete from ���̺��

delete from personinfo;
rollback;

--9���� ����
delete from personinfo where num=9;

--�����߿��� ���̰� 25�� �̻� ��� ����
delete from personinfo where gender='����' and age>=25;

--�ڵ����� ***-****-**** ����
update personinfo set hp ='***-****-****';

--���̺� ����
--������ ����
drop table personinfo;
drop sequence seq_start;


--dept���� 30�� �μ��� �þ�Ʋ�� �����Ͻÿ�
update dept set loc='SEATTLE' where deptno='30';

update dept set dname= 'SALES' where deptno='30';

--emp���̺� TotalSal���� �ϳ� �� �߰��Ͻÿ�
alter table emp add TotalSal number(20);

--emp���̺� TotSal�� sal�� comm�� ���� ������ ���� ������ �����Ͻÿ�
update emp set Totalsal=sal+nvl(comm,0);

select * from emp;

--emp���� WARD �����Ͻÿ�
delete from emp where ename='WARD';

--product ���̺��� 100���� �������̷� �����Ͻÿ�
update product set p_name= '��������' where p_code='100';


--Groub by
--professor���� �а����� �������� ��ձ޿��� ����Ͻÿ�
select deptno �а�,avg(pay)"��� �޿�"
from professor 
group by deptno;

--select���� ���� �׷��Լ� �̿��� �÷��̳� ǥ������ �ݵ�� group by�� ���Ǿ����
--professor���� ���޺� ��� ���ʽ��� ����Ͻÿ�

select position ����, avg(NVL(bonus,0)) "��� ���ʽ�"
from professor group by position;

--�а��� ���޺��� �������� ��ձ޿�
select deptno,position,avg(pay) "��� �޿�"
from professor
group by deptno,position;

--student���� �г⺰ �ְ�Ű�� �ְ������ ���
select grade, max(height) �ְ�Ű,max(weight) �ְ������ 
from student
group by grade;

--������ ���޺� �ѱ޿��� �ְ��ʽ��� ���Ͻÿ�
select position ����,sum(pay) �ѱ޿�,max(bonus) �ְ��ʽ�
from professor
group by position;

--emp���� ������ ���������� ������� ���Ͻÿ�
--���� �����
select job ����, count(*) ����� 
from emp
group by job;

--Having��_�����ְ� �˻��ϱ�_�ݵ�� group by �ڿ�...
--emp���� ��ձ޿��� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
--where���� �׷��Լ��� ���������� �� �� ����
select deptno,avg(sal) 
from emp
group by deptno
having avg(sal)>2000;

--professor���� ��ձ޿��� 300 �̻��� �а��� �а���ȣ�� ��ձ޿��� ���Ͻÿ�
select deptno �а���ȣ, avg(pay) ��ձ޿� 
from professor 
group by deptno
having avg(pay)>=300;

select deptno �а���ȣ, avg(pay) ��ձ޿� 
from professor 
where deptno not in(101)
group by deptno 
having avg(pay)>=300
order by deptno desc;

--emp���� job���� sal�� ��ձ޿��� ���Ͻÿ�
select job ����,avg(sal) ��ձ޿�
from emp
group by job;

--professor���� ���޺� �ѱ޿��� ���Ͻÿ�
select position ����, sum(pay) �ѱ޿�
from professor
group by position;

--emp���� ������ �ο��� �ִ�޿� �ּұ޿��� ����ϼ���(job�� ��������)
select job,count(job),max(sal),min(sal) 
from emp
group by job 
order by job; 

--emp���� �Ի�⵵ �׷캰�� ���(�Ի�⵵,�ο���,�޿����(�Ҽ�������)_�Ի�⵵�� ��������)
select to_char(hiredate,'yyyy') �Ի�⵵, count(*) �ο���,round(avg(sal),0) ��ձ޿�
from emp 
group by to_char(hiredate,'yyyy')
order by to_char(hiredate,'yyyy');

--Rollup�Լ�
--�ڵ����� �Ұ�/�հ� �����ִ� �Լ�
--group by���� �־��� �������� �Ұ谪�� �����ش�

select deptno �а���ȣ,position ����,sum(pay) �ѱ޿�
from professor
group by position,rollup(deptno);

select deptno �а���ȣ,position ����,sum(pay) �ѱ޿�
from professor
group by deptno,rollup(position);

--count
select position,count(*),sum(pay)
from professor
group by rollup(position);

--cube�Լ�
--rollupó�� ���Ұ迡 ��ü�Ѱ���� �����ش�
select deptno,position,count(*),sum(pay)
from professor
group by cube(deptno,position);

--������ �Ѻ���
--Q1.emp���� ��տ����� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
select deptno �μ���ȣ,avg(sal) ��ձ޿�
from emp
group by deptno
having avg(totalsal)>=2000;

--Q2.emp���� deptno�� �ο�����?
select deptno �μ���ȣ,count(*) �ο���
from emp 
group by deptno;

--Q2.emp���� job�� deptno�� 10,20�� �μ��� ������?
select job ����, deptno �μ���ȣ, count(*) �μ�
from emp 
group by job, deptno
having deptno=10 or deptno=20;

--Q3.emp���� job�� �ο����� ���Ͻÿ�(�� �ο��� 2���� ���� ���� ���Ұ�)
select job ����, count(*) �ο���
from emp 
group by job
having count(*)>2;

--Q4.emp���� job�� �޿��հ踦 ���ϴµ�(president�� �����Ұ�) �޿��հ谡 5000 �̻� ���ϰ� �޿��հ谡 ���������� ����Ͻÿ�
--job �޿��Ѱ�
select job ������,sum(sal)�޿��հ�
from emp
where job not in('PRESIDENT') --PRESIDENT ����
group by job -- job�׷캰��
having sum(sal)>=5000 --�޿��հ谡 5000 �̻�
order by sum(sal) desc;  --�޿��հ� ��������



--��������
--���̺����
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar2(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('ȫ����','�λ��','������')),
pay number(10) default 2000000);

--����������
create sequence seq_sawon nocache;

--����Ÿ 10���� insert
--üũ �������� ����
--insert into sawon values(seq_sawon.nextval,'�̿���','����','���Ӱ��ߺ�',3500000);
insert into sawon values(seq_sawon.nextval,'�̿���','����','ȫ����',3500000);
insert into sawon values(seq_sawon.nextval,'�迵��','����','�λ��',2700000);
insert into sawon values(seq_sawon.nextval,'������','����','������',3500000);
insert into sawon values(seq_sawon.nextval,'�����','����','������',2900000);
insert into sawon values(seq_sawon.nextval,'������','����','ȫ����',3000000);
insert into sawon values(seq_sawon.nextval,'������','����','�λ��',2700000);
insert into sawon values(seq_sawon.nextval,'���ξ�','����','������',2800000);
insert into sawon values(seq_sawon.nextval,'������','����','�λ��',2700000);
insert into sawon values(seq_sawon.nextval,'������','����','�λ��',3500000);
insert into sawon values(seq_sawon.nextval,'�ѻ���','����','ȫ����',2700000);
commit;

--�μ��� �ο����� �ְ�޿�, �����޿� ��ȸ
select buseo �μ�, count(*) �ο���,max(pay) �ְ�޿�,min(pay) �����޿�
from sawon
group by buseo;

--���� ���������� �ְ�޿�, �����޿��� ȭ����� ���̰� 3�ڸ� �ĸ��� ������ �ϼ���
select buseo �μ�, count(*) �ο���,to_char(max(pay),'L999,999,999') �ְ�޿�,to_char(min(pay),'L999,999,999') �����޿�
from sawon
group by buseo;

--���� �ο����� ��ձ޿��� ����Ͻÿ�(�ο��� �ڿ� �� �̶�� �������� �ϼ���)
select gender ����, count(*)||'��' �ο���, round(avg(pay),0) ��ձ޿�
from sawon 
group by gender;

--�μ��� �ο����� ��ձ޿��� ���ϵ� �ο��� 4�� �̻��� ��쿡�� ����ϵ��� �ϼ���
select buseo �μ���,count(buseo) �ο���,avg(pay) ��ձ޿�
from sawon
group by buseo
having count(buseo)>=4;


select * from sawon;

drop table sawon;
drop sequence seq_sawon;
