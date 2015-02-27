#!/usr/bin/perl -lw

use File::Find ;

@ARGV = qw (.) unless @ARGV;

$filename = "";
$newfilename = "";
$pass = 1;

sub format {
	my $word = @_[0];
 	$word =~ s/\&/\\\&/g;
    $word =~ s/\)/\\\)/g;
    $word =~ s/\(/\\\(/g;  
	return $word
}

sub lowcase_dir {

	$changes = 0;

	$filename  =   $_;
	
	$newfilename = $filename;
	$newfilename =~ tr/A-Z/a-z/;
	$newfilename =~ s/\s/\_/g;		
	$test_name = $newfilename;
	
	
	if ( -d ) {
		if ($test_name ne $filename) {	
			print "Formatting Dir: $filename\n\n";
			
			$newfilename = &format($newfilename);
			`mv \"$filename\" $newfilename`;
			$changes ++;
		}
	}

}

sub lowcase_file {
	
	$filename = $_;
    
	$newfilename = $filename;
    $newfilename =~ tr/A-Z/a-z/;
    $newfilename =~ s/\s/\_/g;              
	$test_name = $newfilename;    
	
	if ($test_name ne $filename) {
		print "FORMATTING $filename";

		$newfilename = &format($newfilename);
    	`mv \"$filename\" $newfilename`; 
	}
	
}


$changes = 1;
while ($changes > 0) {
	find (\&lowcase_dir, @ARGV);
	print "PASS: $pass \n-------------------";
	$pass ++; 
}
print "\n\n\nFILES_________________\n_________________";
find (\&lowcase_file, @ARGV);
