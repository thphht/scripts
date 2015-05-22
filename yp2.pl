#!/usr/bin/perl

## foo test foo
## git push test
## blah blah

use diagnostics;
use strict;

while(<>){
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
