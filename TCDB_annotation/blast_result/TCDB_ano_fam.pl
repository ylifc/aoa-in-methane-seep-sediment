#!/usr/bin/perl -w
use warnings; die "perl this.pl TCDB_annotation_txt TCDB_family ./folder\n";
%hash=();
%hash2=();
%hash3=();
%hash4=();
open IN, "<$ARGV[0]"; #annotation file
while ($line=<IN>) {
	chomp $line;
	$det=(split /\t/,$line)[2];
	$ano=(split /\t/,$line)[1];
	$ori=(split /\t/,$line)[0];
	$ano=~s/.*\|//;
	$ano=~s/ .*//;
	$family=$ano;
	$family=~s/\.[0-9]$//;
	$family=~s/\.[0-9]$//;
	$no=$ano;
	print "$no\n";
	print "$ano\n";
	$hash{$ori}=$no;
	$hash2{$ori}=$family;
	$hash4{$ori}=$det
	}
close IN;
open IN, "<$ARGV[1]"; #annotation file
while ($line2=<IN>) {
        chomp $line2;
        $ano2=(split /\t/,$line2)[1];
        $ori2=(split /\t/,$line2)[0];
        $hash3{$ori2}=$ano2;
        }
close IN;

$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
foreach $file (@filelist) {
        if ($file =~ m/\.m8$/) {
open II, "<$file";
open OU, ">$file\_TCDB_fam";
while ($line3=<II>) {
	chomp $line3;
	$contig=(split /\t/,$line3)[0];
	$ano3=(split /\t/,$line3)[1];
	$sco=(split /\t/,$line3)[10];
	if (exists $hash{$ano3}) {
		print OU"$contig\t$ano3\t$hash{$ano3}\t$hash2{$ano3}\t$hash3{$hash2{$ano3}}\t$hash4{$ano3}\t$sco\n";
	}
}
close II;
close OU;
}
}
