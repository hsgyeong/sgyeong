--emp���̺��� ename�� ��ȸ�Ͻÿ�
select ename from emp;
--emp���̺��� job�� ��ȸ�Ͻÿ�
select ename, job from emp;
--emp���̺� ��ü ��ȸ
select * from emp;
--student���̺� ��ü��ȸ
select * from student;
--ǥ����
select name,'���ݽǽ���' from student;
--�÷� ��Ī allias
select name "�̸�",grade as "�г�",birthday ���� from student;
--emp���� �����,����,�Ի����ڸ� ��ȸ�Ͻÿ�
select ename "�����",job as "����",hiredate �Ի����� from emp;
--DISTINCT: �ߺ��� ���� �����ϰ� ����ϱ�
--emp���� �������� �ߺ����� ���� ���
select DISTINCT job ������ from emp;
--emp���� �μ���ȣ�� �ߺ����� ���
select DISTINCT DEPTNO �μ���ȣ from emp;
--�ռ�������: �÷��� �ٿ��� ���
select name||grade �г⺰�л��� from student;
--professor ��ȸ
select * from Professor;
--�ϳ��� �÷����� ���_������ ���� ������ �Դϴ�
select name || '����' || position || '�Դϴ�' "����������" from professor;
--smith���� job�� clerk �Դϴ�
select ename || '���� job��' || job || '�Դϴ�' from emp;
--student���� ���������� Ű�� 180cm, �����Դ� 72kg �Դϴ�
select name || '���� Ű��' || height || 'cm, �����Դ�' || weight || 'kg �Դϴ�' from student;
--emp���� �������� salseman�̰� ������ ***�Դϴ�
select 'emp���� ��������' || job || '�̰� ������' || sal || '�Դϴ�' from emp;
--����
--student���� �л��� �г� ������ �л����� ������������ ��ȸ�Ͻÿ�
select name �л���,grade �г�,birthday ���� from student order by name asc; --asc�� ��������
select name �л���,grade �г�,birthday ���� from student order by name desc; 
select name �л���,grade �г�,birthday ���� from student order by birthday; 
--emp���� �����,����,�޿��� �޿��� ������������� ��ȸ�ϼ���
select ename �����,job ����,sal �޿� from emp order by sal asc; 
select ename �����,job ����,sal �޿� from emp order by 3 desc;  --�÷���ȣ�ε� ���İ���
--emp���� �������� �ߺ����� ����ϰ� �������� ������������ ����Ͻÿ�
select DISTINCT job from emp order by job asc;
--emp���� �������� �ߺ����� ����ϰ� �������� ������������ ����Ͻÿ�
select DISTINCT job from emp order by job desc;

--���������
--emp���� sal�� Ư�����ʽ� 100�� ���Ͽ� ����Ͻÿ�
select ename �����,sal �⺻��,sal+100 Ư�����ʽ� from emp;
--where�� : ����
--emp���� 10���μ��� �ٹ��ϴ� ����� �����,�޿��� �μ���ȣ�� ����ϼ���
select ename �����,sal �޿�,deptno �μ���ȣ from emp where deptno=10;
--emp���� �̸��� KING�� ����� �����,������ ��ȸ�Ͻÿ�
select ename �����,job ���� from emp where ename='KING';
--emp���� �޿��� 3000 �̻��� ����� ������ �޿��� ��ȸ�Ͻÿ�
select ename �����,sal �޿� from emp where sal>=3000;
--�л����̺��� Ű�� 180cm �̻��� �л���� Ű�� ����Ͻÿ�
select name �л���,height Ű from student where height>=180;
--�л����̺��� Ű�� 160cm ���� 180cm ������ �л��� �л���� Ű ��� between a and b (���� ���� ���� �;���)
select name �л���,height Ű from student where height between 160 and 180 order by height;
--in(a,b): a,b�� ��ȸ
--emp���� deptno�� 20,30�� ������� ������ �μ���ȣ�� ��ȸ�Ͻÿ�
select ename �����,deptno �μ���ȣ from emp where deptno IN(20,30);
--null���� ���
--emp���� comm�� null�� ����� �̸��� ���ʽ��� ����Ͻÿ�
select ename �����,comm ���ʽ� from emp where comm is null;
--emp���� comm�� null�� �ƴ� ����� �̸��� ���ʽ��� ����Ͻÿ�
select ename �����,comm ���ʽ� from emp where comm is not null;

--NVL : null�� 0���� �ٲٱ� _������ ����
select ename �����, nvl(comm,0) ���ʽ� from emp;
--Like ������
--�л����̺��� �达�� ��ȸ�Ͽ� ��� ���� ����Ͻÿ�
select * from student where name like '��%';
--�л����̺��� ������ ������ ��� ���� ����Ͻÿ�
select * from student where name like '%��';
--�л����̺� �� ���?
select count(name)from student;
select count(name) cnt from student;
--emp���� job�� salesman�� ����� manager�� �����,�������� ����Ͻÿ�(or, in������ ��� �� 2��)
select ename �����,job ������ from emp where job='SALESMAN' or job='MANAGER';
select ename �����,job ������ from emp where job in('SALESMAN','MANAGER');
--emp���� �޿��� 2000~3000�� �����,������,�޿��� ����Ͻÿ�(and between������)
select ename �����,job ������, sal �޿� from emp where sal>=2000 and sal<=3000;
select ename �����,job ������, sal �޿� from emp where sal between 2000 and 3000;

--Q.student ���� 1�г� �л��� �л���,Ű�� ����Ͻÿ�(�� Ű�� ������..)
select name �л���,height Ű from student where grade=1 order by height asc;

--Q.student ���� 2�г� �л��� �л��� ���� Ű �����Ը� ����Ͻÿ�(�� ������ ������� ����)
select name �л���,birthday ����,height Ű,weight ������ from student where grade=2 order by birthday asc;

--Q.professor���� �������� �̸��� ���� ���� ���� ������ ������,����,�Ի����ڸ� ����Ͻÿ�
select name ������,position ����,hiredate �Ի����� from professor where name like '��%';

--Q.emp���� �����,�޿�,�޿�*12,���ʽ�,�޿��Ѱ踦 ���Ͻÿ�
select ename �����,sal �޿�,sal*12 "�޿�*12",comm ���ʽ�,sal*12+comm �޿��Ѱ� from emp;

--Q.emp���� �������ڰ� 1980/01/01 ���Ŀ� ���� ����� ������ �Ի����ڸ� ��ȸ�Ͻÿ�(�Ի����ڼ�)
select ename �����,hiredate �Ի����� from emp where hiredate>='1980/01/01' order by hiredate asc;

--Like % _ ����� �̿��ؼ� Ư�������� �ִ� ���� ���
--emp���� ������� �ι�° ���ڰ� a�� ����� ����� ���
select ename  ����� from emp where ename like '_A%';

--emp���� ������� 2��° ���ڰ� s�� ��� �Ǵ� 3��° ���ڰ� A�� ����� ����� ���
select ename ����� from emp where ename like '_A%' or ename like '__A%';

--��¥ ���ͷ� ' ' �ݵ�� ���
--emp���� ������ clerk�̰� �Ի����� 87/05/23�� ����� �����,�Ի��� ���ϱ�
select ename �����,hiredate �Ի����� from emp where job ='CLERK' AND hiredate ='87/05/23';

--emp���� �Ŵ����̰ų� 82�� ���� �Ի����� �����,������,�Ի������
select ename �����,job ������,hiredate �Ի����� from emp where job ='MANAGER' OR hiredate >='86/01/01';

--��������
--student���� �л��� �̸��� Ű�� ������ ���(Ű�� ���� �������, �����Դ� ���� �������)
select name �л���,height Ű,weight ������ from student where grade=1 order by height asc,weight desc;

--emp���� �޿����������� �ٽ� �̸����� �������� _�����ȣ ����� �޿� ��ȸ
select empno �����ȣ,ename �����,sal �޿� from emp order by sal desc,ename;

--union
--unionAll
--intersect

select name from student where deptno1=101 intersect  --������
select name from student where deptno2=201;

select name, deptno1, deptno2 from student where deptno1=101 union   --�ߺ��Ǵ°� ����
select name, deptno1, deptno2 from student where deptno2=201;

select name, deptno1, deptno2 from student where deptno1=101 union all  --�ߺ��Ǵ°ͱ����� 
select name, deptno1, deptno2 from student where deptno2=201;

--Q.gogak point�� 30��~50��. ����� ����Ʈ�� ����ϼ���(����Ʈ ������)
select gname ����,point ����Ʈ from gogak where point>=300000 and point<=500000 order by point desc;

--Q.emp�� comm�� ���� 0���� �ٲپ ������ manager�� ����� �̸��� ���ʽ��� ����Ͻÿ�
select ename �����,nvl(comm,0) ���ʽ� from emp where job ='MANAGER'; 

--Q.professor 103�� �а� �������� �̸��� �޿�,���ʽ�,����(�޿�*12+���ʽ�)�� ����Ͻÿ�
select name ������,pay �޿�,bonus ���ʽ�,(pay*12)+bonus ���� from professor where deptno='103';

--SQL �׷��Լ�(count,sum,avg)
--count(*) null�� ����,count(�÷�) : null�� ����

select count(*),count(hpage) from professor;
--sum(�÷���)
select count(bonus),sum(bonus) from  professor;

--avg(�÷���)
select count(bonus),sum(bonus),avg(bonus) from professor;

--max,min 
select max(sal),min(sal) from emp;
select max(hiredate),min(hiredate) from emp;

--�Ҽ���
--emp���� sal�� ���
select round(avg(sal),1) from emp;  --�Ҽ��� 1�ڸ�
select round(avg(sal),2) from emp;
select round(avg(sal),0) from emp;  --�ݿø�
select round(avg(sal),-1) from emp;  --10����
select round(avg(sal),-2) from emp;  --100����

--�ֿܼ� ���
--���糯¥�� �ֿܼ� ���
select sysdate from dual;

--���ϳ�¥�� �ֿܼ� ���
select sysdate+1 from dual;

--to_char : ��¥ �� ��ġ �����͸� ���ڷ� ��ȯ�ϱ� ���� �Լ�
--��¥���� �⵵�� ����
select to_char(sysdate,'year')from dual;
select to_char(sysdate,'yyyy')from dual;

select to_char(sysdate,'mm')from dual;
select to_char(sysdate,'dd')from dual;

select to_char(sysdate,'yyyy-mm-dd hh24-mi-ss')from dual;

--to_char ���ڿ��� ���� �����ϴ�
select to_char(711290424,'999,999,999')from dual;

--emp
select empno �����ȣ,ename �����,to_char(hiredate,'yyyy') �⵵ from emp;

--emp���� �����ȣ�� �����,�޿� ���(�޿��� õ���� ���б�ȣ)
select empno �����ȣ,ename �����,to_char(sal,'L999,999,999') as �޿� from emp;

--��������
--�����ȿ� �Ǵٸ� ���� ���(KING���� �޿��� ���� �޴� �����?)_2���� ����..
--���������� ���� ����Ǿ� �� ����� ���������� �����ְ� �� ���� �޾� ���� ���������� ����
--�������� �ȿ��� order by�� ����

--emp���� JAMES���� �޿� ���� �޴� ����� ����� �޿��� ���غ���
select ename �����, sal �޿� from emp where sal>(select sal �޿� from emp where ename='JAMES');

--emp���� ��ձ޿����� ���� �޴� ����� �����ȣ,�����,�޿��� ��Ÿ���ÿ�
select empno �����ȣ,ename �����, sal �޿� from emp where sal>(select avg(sal) from emp);

--emp���� �̸��� WARD�� ����� MGR�� ���� ���� ���� ����� ��� ���
select * from emp where MGR=(select MGR from emp where ename='WARD');

--emp���� ��ձ޿����� ���̹޴� �����?
select count(*) from emp where sal>(select avg(sal) from emp);


--�������� ����
--Q1. emp���� ADAMS�� ���� �������� ���� ����� �̸� ���� ������ ���
select ename �����,sal �޿�,job ������ from emp where job =(select job ������ from emp where ename='ADAMS');

--Q2. emp���� SCOTT�� ���� ������ �޴� ����� �̸��� ���� ���
select ename �����,sal �޿� from emp where sal=(select sal �޿� from emp where ename='SCOTT');

--Q3. student���� ��1������ ������ �л��� ������ �л����� �л��� ��1���� ���(4)
select name �л���,deptno1 ��1���� from student where deptno1=(select deptno1 from student where name ='������');


--Q4. student���� ��1������ 101�� �а��� ��ո����Ժ��� �����԰� ���� �л����� �̸��� ������ ���(11)
select name �̸�,weight ������ from student where weight > (select avg(weight) from student where deptno1=101);


--Q5. professor���� �Ի����� �迵�� �������� ���߿� �Ի��� ����� �̸��� �Ի��� �а���ȣ�� ����Ͻÿ�(5)
select hiredate �Ի�����, deptno �а���ȣ from professor where hiredate >(select hiredate from professor where name='�迵��');







