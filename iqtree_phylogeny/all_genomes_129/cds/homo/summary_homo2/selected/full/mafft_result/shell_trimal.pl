#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
%hash=();
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
open OU, ">trimal_comd.sh";
foreach $file (@filelist) {
        if ($file =~ m/\.mafft$/) {
                print OU "trimal -in $file -out $file.trimal\n";
	}
}
close DIR;

system("sh trimal_comd.sh");
system("mkdir trimal_result");
system("cp *.trimal trimal_result/");
