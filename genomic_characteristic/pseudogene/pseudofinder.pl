#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
open OUT, ">sh_psedo.sh";
@filelist = readdir DIR;
foreach $file (@filelist) {
        if ($file =~ m/\.fa$/) {
	push (@files,$file);
	print OUT "pseudofinder.py annotate -g $file\_prokka/PROKKA_*.gbk -db /media/ylifc/HD-LXU3/NR_database/nr -op $file\_annotation --diamond -t 64\n";
	}
}
close DIR;
system ("sh sh_psedo.sh");
foreach $file2 (@files) {
		system ("mkdir $file2\_pseudo");
		system ("mv $file2\_annotation_* $file2\_pseudo/");
}
