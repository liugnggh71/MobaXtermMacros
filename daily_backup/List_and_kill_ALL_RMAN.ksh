ps -ef | grep rman | grep -v grep | while read c1 c2 c3; do echo $c2; done
# ps -ef | grep rman | grep -v grep | while read c1 c2 c3; do kill -9 $c2; done
