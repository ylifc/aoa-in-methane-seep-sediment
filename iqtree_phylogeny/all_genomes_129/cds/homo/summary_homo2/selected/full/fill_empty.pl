#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}||die "can not open the dir";
@filelist = readdir DIR;
foreach $file (@filelist) {
        if ($file=~m/_full/) {
                open IN, "<$file";
		$i=0;
		while ($line=<IN>) {
			chomp $line;
			if ($line=~m/>/) {
				$i+=1;
			}
		}
		}
print "$file\t$i\n";
close IN;
}
close DIR;

