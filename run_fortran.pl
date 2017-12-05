#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use Math::BigFloat;

my $d = dirname(__FILE__);

my $random = 2;
my @ortho = (10,20,25,40,50,66,100,150,200,250,400,500,1000);
my @thick = (500,550,611,795,1100,1375,1833);


for ($a = 0; $a < scalar(@ortho); $a = $a + 1){	
	for ($b = 5; $b < 6; $b = $b + 1){
		print "\n\nTrial ", $random, " ", $a, "\n";
		system("nice -10 abaqus cae noGUI=main_fortran.py -- $random $ortho[$a] $thick[$b]");
	}
}
system("rm -rf $d/abaqus*");

