export ORACLE_HOME=/u01/app/oracle/agent/core/12.1.0.5.0
export ORACLE_BASE=/u01/app/oracle
export PATH=$ORACLE_HOME/bin:$PATH
emctl start agent
emctl status agent
