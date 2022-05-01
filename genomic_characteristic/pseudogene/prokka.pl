#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
open OU, ">sh.sh";
foreach $file (@filelist) {
        if ($file =~ m/.fa/) {
	print OU "prokka --cpus 0 --compliant --rfam $file --outdir $file\_prokka\n";
	}
}
close DIR;
close OU;
system ("sh sh.sh");
