export PS1="`whoami`@`/bin/hostname` [\$PWD]$ "
cd $ORACLE_HOME
d=`date +%Y_%m_%d_%H_%M_%S`
echo $d
ls -l | grep OPatch
# mv OPatch OPatch.$d
