#!/bin/sh 
# 00,15,30,45 * * * * /u01/app/oracle/admin/general/scripts/restart_oracle_agent.ksh > /u01/app/oracle/admin/general/scripts/restart_oracle_agent.log 2>&1

agent_process_count="$(ps -ef | grep 12.1.0.5.0 | grep java | wc -l)"
 
if [ $agent_process_count -lt 1 ]
then
export ORACLE_HOME=/u01/app/oracle/agent/core/12.1.0.5.0
export ORACLE_BASE=/u01/app/oracle
export PATH=$ORACLE_HOME/bin:$PATH
emctl start agent
emctl status agent
fi
