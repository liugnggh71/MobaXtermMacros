use Net::FTP;

chdir("/home/oracle");
$ftp = Net::FTP->new("edwprd.bhcs.pvt", Debug => 0)
or die "Cannot connect to edwprd.bhcs.pvt: $@";
$ftp->login("oracle",'Papaya01')
or die "Cannot login ", $ftp->message;
$ftp->binary();
$ftp->cwd("/home/oracle")
or die "Cannot change working directory ", $ftp->message;
$ftp->get("DDBoost_AIX.tar");

mkdir("/u01/app/oracle/admin");
mkdir("/u01/app/oracle/admin/general");
mkdir("/u01/app/oracle/admin/general/scripts");

chdir("/u01/app/oracle/admin/general/scripts");

$ftp->ascii();
$ftp->cwd("/u01/app/oracle/admin/general/scripts");
$ftp->get("CONFIG_DDBoost_pwd_sample.ksh");
$ftp->get("CONFIG_DDBoost_pwd.ksh");
$ftp->get("point_ms03.ksh");
$ftp->get("point_sv03.ksh");

1;
