ps -ef | grep pmon |grep -v grep
ps -ef | grep pmon |grep -v grep| cut -d "_" -f3 | sort -f
