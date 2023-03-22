#!/usr/bin/perl -w
use warnings;
open IN, "<$ARGV[0]";
while ($line=<IN>) {
	chomp $line;
	$hash{$line}=1;
	}
close IN;

open II, "<$ARGV[1]";
while ($line2=<II>) {
	chomp $line2;
	if (exists $hash{$line2}) {
	} else {
		print "$line2\n";
	}
}
close II;
