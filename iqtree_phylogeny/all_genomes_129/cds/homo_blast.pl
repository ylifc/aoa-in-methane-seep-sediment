#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}||die "can not open the dir";
@filelist = readdir DIR;
open OU, ">sh.sh";
foreach $file (@filelist) {
	if ($file=~m/\.fasta/) {
		print OU "diamond blastx -d /media/ylifc/hdd1/aoa-in-methane-seep-sediment-calculation_steps/iqtree_phylogeny/homo_70/79_homo -q $file -k 1 -e 0.0000000001 --threads 64 -o $file.homo.m8\n";
}
}
close DIR;
system("sh sh.sh");
system ("mkdir homo");
system("mv *.homo.m8 homo");
