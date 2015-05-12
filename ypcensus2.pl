#!/usr/bin/perl

# ypcensus2.pl
# adapted from a simple shell script found in the O'Reilly book
# titled "Using NFS and NIS" on pg 317


use diagnostics;
use strict;

if ( ! @ARGV ) {
    print "Usage: $0 <list of hostnames> \n";
    exit 1; 
    }

while(<>) {
    chomp;
    my $child = fork();

    if ($child == 0) { 
        print "$_ is bound to: ";
        system("ypwhich $_ 2> /dev/null");
        print "\n";
    	exit 1;
    } 
    else {  
    	sleep 2;
    	my $status = waitpid($child,1);
    	if ( $status >= 0 ) {
		system "kill $child 2> /dev/null";
    	}
	} 
}
