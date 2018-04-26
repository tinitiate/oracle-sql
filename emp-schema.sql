-- creates some test-tables and data
-- DROP TABLE EMPLOYEE;
-- DROP TABLE DEPARTMENT;
-- DROP TABLE SALARYGRADE;
-- DROP TABLE BONUS;
-- DROP TABLE PROJECT;
-- DROP TABLE PROJECT_PARTICIPATION;
-- DROP TABLE ROLE;

--
-- Department Table
--
CREATE TABLE DEPARTMENT (
deptno     NUMBER NOT NULL,
name       VARCHAR2(14),
location   VARCHAR2(13)
);
-- Primary key
ALTER TABLE DEPARTMENT ADD CONSTRAINT dept_pk PRIMARY KEY (deptno);


--
-- Employee Table
--
CREATE TABLE EMPLOYEE (
empno      NUMBER NOT NULL,
name       VARCHAR2(10),
job        VARCHAR2(9),
boss       NUMBER,
hiredate   VARCHAR2(12),
salary     NUMBER(7, 2),
comm       NUMBER(7, 2),
deptno     NUMBER
);
-- Primary Key
ALTER TABLE EMPLOYEE ADD CONSTRAINT emp_pk PRIMARY KEY (empno);
-- Foreign Key
ALTER TABLE EMPLOYEE ADD CONSTRAINT department 
FOREIGN KEY (deptno) REFERENCES DEPARTMENT (deptno);
-- Foreign Key
ALTER TABLE EMPLOYEE ADD CONSTRAINT boss FOREIGN KEY (boss)
REFERENCES EMPLOYEE (empno);


--
-- SalaryGrade Table
--
CREATE TABLE SALARYGRADE (
grade      NUMBER NOT NULL,
losal      NUMBER NOT NULL,
hisal      NUMBER NOT NULL
);
--  Primary key
ALTER TABLE SALARYGRADE ADD CONSTRAINT salgrade_pk PRIMARY KEY (grade);


--
-- Bonus Table
--
CREATE TABLE BONUS (
ename      VARCHAR2(10) NOT NULL,
job        VARCHAR2(9) NOT NULL,
sal        NUMBER(7, 2),
comm       NUMBER(7, 2)
);
-- Primary key
ALTER TABLE BONUS ADD CONSTRAINT bonus_pk PRIMARY KEY (ename, job);


--
-- Project Table
--
CREATE TABLE PROJECT (
projectno    NUMBER NOT NULL,
description  VARCHAR2(100),
start_date   VARCHAR2(12),
end_date     VARCHAR2(12)
);
-- Primary key
ALTER TABLE PROJECT ADD CONSTRAINT project_pk PRIMARY KEY (projectno);


--
-- Role Table
--
CREATE TABLE ROLE (
role_id      NUMBER NOT NULL,
description  VARCHAR2(100)
);
-- Primary key
ALTER TABLE ROLE  ADD CONSTRAINT role_pk PRIMARY KEY (role_id);


--
-- Project_Participation Table
--
CREATE TABLE PROJECT_PARTICIPATION (
projectno    NUMBER NOT NULL,
empno        NUMBER NOT NULL,
start_date   DATE NOT NULL,
end_date     VARCHAR2(12),
role_id      NUMBER
);
-- Primary key
ALTER TABLE PROJECT_PARTICIPATION ADD CONSTRAINT participation_pk
PRIMARY KEY (projectno, empno, start_date);
-- Foreign Key
ALTER TABLE PROJECT_PARTICIPATION ADD CONSTRAINT employee FOREIGN KEY (empno)
REFERENCES EMPLOYEE (empno);
-- Foreign Key
ALTER TABLE PROJECT_PARTICIPATION ADD CONSTRAINT project FOREIGN KEY (projectno)
REFERENCES PROJECT (projectno);
-- Foreign Key
ALTER TABLE PROJECT_PARTICIPATION ADD CONSTRAINT role FOREIGN KEY (role_id)
REFERENCES ROLE (role_id);



-- data
INSERT INTO DEPARTMENT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPARTMENT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPARTMENT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPARTMENT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMPLOYEE VALUES (7839, 'KING',   'PRESIDENT', NULL, to_date('19811117','yyyymmdd'), 5000, NULL, 10);
INSERT INTO EMPLOYEE VALUES (7566, 'JONES',  'MANAGER',   7839, to_date('19810402','yyyymmdd'), 2975, NULL, 20);
INSERT INTO EMPLOYEE VALUES (7788, 'SCOTT',  'ANALYST',   7566, to_date('19821209','yyyymmdd'), 3000, NULL, 20);
INSERT INTO EMPLOYEE VALUES (7876, 'ADAMS',  'CLERK',     7788, to_date('19830112','yyyymmdd'), 1100, NULL, 20);
INSERT INTO EMPLOYEE VALUES (7902, 'FORD',   'ANALYST',   7566, to_date('19811203','yyyymmdd'), 3000, NULL, 20);
INSERT INTO EMPLOYEE VALUES (7369, 'SMITH',  'CLERK',     7902, to_date('19801217','yyyymmdd'), 800,  NULL, 20);
INSERT INTO EMPLOYEE VALUES (7698, 'BLAKE',  'MANAGER',   7839, to_date('19810501','yyyymmdd'), 2850, NULL, 30);
INSERT INTO EMPLOYEE VALUES (7499, 'ALLEN',  'SALESMAN',  7698, to_date('19810220','yyyymmdd'), 1600,  300, 30);
INSERT INTO EMPLOYEE VALUES (7521, 'WARD',   'SALESMAN',  7698, to_date('19810222','yyyymmdd'), 1250,  500, 30);
INSERT INTO EMPLOYEE VALUES (7654, 'MARTIN', 'SALESMAN',  7698, to_date('19810928','yyyymmdd'), 1250, 1400, 30);
INSERT INTO EMPLOYEE VALUES (7844, 'TURNER', 'SALESMAN',  7698, to_date('19810908','yyyymmdd'), 1500,    0, 30);
INSERT INTO EMPLOYEE VALUES (7900, 'JAMES',  'CLERK',     7698, to_date('19811203','yyyymmdd'), 950,  NULL, 30);
INSERT INTO EMPLOYEE VALUES (7782, 'CLARK',  'MANAGER',   7839, to_date('19810609','yyyymmdd'), 2450, NULL, 10);
INSERT INTO EMPLOYEE VALUES (7934, 'MILLER', 'CLERK',     7782, to_date('19820123','yyyymmdd'), 1300, NULL, 10);

INSERT INTO SALARYGRADE VALUES (1,  700, 1200);
INSERT INTO SALARYGRADE VALUES (2, 1201, 1400);
INSERT INTO SALARYGRADE VALUES (3, 1401, 2000);
INSERT INTO SALARYGRADE VALUES (4, 2001, 3000);
INSERT INTO SALARYGRADE VALUES (5, 3001, 9999);

INSERT INTO ROLE VALUES (100, 'Developer');
INSERT INTO ROLE VALUES (101, 'Researcher');
INSERT INTO ROLE VALUES (102, 'Project manager');

INSERT INTO PROJECT VALUES (1001, 'Development of Novel Magnetic Suspension System', to_date('20060101','yyyymmdd'), to_date('20070813','yyyymmdd'));
INSERT INTO PROJECT VALUES (1002, 'Research on thermofluid dynamics in Microdroplets', to_date('20060822','yyyymmdd'), to_date('20070320','yyyymmdd'));
INSERT INTO PROJECT VALUES (1003, 'Foundation of Quantum Technology', to_date('20070224','yyyymmdd'), to_date('20080731','yyyymmdd'));
INSERT INTO PROJECT VALUES (1004, 'High capacity optical network', to_date('20080101','yyyymmdd'), null);

INSERT INTO PROJECT_PARTICIPATION VALUES (1001, 7902, to_date('20060101','yyyymmdd'), to_date('20061230','yyyymmdd'), 102);
INSERT INTO PROJECT_PARTICIPATION VALUES (1001, 7369, to_date('20060101','yyyymmdd'), to_date('20070813','yyyymmdd'), 100);
INSERT INTO PROJECT_PARTICIPATION VALUES (1001, 7788, to_date('20060515','yyyymmdd'), to_date('20061101','yyyymmdd'), 100);

INSERT INTO PROJECT_PARTICIPATION VALUES (1002, 7876, to_date('20060822','yyyymmdd'), to_date('20070320','yyyymmdd'), 102);
INSERT INTO PROJECT_PARTICIPATION VALUES (1002, 7782, to_date('20060822','yyyymmdd'), to_date('20070320','yyyymmdd'), 101);
INSERT INTO PROJECT_PARTICIPATION VALUES (1002, 7934, to_date('20070101','yyyymmdd'), to_date('20070320','yyyymmdd'), 101);

INSERT INTO PROJECT_PARTICIPATION VALUES (1003, 7566, to_date('20070224','yyyymmdd'), to_date('20080731','yyyymmdd'), 102);
INSERT INTO PROJECT_PARTICIPATION VALUES (1003, 7900, to_date('20070224','yyyymmdd'), to_date('20070131','yyyymmdd'), 101);

INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7499, to_date('20080101','yyyymmdd'), null, 102);
INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7521, to_date('20080501','yyyymmdd'), null, 101);
INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7654, to_date('20080415','yyyymmdd'), null, 101);
INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7844, to_date('20080201','yyyymmdd'), null, 101);
INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7900, to_date('20080301','yyyymmdd'), to_date('20080401','yyyymmdd'), 101);
INSERT INTO PROJECT_PARTICIPATION VALUES (1004, 7900, to_date('20080520','yyyymmdd'), null, 101);

commit;
