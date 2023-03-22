#!/usr/bin/perl -w
use warnings;

$DIR_PATH2="./";
%hash4=();
%hash5=();
opendir DIR2, ${DIR_PATH2}|| die "can not open dir \"$DIR_PATH2\"\n";
@filelist2 = readdir DIR2;
foreach $file2 (@filelist2) {
        if ($file2 =~ m/selected\.fa$/) {
		open IV, "$DIR_PATH2/$file2";
		while ($lll=<IV>) {
			chomp $lll;
			if ($lll=~m/>/) {
			$hash4{$lll}+=1;
			$hash5{$file2}+=1;
			push (@{$lll},$file2);
		}
	}
print "$file2 contain $hash5{$file2} homologenes\n";
}
close IV;
}

#$homo_genes_num=70;#need to be revised
open OOOO, ">summary_of_genome_matched_homologenes.txt";
foreach $lll2 (keys %hash4) {
		print "\n";
		print OOOO "$lll2\t";
		foreach $val (@{$lll2}) {
			print OOOO "$val\t";
}
}
