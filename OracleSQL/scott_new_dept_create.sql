DROP TABLE SCOTT.NEW_DEPT;
CREATE TABLE SCOTT.NEW_DEPT AS SELECT * FROM SCOTT.DEPT;
DELETE FROM SCOTT.NEW_DEPT WHERE DEPTNO=20;
INSERT INTO SCOTT.NEW_DEPT VALUES (50,'IT','HOUSTON');
commit;
