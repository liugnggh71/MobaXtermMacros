prompt DROP TABLE EXP_IMP_TABLES;;
prompt COPY FROM dbsnmp/uC52tdnsSFG6H!@edwprd:1521/bdwprod TO dbsnmp/uC52tdnsSFG6H!@localhost:1521/cogtest CREATE EXP_IMP_TABLES(OWNER,TABLE_NAME) USING SELECT OWNER,TABLE_NAME FROM EXP_IMP_TABLES;
COPY FROM &DBSNMP CREATE EXP_IMP_TABLES(OWNER,TABLE_NAME) USING SELECT OWNER,TABLE_NAME FROM EXP_IMP_TABLES;
