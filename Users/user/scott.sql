--DQL(질의어) 데이터를 조회할때 사용한다.
--select 컬럼명
--from 테이블명

--전체 컬럼 데이터 조회


select *
from emp;


--부분컬럼 데이터
select empno,ename,sal
from emp;

--14개deptno 컬럼   모두 조회
select deptno
from emp;

--똑같으면 한번만 조회(중복 제외)
select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--월급확인하기
select ename, sal
from emp;


-- +,-,*,/
-- 컬럼을 대상으로 연산한다.
--null 값은 연산이 불가하다.
--컬럼에 별칭을 사용할 수 있다.
select ename as사원명,sal,sal * 12+nvl(comm,0)as연봉,comm
from emp;

--데이터 정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값)  asc(오름차순)/desc(내림차순)

select *
from emp
order by sal ;     --오름차순은 기본값이라 생략 가능하다.

--숫자(1 ~ 10),날짜(과거날짜 ~ 최근날짜),문자(사전순서)


--조건검색
--select 컬럼명
--from 테이블명
--where 조건식;   <, >, =, !=/ <> , <=, >= , and , or

select *
from emp
where sal >=3000;   --급여가 3천 이상인사람

select *
from emp
where deptno = 30;

--and 두가지 이상의 조건이 모두 참인경우
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;


--문자를 조건절에 사용할때
--대소문자
--' '
select *
from emp
where ename = 'ford'; --실행시 오류는 안난다 소문자 ford는 없다.

--날짜를 조건절에 사용할때
--' '
--날짜도 크기가 있다
--80/12/20     1980 12 20 시 분 초 요일정보
select * 
from emp
where hiredate < '1982/01/01';

--or 두개이상의 조건중에 하나이상 참인경우
select * 
from emp 
where deptno = 10 or sal >= 2000;

--not 논리부정 연산자

select * 
from emp
where sal != 3000;

select * 
from emp
where sal = 3000;

-- and, or
-- 번위 조건을 표현 할때 사용
--ex 1000 ~ 3000 사이
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

--like연산자
--값의 일부만 가지고 데이터를 조회한다
--와일드 카드를 사용한다( % _)
--% 모든 문자를 대체한다
-- _ 한문자를 대체한다
select*
from emp
where ename like'F%';

select*
from emp
where ename like '%D'

--null 연산자



--================================
-- 집합연산자
-- 합집합(UNION),교집합(intersect),차집합(minus)
-- 컬럼의 타입이 동일해야 한다.
-- 컬럼의 이름은 상관 없다.


select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
intersect -- 교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--비교연산자, 논리연산자, lide, is null / is not null, 집합연산자
--< > <= >= = !=  비교연산자
--in nill , is not null   논리연산자
--UNLON , INERSECT , MINUS  집합연산자

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

-- 함수
-- 문자함수 : upper,lower,substr,instr,replace,lpad,rpad,concat
-- 숫자함수 :
-- 날짜함수


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

===숫자===
select 
           trunc(1234.5678),
           trunc(1234.5678,0),
           trunc(1234.5678,1),
           trunc(1234.5678,2)
from dual;

select 
       ceil(3.14),  --자신보다 큰 가장 가까운정수
       floor(3.14), --자신보다 작은 가장 가까운 정수
       ceil(-3.14), 
       floor(-3.14)
from dual;       

select mod(5,2),mod(10,4)
from dual;

select*
from emp
where mod(empno,2) = 1;

--날짜 함수
select sysdate -1어제,sysdate,sysdate +1 내일
from dual;

select sysdate - hiredate as 근무일수 / --차이가 일수 반환
from emp;

--근속년수
select trunc((sysdate - hiredate) / 365) 근속년수
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
  

--자료형변환 함수
-- to_vhar()
--to_unmber()
--to_datd()

--날짜를 문자
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as 입사일자
from emp;

--숫자를 문자
select to_char(123456,'000,000')
from dual;

select sal, to_char(sal,'l999,999')
from emp

--문자를 숫자로
select '20000' - 10000
from dual;

select to_number( '20,000','999,999') - to_number( '10,000','999,999')
from dual;

-- 문자를 날짜
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY/MM/DD')

--null데이터 처리
--nvl(null,바꾸고싶은 데이터)
--uvl은 null 데이터의 타입과 같은 타입으로 변경해야한다
--nvl(숫자,숫자)  ,  nvl(문자,문자)

select ename 사원명,sal,sal * 12 +nvl(comm,0)as연봉,comm
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

--조건문 표현하는 함수
--decode()
--case

select ename,job,deptno,
          decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타')as 부서명
        from emp;


--범위를 조건식으로 설정할수있다
case
       when 조건식    then 실행문
       when 조건식   then  실행문
       when 조건식   then  실행문
       else 실행문
end as 별칭

select ename,job,deptno,
       when deptno = 10    then 'AAA'
       when deptno = 20   then  'BBB'
       when deptno = 20    then  'CCC'
       else '기타' 
       end as '부서명'
from emp;

select sysdate,
add_months(sysdate,3)
from dual;


select ename,job,sal,
        case
            when sal between 3000 and 5000 then '임원'
            when sal >=2000 and sal < 3000 then '관리자'
            when sal >=500 and  sal <2000 then '사원'
            else '기타'
            end as 직무
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


--계산 함수(단일행 함수) sum()avg()count()max()min()
--일반컬럼과 같이 사용 불가하다
--크기비교가 가능 모두 타입에 사용가능
select sum(sal)
from emp;

select avg(sal)
from emp;

select count(comm)   --전체 레코드 수
from emp;

select count(*)
from emp;


select max(sal),min(sal)
from emp;

select  max(hiredate)
from emp;
where deptno = 20;

-- select 컬럼명
-- from   테이블명
-- where  조건식(그룹함수 사용불가),(group by , having 보다 먼저실행)
-- group by 기준컬럼명
-- havig 조건식 (그룹함수 사용한다)
-- order by 컬럼명 정렬방식 ==> 맨 마지막에 작성

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
having avg(sal) > 2000; --group by에 의해서 조회 결과에 조건을 준다
                        --조건식을 작성할때 그룹함수를 사용한다.

select deptno,avg(sal)
from emp
where deptno !=10
group by deptno;
having avg(sal) >=2000;


-- 조인
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개이상의 테이블을 작성한다
-- where절에 조인 조건을 작성해야한다.
-- cross join (where절 없이 조인)잘 안씀
-- equl join  (where 등가연산자 : =)
-- non equi join (where 범위연산자 : and , or )
-- self join (where 하나의 테이블을 사용한다)
-- out join  (where에 누락되는 데이터를 같이 조회하기위해 : (+) 적어준다)



select e.ename, e.sla, job, e. deptno,dname,loc
from emp e,dept d --테이블에 별칭
where e.deptno = d.deptno;
and sal >= 3000;



select *
from emp e,dept d
where e.deptno = d.deptno;


select ename , sal , grade
from emp e , salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal; 


-- 사번 , 이름 , 급여 , 부서번호 , 부서명 , 급여등급
-- emp                 dept              salgrade

select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m     --반드시 별칭부여
where e.mgr = m.empno;

--20번에 근무하는 사원
select ename, deptno
from emp
where deptno = 20;

--scott 과 같은 부서에 근무하는 사원     'self 조인'
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

-- 외부조인
-- 등가시 누락되는 데이터를 같이 조회 하기 위해서 사용한다.


select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m     --반드시 별칭부여
where e.mgr = m.empno(+);    --데이터가 없는 테이블에 +를 붙인다 (데이터 누락 방지)

select ename,sal, d.deptno, dname
from emp e , dept d
where e.deptno(+) = d.deptno;

--ANSI JOIN(표준조인 방식)
--inner join(equi, non equi, self
--outer join( (+) ) // [left, right, full} outer join



select ename, sal, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename, sal, dname, loc
from emp e inner join dept d
using(deptno)    --두 테이블의 컬럼명이 동일 할 경우 사용가능
where ename = 'SCOTT'


select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno, ename, sal, grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;



select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m  -- 데이터가 있는 쪽을 지정한다
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

-- 서브쿼리
-- select 구문을 중첩해서 사용한다(where)
select ename, max(sal)
from emp;


--급여를 가장 많이 받는사람
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
-- 이름, 부서번호
select ename, deptno
from emp
where deptno =  (select deptno
                 from dept
                 where loc = 'DALLAS');
                 

-- 자신의 직속상관이 king인 사원의 이름과 급여를 조회하세요(subquery)
select ename, sal
from emp
where mgr = (select empno
             from emp
             where ename = 'KING');
             
select *
from emp 
where sal  in( select max(sal)
              from emp                   --다중행
              group by deptno);
       
       
 --다중행 서브쿼리
 -- in : 결과중에 하나만 만족하면된다.
 -- any : 결과중에 가장 작은값 보다 크면된다
 -- all : 결과중에 가장 큰값 보다 크면 된다.
       
select *
from emp 
where sal  >= any( select max(sal)
              from emp                   --가장 작은값 보다 큰값이면 모두 조회
              group by deptno);          --가장 큰값보다 작은값
              
              
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
       

--------------------------------------------------자습 서브쿼리
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
               
               
--------------------------------------자습 조인\

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


-- DML(데이터조작어) : insertm,update, delete


-- insert : 테이블에 데이터 삽입--
-- insert into 테이블명 (컬럼명1, 컬럼명2,,...)
-- values (값1,값2,........)
-- 컬럼과 값의 타입과 갯수가 일치해야한다.
-- 작성 순서대로 1 : 1 매칭된다.

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp(deptno, dname, loc)
values (50, 'DATABASE', 'SEOUL');


insert into dept_temp(deptno, dname) --묵시적 null 데이터 삽입
values (60, 'JSP');

insert into dept_temp --컬럼생략 (생략하면 값 전체를 다 넣어줘야한다 values에)
values (70, 'HTML', 'JSP');

insert into dept_temp  --  컬럼생략 , 명시적 null데이터 삽입
values (80, NULL , 'SEOUL');

drop table emp_temp;

create table emp_temp
as 
select * from emp
where 1 != 1;

select*
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'정종규','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'규종정','MANAGER',9999,sysdate,4000,NULL,30);

-- update : 컬럼의 데이터를 변경(수정)--
-- update 테이블명
-- set 컬럼명 = 값, 컬럼명 = 값, ......
-- where 조건식
-- 조건절을 사용하지 않으면 해당 컬럼이 모두 변견된다.--

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


-- delete(데이터 삭제)--
-- delete from 테이블명
-- where 조건식
-- 조건식을 사용하지 않으면 모든데이터가 다 사라진다

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

-- TCL(데이터의 영구저장 또는 취소)
-- 트랜잭션
-- commit, rollback, savepoint
-- commit : 데이터 영구 저장(테이블이 데이터 반영)
--          create구문을 사용해서 객체생성할때(자동)
-- rollback : 데이터 변경 취소(테이블이 데이터 미 반영) 원상복귀
--           천제지변,전기,전쟁(자동롤백)


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

--commit; 데이터 삭제된 지점이라 롤백해도 데이터는 삭제 되어있다.
rollback;


-- 트랜잭션 적용 유무

--truncate table dept01;    

--delete from dept01;   commit rollbak 이불가능하다    

truncate table dept01;

rollback;




-- DDL(데이터 정의어) : table(모든객체)를 생성,삭제,변경하는 명령어
-- create(생성), alter(변경), drop(삭제)

create table 테이블명 ( --table(객체) 
      컬럼명1 타입,     -- column(속성)
      컬럼명2 타입,
      컬럼명3 타입
           
);

create table emp_ddl(
   --    사번,이름,직책,관리자,입사일,급여,성과급,부서번호
       empno number(4),
       ename varchar2(10),  -- byte
       job varchar2(9),
       mgr number(4),
       hiredate date,
       sal number(7,2),
       comm number(7,2),
       deptno number(2)
  );
  
create table dept_ddl   -- 테이블의 복사
as
select*from dept;

create table dept_30
as
select* from dept
where deptno = 30;
  

select *
from emp_ddl;

insert into emp_ddl
values (9999,'이순신','MANAGER',1111,sysdate,1000,null,10);

create table dept_m
as
select dname,loc
from dept;

create table dept_d
as
select*from dept
where 1!= 1;      -- 테이블의 구조만 복사한다. 데이터x

-- 테이블 변경(컬럼의 정보 수정)
-- 새로운 컬럼추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제
-- alter 

create table emp_alter
as
select*from emp;

select *
from emp_alter;

alter table emp_alter    --컬럼추가
add address varchar2(100);

alter table emp_alter     --컬럼이름 변경
rename column address to addr;  

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

--데이블삭제(객체삭제)DROP
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


--데이터 사전
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;


-- index(검색속도를 향상하기위해 사용 객체)
-- select 구문의 검색 속도를 향상시킨다.
-- 전체 레코드의 3% ~ 5% 정도일때
-- index객체를 컬럼에 생성해서 사용한다

create index 인덱스명
on 테이블명(컬럼명);



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


--index 객체를 생성전
select empno, ename
from emp01
where ename = 'bts';

create index idx_emp01_ename
on emp01(ename);

--index 객체를 생성 후 (더 빠름)
select empno, ename
from emp01
where ename = 'bts';

drop index idx_emp01_ename;

-- 테이블 삭제후 원복
-- show recyclebin;

show recyclebin;
-- 원복
flashback table emp_alter
to before drop;

-- 제약조건(무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는것
-- not null
-- nuique
-- primary key (기본키)
-- foreign key (참조키)   자식쪽에 fk키 설정한다.
-- 1. 부모와 자식의 관계를 가지는 테이블에 자식쪽 테이블에 컬럼을 설정한다.
-- 2. 부모쪽 테이블의 컬럼은 반드시 primary key또는 unique해야한다.
-- 3.null데이터를 허용한다.

-- check
-- defalut

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
values (1111, '돈까스', 'MANAGER', 30);

insert into emp02
values (2222, '돈까스', 'MANAGER', 30);

insert into emp02
values (null, '버거킹', 'SALSEMAN', 30);

insert into emp02
values (2222, '피자', 'MANAGER', 30);

delete from emp02;


select *
from emp02;


-----------------------------------복습 데이터추가하기


create table emp07(
 empno number(4) constraint emp07_empno_pk primary key,
 ename varchar2(9)constraint emp07_empno_nn not null,
 job varchar2(9),
 deptno number(2)constraint emp07_deptno_fk references dept07(deptno)
 );
 
 create table dept07(
   deptno number(2)constraint dept07_deptno_pk primary key,
   dname varchar2(20)constraint dept07_dname_nn not null,
   loc varchar2(20)constraint dept07_loc_nn not null
 );
 
 
 
-- 서브쿼리문을 사용한 데이터 삽입
insert into dept07
select * from dept;

 insert into emp07
 select empno,ename,job,deptno from emp;
 
 insert into emp07
 values(1111,'aaa','MANAGER',50);
 
 --ck
 create table emp08(
   empno number(4) primary key,
   ename varchar2(10) not null,
   sal number(7)constraint emp08_sal_ck check(sal between 500 and 5000),
   gender varchar2(2) constraint emp08_gender_ck check(gender in('M','F'))
 );
 
select *   -- 데이터 확인
from emp08;

insert into emp08
values (1111,'hong',1000,'M');

insert into emp08
values (2222,'hong',200,'M'); --ck 제약조건 위배 

insert into emp08
values (3333,'hong',1000,'A');

--defalut(기본값 지정)
create table dept08(
  deptno number(2)primary key,
  dname varchar2(10)not null,
  loc varchar2(15)default'SEOUL'  --기본값 seoul 지정
);

select *   -- 데이터 확인
from dept08;

insert into dept08(deptno,dname,loc)
values (20,'SALES','BUSAN');

-- 제약조건 설정방식
-- 컬럼 레벨의 설정 (not null은 컬럼 레벨에서만 가능)
-- 테이블 레벨의 설정(not null 을 적용할 수 없다)

create table emp09(
  empno number(4),
  ename varchar2(20)constraint emp09_ename_nn not null,
  job varchar2(20),
  deptno number(20),
  
  constraint emp09_empno_pk primary key(empno),
  constraint emp09_job_uk unique(job),
  constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
);

select *
from emp09;

insert into emp09
values (3333,'hong','PRESIDENT',80);

-- 복합키(기본키를 두개의 컬럼을 사용하는 경우)
-- 테이블 레벨 방식으로만 적용 가능
-- 1.테이블안에서 정의 하는 방식
-- 2.Alter 명령어 사용방식


create table member(
 name varcahr2(10)
 address varchar2(30),
 hphone varchar2(10),
 
 constraint member_name_adress_pk primary key(name,address)
);

create table emp10(
  empno number(4),
  ename varchar2(20),
  job varchar2(20),
  deptno number(20)

);
\
--add
alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_empno_fk foreign key(deptno) references dept(deptno);



--modufy
--not null은 변경의 개념(null -> not unll)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;

-- drop
-- 제약조건명(constraint) 또는 제약조건(primary key)
alter table emp10
drop constraint emp10_emp_pk;


create table emp11(
  empno number(4),
  ename varchar2(20),
  job varchar2(20),
  deptno number(20)

);
alter table emp11
add constraint emp11_empno_pk primary key(empno);

alter table emp11
add constraint emp11_empno_fk foreign key(deptno) references dept11(deptno);


create table dept11(
  deptno number(2),
  dname varchar2(10),
  loc varchar2(15)
  
);

alter table dept11
add constraint dept11_deptno_pk primary key(deptno);

insert into dept11
select*from dept11;

insert into emp11
select empno,ename,job,deptno
from emp;

delete from dept11
where deptno = 10;

alter table dept11
disable primary key cascade;

alter table dept11
drop primary key cascade;



select *
from dept11;

select *
from emp11;


create table dept_const(
  deptno number(2),
  dname varchar(14),
  loc varchar(13)

);
alter table dept_const
add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
add constraint deptconst_deptno_pk nuique(dname);




select*
from emp
where sal between 2000 and 3000;


select *
from emp
where ename like 'S%';

select * 
from emp
where ename not like '%AM%';

select ename,sal,sal*12+comm as annsal, comm
from emp;

select *
from emp
where MGR is not null;

select*
from emp
where sal > null
or comm is null;


select*
from emp
where ename like '%S';




SQL
--crud 
--create (insert) dml
--read(select) dql
--update dml
--delete dml

--뷰 테이블
-- 객체 : table,indexe, view
-- create or replace view 뷰테이블명(alias)
-- as
-- 서브쿼리(select)
-- with check option
-- with read only


create table dept_copy 
as
select * from dept;

create table emp_copy -- 복사되는 테이블은 제약조건이 안 넘어온다.
as
select* from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * 
from emp_copy; --14

select * 
from dept_copy;  --4


create or replace view emp_view30
as
select empno,ename,sal,depton
from emp_copy
where deptno = 30;


select*
from emp_view30;

insert into emp_view30 (empno, ename , sal)
values (1111,'hong', 1000, 30);


insert into emp_view30 (empno, ename , sal)
values (2222,'hong', 2000);

create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,enamem,sal,deptno
from emp_copy;

select *from emp_view;

select*
from emp_view
where_부서번호 = 20;

create or replace view emp_dept_view
as
select empnon, ename, sal, deptno, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno
orderby empno desc;

select 'Oracle',
lpad('oracle', 10, '#') as lpad_1,
rpad('oracle', 10, '*') as rpad_1,
lpad('oracle', 10) as lpad_2,
rpad('oracle', 10) as rpad_2
from dual;

select
rpad('907392-', 14, '*') as rpad_jmno,
rpad('010-1234-', 13, '*')as rpad_phone
from dual;

-- 모든 객체의 이름은 중복될 수 없다.

create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; -- 조건절의 컬럼을 수정하지 못하게 한다

update view_chk30
set deptno = 10;
-- 뷰의 wiht check option 위 조건에 위배된다

create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;  -- 모든 컬럼에 대한 cud 가 불가능(조회만 가능)

update view_read30
set deptno = 10;
-- 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.(insert,update,delete)

-- 뷰의 활용
-- TOP - N 조회하기
-- 입사일이 가장 빠른 5명의 사원을 조회
select * from emp;

select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

DESC emp;

select rownum, empno, ename, hiredate
from emp
where rownum <=5;



select rownum, empno, ename, hiredate
from emp
where rownum <= 5;
order by hiredate asc

create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

select rownum, empno, ename, hiredate
from view_hiredate
where rownum <=7;

select rownum, empno, ename, hiredate
from view_hiredate
where rownum between 2 and 5;   -- rownum을 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야한다.


create or replace view view_hiredate_rm
as
select rownum rm , empno,ename,hiredate
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >=2 and rm <=5;

-- 인라인뷰

select rm,empno, ename,hiredate
from (select rownum rm , empno,ename,hiredate
      from (select empno,ename,hiredate
            from emp
            order by hiredate asc
            )a
      )b
where rm >=2 and rm <= 5;      


-- 입사일이 가장 빠른 5명
select empno, ename , hiredate
from (select rownum rm , empno,ename,hiredate
      from (select empno,ename,hiredate
            from emp
            order by hiredate asc
            )a
      )b
where  rm <= 5;      


-- 시퀀스
-- 자동으로 번호를 증가시키는 기능수행
-- create, drop
-- nextval, currval


create sequence 시퀀스명
start with 시작값 -> 1
increment by 증가치 ->1
maxvalue 최대값 ->10의 1027
minvalue 최소값 ->10의 -1027


create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno, ename, hiredate from emp
where 1!=1;

select * from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);




