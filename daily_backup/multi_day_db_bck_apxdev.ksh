#!/bin/sh
# multi_day_db_bck.ksh
# 2 vairables to modify: PART_COUNT, and ORACLE_SID

export PART_COUNT=3
export ORACLE_SID=apxdev

MY_PATH="`dirname \"$0\"`"
echo "$MY_PATH"
cd $MY_PATH

DATE=`date '+%Y_%m_%d_%H_%M_%S'`
me=`basename $0 .ksh`
log=${me}.${DATE}.logs

export PATH=/usr/local/bin:$PATH
export ORAENV_ASK=NO
. oraenv
sqlplus /nolog @gen_multi_day_db_bck.sql $PART_COUNT
rman << EOF > log/$log 2>&1
connect target
@multi_day_db_bck.rman
EOF

find log -type f -mtime +100 -name $me\*.logs | xargs rm
