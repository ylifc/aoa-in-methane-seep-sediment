#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
system("mkdir pseudo_log_summmary");
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
open OUT, ">sh_psedo_log_extract.sh";
@filelist = readdir DIR;
foreach $file (@filelist) {
        if ($file =~ m/pseudo$/) {
        print OUT "cp $file/*_log\.txt \./pseudo_log_summmary/\n";
        }
}
system("sh sh_psedo_log_extract.sh");

