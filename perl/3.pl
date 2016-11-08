#!/bin/perl

@array = (1, 2, 3, "testing", "for", "sentences");

print "Array size: " . ($#array+1) . "\n"; 

for ($i = 0; $i <= $#array ; $i++) {
	print $array[$i] . "\n";
}
