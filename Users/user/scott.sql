--DQL(���Ǿ�) �����͸� ��ȸ�Ҷ� ����Ѵ�.
--select �÷���
--from ���̺���

--��ü �÷� ������ ��ȸ


select *
from emp;


--�κ��÷� ������
select empno,ename,sal
from emp;

--14��deptno �÷�   ��� ��ȸ
select deptno
from emp;

--�Ȱ����� �ѹ��� ��ȸ(�ߺ� ����)
select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--����Ȯ���ϱ�
select ename, sal
from emp;


-- +,-,*,/
-- �÷��� ������� �����Ѵ�.
--null ���� ������ �Ұ��ϴ�.
--�÷��� ��Ī�� ����� �� �ִ�.
select ename as�����,sal,sal * 12+nvl(comm,0)as����,comm
from emp;

--������ ����
--select �÷���
--from ���̺���
--order by �÷���(���ı����� �Ǵ� ��)  asc(��������)/desc(��������)

select *
from emp
order by sal ;     --���������� �⺻���̶� ���� �����ϴ�.

--����(1 ~ 10),��¥(���ų�¥ ~ �ֱٳ�¥),����(��������)


--���ǰ˻�
--select �÷���
--from ���̺���
--where ���ǽ�;   <, >, =, !=/ <> , <=, >= , and , or

select *
from emp
where sal >=3000;   --�޿��� 3õ �̻��λ��

select *
from emp
where deptno = 30;

--and �ΰ��� �̻��� ������ ��� ���ΰ��
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;


--���ڸ� �������� ����Ҷ�
--��ҹ���
--' '
select *
from emp
where ename = 'ford'; --����� ������ �ȳ��� �ҹ��� ford�� ����.

--��¥�� �������� ����Ҷ�
--' '
--��¥�� ũ�Ⱑ �ִ�
--80/12/20     1980 12 20 �� �� �� ��������
select * 
from emp
where hiredate < '1982/01/01';

--or �ΰ��̻��� �����߿� �ϳ��̻� ���ΰ��
select * 
from emp 
where deptno = 10 or sal >= 2000;

--not �������� ������

select * 
from emp
where sal != 3000;

select * 
from emp
where sal = 3000;

-- and, or
-- ���� ������ ǥ�� �Ҷ� ���
--ex 1000 ~ 3000 ����
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <=1000 or sal >=3000;

--between  = and
select *
from emp
where sal between 1000 and 3000;

--in = or
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

--like������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�
--���ϵ� ī�带 ����Ѵ�( % _)
--% ��� ���ڸ� ��ü�Ѵ�
-- _ �ѹ��ڸ� ��ü�Ѵ�
select*
from emp
where ename like'F%';

select*
from emp
where ename like '%D'

--null ������



--================================
-- ���տ�����
-- ������(UNION),������(intersect),������(minus)
-- �÷��� Ÿ���� �����ؾ� �Ѵ�.
-- �÷��� �̸��� ��� ����.


select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
intersect -- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--�񱳿�����, ����������, lide, is null / is not null, ���տ�����
--< > <= >= = !=  �񱳿�����
--in nill , is not null   ����������
--UNLON , INERSECT , MINUS  ���տ�����

select *    ---Q1
from emp
where ename like '%S';

--Q2
select job,salesman,ename,job,sal,deptno
form emp;
where deptno = 30 amd job = 'salesman

--Q3
select *
from emp
where deptno in(20,30)and sla>=2000;

--Q4
select *
from emp
where sal>=2000, sal <=3000;

--Q5
select *
from emp
where ename like '%E' , not sal

-- �Լ�
-- �����Լ� : upper,lower,substr,instr,replace,lpad,rpad,concat
-- �����Լ� :
-- ��¥�Լ�


select 'Welcone',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from ename - 'FORD';

select *
from emp
where lower(ename) = 'scott';

select ename,length(ename)
from emp;

select 'Welcome to Oracle',substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

select instr('Welcome to Oracle','O')
from dual;

select instr('Welcome to Oracle','e',3,2)
from dual;


select 'Welcome to Orale',replace('Welcom to Oracle','to','of')
from dual;

select 'oracle',lpad('oracle',10,'.')
from dual;

select rpad('970424-',13,'*')
from dual;

select concat(empno,ename), empno || '' || ename
from emp;

===����===
select 
           trunc(1234.5678),
           trunc(1234.5678,0),
           trunc(1234.5678,1),
           trunc(1234.5678,2)
from dual;

select 
       ceil(3.14),  --�ڽź��� ū ���� ���������
       floor(3.14), --�ڽź��� ���� ���� ����� ����
       ceil(-3.14), 
       floor(-3.14)
from dual;       

select mod(5,2),mod(10,4)
from dual;

select*
from emp
where mod(empno,2) = 1;

--��¥ �Լ�
select sysdate -1����,sysdate,sysdate +1 ����
from dual;

select sysdate - hiredate as �ٹ��ϼ� / --���̰� �ϼ� ��ȯ
from emp;

--�ټӳ��
select trunc((sysdate - hiredate) / 365) �ټӳ��
from emp;

select sysdate,
          round(sysdate, 'cc') as format_cc,
          round(sysdate, 'yyyy') as format_yyyy,
          round(sysdate, 'q') as format_q,
          round(sysdate, 'ddd') as format_ddd,
          round(sysdate, 'hh') as format_hh
   from dual;    
   
   
select sysdate,
          trunc(sysdate, 'cc') as format_cc,
          trunc(sysdate, 'yyyy') as format_yyyy,
          trunc(sysdate, 'q') as format_q,
          trunc(sysdate, 'ddd') as format_ddd,
          trunc(sysdate, 'hh') as format_hh
  from dual; 
  

--�ڷ�����ȯ �Լ�
-- to_vhar()
--to_unmber()
--to_datd()

--��¥�� ����
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as �Ի�����
from emp;

--���ڸ� ����
select to_char(123456,'000,000')
from dual;

select sal, to_char(sal,'l999,999')
from emp

--���ڸ� ���ڷ�
select '20000' - 10000
from dual;

select to_number( '20,000','999,999') - to_number( '10,000','999,999')
from dual;

-- ���ڸ� ��¥
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY/MM/DD')

--null������ ó��
--nvl(null,�ٲٰ����� ������)
--uvl�� null �������� Ÿ�԰� ���� Ÿ������ �����ؾ��Ѵ�
--nvl(����,����)  ,  nvl(����,����)

select ename �����,sal,sal * 12 +nvl(comm,0)as����,comm
from emp;

select * 
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm,nvl2(comm,'O','X')
from emp;

--���ǹ� ǥ���ϴ� �Լ�
--decode()
--case

select ename,job,deptno,
          decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ')as �μ���
        from emp;


--������ ���ǽ����� �����Ҽ��ִ�
case
       when ���ǽ�    then ���๮
       when ���ǽ�   then  ���๮
       when ���ǽ�   then  ���๮
       else ���๮
end as ��Ī

select ename,job,deptno,
       when deptno = 10    then 'AAA'
       when deptno = 20   then  'BBB'
       when deptno = 20    then  'CCC'
       else '��Ÿ' 
       end as '�μ���'
from emp;

select sysdate,
add_months(sysdate,3)
from dual;


select ename,job,sal,
        case
            when sal between 3000 and 5000 then '�ӿ�'
            when sal >=2000 and sal < 3000 then '������'
            when sal >=500 and  sal <2000 then '���'
            else '��Ÿ'
            end as ����
from emp;


--Q1
select empno,rpad(substr(empno,1,2),4,'*') ,
ename,rpad(substr(ename,1,1),length(ename),'*')
from emp;
where length(ename) >=5 and length(ename) <6;





--Q2
select empno,ename,sal,
trunc(sal/21.5,2) as DAY_pay,
round(sal/21.5/8,1) as Time_pay
from emp;


--Q4
select empno,ename,mgr,
        case
             when substr(mgr,1,2) = '75'  then '5555'
             when substr(mgr,1,2) = '76'  then '6666'
             when substr(mgr,1,2) = '77'  then '7777'
             when substr(mgr,1,2) = '78'  then '8888'
             when mgr is null then '0000'
             else to_char(mgr)
        
        end as CHG_MGR
from emp;    


--��� �Լ�(������ �Լ�) sum()avg()count()max()min()
--�Ϲ��÷��� ���� ��� �Ұ��ϴ�
--ũ��񱳰� ���� ��� Ÿ�Կ� ��밡��
select sum(sal)
from emp;

select avg(sal)
from emp;

select count(comm)   --��ü ���ڵ� ��
from emp;

select count(*)
from emp;


select max(sal),min(sal)
from emp;

select  max(hiredate)
from emp;
where deptno = 20;

-- select �÷���
-- from   ���̺���
-- where  ���ǽ�(�׷��Լ� ���Ұ�),(group by , having ���� ��������)
-- group by �����÷���
-- havig ���ǽ� (�׷��Լ� ����Ѵ�)
-- order by �÷��� ���Ĺ�� ==> �� �������� �ۼ�

select avg(sal)from emp where deptno = 10
union
select avg(sal)from emp where deptno = 20
union
select avg(sal)from emp where deptno = 30; 

select deptno 
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno
order by deptno;

select deptno ,avg(sal),job
from emp
group by deptno,job
order by deptno,job ;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) > 2000; --group by�� ���ؼ� ��ȸ ����� ������ �ش�
                        --���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�.

select deptno,avg(sal)
from emp
where deptno !=10
group by deptno;
having avg(sal) >=2000;


-- ����
-- 2�� �̻��� ���̺����� �����͸� ��ȸ
-- from���� �ΰ��̻��� ���̺��� �ۼ��Ѵ�
-- where���� ���� ������ �ۼ��ؾ��Ѵ�.
-- cross join (where�� ���� ����)�� �Ⱦ�
-- equl join  (where ������� : =)
-- non equi join (where ���������� : and , or )
-- self join (where �ϳ��� ���̺��� ����Ѵ�)
-- out join  (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ����� : (+) �����ش�)



select e.ename, e.sla, job, e. deptno,dname,loc
from emp e,dept d --���̺��� ��Ī
where e.deptno = d.deptno;
and sal >= 3000;



select *
from emp e,dept d
where e.deptno = d.deptno;


select ename , sal , grade
from emp e , salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal; 


-- ��� , �̸� , �޿� , �μ���ȣ , �μ��� , �޿����
-- emp                 dept              salgrade

select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m     --�ݵ�� ��Ī�ο�
where e.mgr = m.empno;

--20���� �ٹ��ϴ� ���
select ename, deptno
from emp
where deptno = 20;

--scott �� ���� �μ��� �ٹ��ϴ� ���     'self ����'
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

-- �ܺ�����
-- ��� �����Ǵ� �����͸� ���� ��ȸ �ϱ� ���ؼ� ����Ѵ�.


select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m     --�ݵ�� ��Ī�ο�
where e.mgr = m.empno(+);    --�����Ͱ� ���� ���̺��� +�� ���δ� (������ ���� ����)

select ename,sal, d.deptno, dname
from emp e , dept d
where e.deptno(+) = d.deptno;

--ANSI JOIN(ǥ������ ���)
--inner join(equi, non equi, self
--outer join( (+) ) // [left, right, full} outer join



select ename, sal, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename, sal, dname, loc
from emp e inner join dept d
using(deptno)    --�� ���̺��� �÷����� ���� �� ��� ��밡��
where ename = 'SCOTT'


select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno, ename, sal, grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;



select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m  -- �����Ͱ� �ִ� ���� �����Ѵ�
on e.mgr = m.empno;



select empno, ename, sal, d.deptno, dname, grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;


select  ename, sal, d.deptno, dname
from emp e right outer join dept d
on e.deptno = d.deptno;

select e.empno, mgr, sal, deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

select *
from emp e, emp c
where e.mgr = c.empno;


--1
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal >2000;

select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d on e.deptno = d.deptno
where e.sal >2000;


--2
select d.deptno, d.dname, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno, d.dname;

select d.eptno, d.dname, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp e inner join dept d 
on e.deptno = d.deptno
group by d.deptno, d.dname;

--3 
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, e.ename;


--4
select d.deptno, d.dname, e.empno, e.mgr, e.sal, s.losal, s.hisal, s.grade, m.empno, m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno

-- ��������
-- select ������ ��ø�ؼ� ����Ѵ�(where)
select ename, max(sal)
from emp;


--�޿��� ���� ���� �޴»��
select ename,sal
from emp
where sal = (select max(sal)
              from emp
             );

select deptno
from emp
where ename = 'SCOTT' 


select dname
from dept
where deptno = 20

select dname
from dept
where deptno = (select deptno
                 from emp
                 where ename = 'SCOTT');
                 
-- dallas                 
-- �̸�, �μ���ȣ
select ename, deptno
from emp
where deptno =  (select deptno
                 from dept
                 where loc = 'DALLAS');
                 

-- �ڽ��� ���ӻ���� king�� ����� �̸��� �޿��� ��ȸ�ϼ���(subquery)
select ename, sal
from emp
where mgr = (select empno
             from emp
             where ename = 'KING');
             
select *
from emp 
where sal  in( select max(sal)
              from emp                   --������
              group by deptno);
       
       
 --������ ��������
 -- in : ����߿� �ϳ��� �����ϸ�ȴ�.
 -- any : ����߿� ���� ������ ���� ũ��ȴ�
 -- all : ����߿� ���� ū�� ���� ũ�� �ȴ�.
       
select *
from emp 
where sal  >= any( select max(sal)
              from emp                   --���� ������ ���� ū���̸� ��� ��ȸ
              group by deptno);          --���� ū������ ������
              
              
select ename,sal
from emp
where sal > all (select sal
                  from emp
                  where deptno = 30);
                  

select * 
from emp
where ( deptno,sal) in ( select deptno,max(sal)
                         from emp
                         group by deptno);
       

--------------------------------------------------�ڽ� ��������
from emp
where ename = 'JONES';

select *
from emp
where sal > (select sal
            from emp
             where ename = 'JONES');
             

select *
from emp
where comm > (select comm
               from emp
               where ename = 'ALLEN');
               
select * 
from emp
where sal in (select Max(sal)
              from emp
              group by deptno);
              

select * 
from emp
where sal >any(select sal 
               from emp
               where deptno = 30);
               

select*
from emp
where sal > all (select sal
                 from emp
                where deptno = 30 );
               
               
--------------------------------------�ڽ� ����\

select*
from emp ,dept
order by empno;

select*
from emp,dept
where emp.deptno = dept.deptno;

select *
from emp e, dept d
where e.deptno = d.deptno;

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from  emp e join dept d using
where sal >= 3000;


-- DML(���������۾�) : insertm,update, delete


-- insert : ���̺��� ������ ����--
-- insert into ���̺��� (�÷���1, �÷���2,,...)
-- values (��1,��2,........)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ��Ѵ�.
-- �ۼ� ������� 1 : 1 ��Ī�ȴ�.

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp(deptno, dname, loc)
values (50, 'DATABASE', 'SEOUL');


insert into dept_temp(deptno, dname) --������ null ������ ����
values (60, 'JSP');

insert into dept_temp --�÷����� (�����ϸ� �� ��ü�� �� �־�����Ѵ� values��)
values (70, 'HTML', 'JSP');

insert into dept_temp  --  �÷����� , ������ null������ ����
values (80, NULL , 'SEOUL');

drop table emp_temp;

create table emp_temp
as 
select * from emp
where 1 != 1;

select*
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'������','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'������','MANAGER',9999,sysdate,4000,NULL,30);

-- update : �÷��� �����͸� ����(����)--
-- update ���̺���
-- set �÷��� = ��, �÷��� = ��, ......
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ���ߵȴ�.--

create table dept_temp2
as
select *from dept;

select*
from dept_temp2;

update dept_temp2
set loc = 'SEOUL'

drop table dept_temp;

create table dept_temp2
as
select *from dept;

select*
from dept_temp2;

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;


-- delete(������ ����)--
-- delete from ���̺���
-- where ���ǽ�
-- ���ǽ��� ������� ������ ��絥���Ͱ� �� �������

create table emp_temp2
as
select * from emp;

select*
from emp_temp2;

delete from emp_temp2;




drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select*
from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

-- TCL(�������� �������� �Ǵ� ���)
-- Ʈ�����
-- commit, rollback, savepoint
-- commit : ������ ���� ����(���̺��� ������ �ݿ�)
--          create������ ����ؼ� ��ü�����Ҷ�(�ڵ�)
-- rollback : ������ ���� ���(���̺��� ������ �� �ݿ�) ���󺹱�
--           õ������,����,����(�ڵ��ѹ�)


create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

commit;

drop table dept01;


create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

--commit; ������ ������ �����̶� �ѹ��ص� �����ʹ� ���� �Ǿ��ִ�.
rollback;


-- Ʈ����� ���� ����

--truncate table dept01;    

--delete from dept01;   commit rollbak �̺Ұ����ϴ�    

truncate table dept01;

rollback;




-- DDL(������ ���Ǿ�) : table(��簴ü)�� ����,����,�����ϴ� ���ɾ�
-- create(����), alter(����), drop(����)

create table ���̺��� ( --table(��ü) 
      �÷���1 Ÿ��,     -- column(�Ӽ�)
      �÷���2 Ÿ��,
      �÷���3 Ÿ��
           
);

create table emp_ddl(
   --    ���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
       empno number(4),
       ename varchar2(10),  -- byte
       job varchar2(9),
       mgr number(4),
       hiredate date,
       sal number(7,2),
       comm number(7,2),
       deptno number(2)
  );
  
create table dept_ddl   -- ���̺��� ����
as
select*from dept;

create table dept_30
as
select* from dept
where deptno = 30;
  

select *
from emp_ddl;

insert into emp_ddl
values (9999,'�̼���','MANAGER',1111,sysdate,1000,null,10);

create table dept_m
as
select dname,loc
from dept;

create table dept_d
as
select*from dept
where 1!= 1;      -- ���̺��� ������ �����Ѵ�. ������x

-- ���̺� ����(�÷��� ���� ����)
-- ���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
-- alter 

create table emp_alter
as
select*from emp;

select *
from emp_alter;

alter table emp_alter    --�÷��߰�
add address varchar2(100);

alter table emp_alter     --�÷��̸� ����
rename column address to addr;  

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

--���̺�����(��ü����)DROP
drop table emp_alter;


--1
create table emp_hw(empno number(4),
                    ename varchar2(10),
                    job varchar2(9),
                    mgr number(4),
                    hiredate date,
                    sal number(7,2),
                    comm number(7,2),
                    deptno number(2)
       
);

select *
from emp_hw;


--2 3
alter table emp_hw
add BIGO VARCHAR2(30);

--4
alter table emp_hw
rename column BIGO to REMARK;




--5
insert into emp_hw
select empno, ename, job, mgr, hiredate, sal, comm, deptno, null
from emp;



--6
drop table emp_hw;


--������ ����
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;


-- index(�˻��ӵ��� ����ϱ����� ��� ��ü)
-- select ������ �˻� �ӵ��� ����Ų��.
-- ��ü ���ڵ��� 3% ~ 5% �����϶�
-- index��ü�� �÷��� �����ؼ� ����Ѵ�

create index �ε�����
on ���̺���(�÷���);



create table emp01
as
select * from emp;

select*
from emp01;

insert into emp01
select * from emp01;

drop table emp01;

insert into emp01(empno, ename)
values (1111, 'bts');


--index ��ü�� ������
select empno, ename
from emp01
where ename = 'bts';

create index idx_emp01_ename
on emp01(ename);

--index ��ü�� ���� �� (�� ����)
select empno, ename
from emp01
where ename = 'bts';

drop index idx_emp01_ename;

-- ���̺� ������ ����
-- show recyclebin;

show recyclebin;
-- ����
flashback table emp_alter
to before drop;

-- ��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ°�
-- not null
-- nuique
-- primary key
-- foreign key
-- check

-- emp, dept

drop table emp02;

insert into emp
values (1111, 'aaa', 'MANAGE', '9999', SYSDATE,1000,NULL,50);

create table emp02(empno number(4)constraint emp02_empno_pk primary key,   -- not null unique, 
                   ename varchar2(10) constraint emp02_ename_nn not null,
                   job varchar2(9),
                   deptno number(2)

);

insert into emp02
values (null, null, 'MANAGER', 30);

insert into emp02
values (1111, '���', 'MANAGER', 30);

insert into emp02
values (2222, '���', 'MANAGER', 30);

insert into emp02
values (null, '����ŷ', 'SALSEMAN', 30);

insert into emp02
values (2222, '����', 'MANAGER', 30);

delete from emp02;


select *
from emp02;


