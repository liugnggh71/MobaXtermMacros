rman << EOC
connect target
backup current controlfile;
exit
EOC
