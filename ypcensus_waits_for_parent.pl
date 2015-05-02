#!/usr/bin/perl

use warnings;
use strict;

if (! @ARGV ) {
	print "Usage: ypcensus.pl <HOST FILE>\n";
	exit 1;
}

while ( <> ) {
	chomp;
	defined ( my $pid = fork() ) or die "cannot fork: $!";
	unless ($pid) {
		print "$_ is bound to: ";
		system "ypwhich  $_";
		sleep 2;
		system "kill -9 $pid";
		print "\n";

	}

waitpid($pid, 0);
}	
