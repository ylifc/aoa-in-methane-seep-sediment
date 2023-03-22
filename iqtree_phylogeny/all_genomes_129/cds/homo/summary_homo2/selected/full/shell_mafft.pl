#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
%hash=();
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
open OU, ">mafft_comd.sh";
foreach $file (@filelist) {
        if ($file =~ m/\_full/) {
                print OU "mafft --thread 64 $file > $file\.mafft\n";
	}
}
close DIR;

system("sh mafft_comd.sh");
system("mkdir mafft_result");
system("cp *.mafft mafft_result/");
