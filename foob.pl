#!/usr/bin/perl

use diagnostics;
use strict;

print "PID = $$\n";

while(<>){
  chomp;
  my $child = fork();

  if ($child > 0) { 
    ## parent process ##
    print "Parent process: PID=$$, child=$child\n";
    sleep 2;
    kill(9, $child);  # kill the child after two seconds #
  } 
  else {  
    ## child process ##
    my $ppid = getppid();
    print "Child process:  PID=$$, parent=$ppid\n";
    print "$_ is bound to: ";
    system("ypwhich $_");
  #  system("sleep 5");
    print "Child process $$ done\n";
  } 
}
