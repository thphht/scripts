#!/usr/bin/perl

use warnings;
use strict;

if (! @ARGV ) {
	print "Usage: ypcensus.pl <HOST FILE>\n";
	exit 1;
}

while ( <> ) {
		chomp;
		my $pid = fork();
		# don't want to kill the parent process
		if ( $pid != $$ ) {
			print "$_ is bound to: ";
			exec "ypwhich $_";
			exit 1;
		}
		# if the client hasn't responded yet, it's probably not a nis client
		sleep 2;
}
