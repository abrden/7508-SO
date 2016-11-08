#!/bin/perl

%hash = ("root", 1000, "Juan", 256, "Jose", 4000);

foreach $key (keys(%hash)) {
	print $hash{$key} . "\n";
}
