#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
foreach $file (@filelist) {
		if ($file=~m/^PF.*/) {
		system("perl selection.pl $file > $file.selected.fa")
}
}
