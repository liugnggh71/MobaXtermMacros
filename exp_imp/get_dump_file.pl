use Net::FTP;
use Cwd qw(cwd);
my $dir = cwd;
my $glob         = '*.DMP';
my @remote_files;
my $file_count;
my $loop_count = 1;

print "$dir\n";

$ftp = Net::FTP->new("irvrad.bhcs.pvt", Debug => 0)
or die "Cannot connect to apxqa.bhcs.pvt: $@";
$ftp->login("GANGL_P",'GANGL100')
or die "Cannot login ", $ftp->message;
$ftp->binary();
$ftp->cwd("ORA1:[BCK]")
or die "Cannot change working directory ", $ftp->message;

while (1) {
    
  @remote_files = $ftp->ls($glob);

  $file_count = @remote_files;

  if ($file_count>1) {
     foreach my $file (@remote_files) {
        $ftp->get($file);

        print "Get and delete: $file\n";
        $ftp->delete($file);
        last;
    }
  }
  
  $loop_count = $loop_count +1;
  print "Loop count: $loop_count\n";

  sleep 5;

}

1;
