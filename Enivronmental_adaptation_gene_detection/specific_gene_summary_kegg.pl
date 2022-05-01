#!/usr/bin/perl -w
use warnings;
%hash=();
%hash2=();
open IN, "$ARGV[0]";
while ($line=<IN>) {
	chomp $line;
	$ko=(split /\s+/,$line)[0];
	$ano=(split /\s+/,$line)[2];
	$hash{$ko}=$ano;
	}
close IN;

open II, "$ARGV[1]";
while ($ll=<II>) {
	chomp $ll;
	$ko2=(split /\s+/,$ll)[1];
	if ($hash{$ko2}) {
		$hash2{$ko2}+=1;
	}
	}
close II;
foreach $oo (keys %hash2) {
		print "$oo\t$hash{$oo}\t$hash2{$oo}\n";
	}
