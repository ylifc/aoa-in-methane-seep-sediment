#!/usr/bin/perl -w
$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
$i=0;
open OU, ">hits_summary.txt";
foreach $file (@filelist) {
        if ($file =~ m/.m8/) {
		open IN, "<$file";
		$i=0;
		while (<IN>) {
			chomp;
			$i+=1;
		}

print OU "$file\t$i\n";
}
close IN;
}
close DIR;
close OU;

open II, "<hits_summary.txt";
open UU, ">qualified_list.txt";
while (<II>) {
	chomp;
	$hits=(split /\s+/,$_)[1];
	$file_name=(split /\s+/,$_)[0];
	if ($hits > 40) {
		print UU "$file_name\n";
		}
}
close II;
close UU;

open IU, "<qualified_list.txt";
$hash=();
$hash2=();
while ($file2=<IU>) {
	open IY, "<$file2";
	while ($ff=<IY>) {
		chomp $ff;
		chomp $file2;
		$contig=(split /\s+/,$ff)[0];
		$target=(split /\s+/,$ff)[1];
		$file2=~s/\.homo\.m8//;
#		print "$file2\n";
		$hash{$file2}=$contig;
		$hash2{$contig}=$target;
	}
}
close IU;
close IY;

$DIR_PATHH="../";
opendir DIRH, ${DIR_PATHH}|| die "can not open dir \"$DIR_PATHH\"\n";
@filelist3 = readdir DIRH;
open OUI, ">total_homo.fa";
foreach $file3 (@filelist3) {
	print "$file3\n";
	if ($hash{$file3}){
#	print "$file3\n";
	$file4="$DIR_PATHH/$file3";
	open IV, "$file4";
	$ii=0;
	while ($line=<IV>) {
		chomp $line;
		if ($line=~m/^>/) {
			$line2=$line;
			$line2=~s/>//;
			$line2=~s/ \#.*//;
		#	print "$line2\n";
			if (exists $hash2{$line2}) {
				print OUI "\n>$line2\_$hash2{$line2}\n";
				$ii=1;
			} else {
				$ii=0;
			} } 
		if ($line!~m/^>/) { 
			if ($ii==1) {
			print OUI "$line";
			} else { }}
}
close IV;
}
}
close OUI;

$iii=0;
foreach $kk (keys %hash2) {
open OUU, ">$hash2{$kk}";
open III, "<total_homo.fa";
	while ($line4 = <III>) {
		chomp $line4;
		if ($line4=~m/^>/) {
		if ($line4=~m/$hash2{$kk}/) {
			$iii=1;
			print OUU "\n$line4\n"
		} else {
			$iii=0;

		}}
		if ($line4!~m/^>/) {
		if ($iii==1) {
			print OUU "$line4";
		}
		}
}
close OUU;
}
system("mkdir summary_homo");
system("mv PF.* summary_homo/");
