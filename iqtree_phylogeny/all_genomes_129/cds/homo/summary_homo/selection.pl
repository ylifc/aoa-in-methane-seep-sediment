open II, "$ARGV[0]";
        while ($yy=<II>) {
                chomp $yy;
                if ($yy=~m/>/) {
                $name=$yy;
		$name=~s/-contig.*//g;
            #   print "$name\n";
                $hash{$name}=1;
        } else {
                $len=length($yy);
                push (@{$name},$len);
                $com="$name\_$len";
               # print "$com\n";
                $hash2{$com}=$yy;
}
}
close II;
use List::Util qw/max
min/;
        foreach $nn (keys %hash) {
                $max_len=max@{$nn};
                $com2="$nn\_$max_len";
                print "$nn\n$hash2{$com2}\n";
        }
